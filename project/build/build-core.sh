#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

THEME_CONFIG="${PROJECT_ROOT}/project/config/core/themes/fluent.env"
GPU_VIEWER_CONFIG="${PROJECT_ROOT}/project/config/core/apps/gpu-viewer.env"

source "${THEME_CONFIG}"
source "${GPU_VIEWER_CONFIG}"

require_command() {
    local command_name="$1"

    if ! command -v "${command_name}" >/dev/null 2>&1; then
        echo "ERROR: Required build command not found: ${command_name}"
        exit 1
    fi
}

fetch_pinned_repo() {
    local repo="$1"
    local commit="$2"
    local destination="$3"

    git clone \
        --quiet \
        --filter=blob:none \
        "${repo}" \
        "${destination}"

    git -C "${destination}" \
        checkout \
        --quiet \
        --detach \
        "${commit}"

    local actual_commit
    actual_commit="$(git -C "${destination}" rev-parse HEAD)"

    if [[ "${actual_commit}" != "${commit}" ]]; then
        echo "ERROR: Git commit verification failed."
        echo "Expected: ${commit}"
        echo "Actual:   ${actual_commit}"
        exit 1
    fi
}

require_command git
require_command sassc
require_command meson
require_command ninja

echo "==> Preparing TechBench Core build"

WORKSPACE="$(prepare_workspace core)"

configure_live_build "${WORKSPACE}"

INCLUDES="${WORKSPACE}/config/includes.chroot"
THEME_SOURCE_DIR="${WORKSPACE}/theme-sources"
APP_SOURCE_DIR="${WORKSPACE}/app-sources"

mkdir -p \
    "${WORKSPACE}/config/package-lists" \
    "${INCLUDES}/etc/skel/.config/xfce4" \
    "${INCLUDES}/etc/xdg/autostart" \
    "${INCLUDES}/etc/xdg/menus" \
    "${INCLUDES}/usr/local/bin" \
    "${INCLUDES}/usr/share/applications" \
    "${INCLUDES}/usr/share/techbench/branding" \
    "${INCLUDES}/usr/share/themes" \
    "${INCLUDES}/usr/share/icons" \
    "${INCLUDES}/usr/share/doc/techbench/third-party" \
    "${THEME_SOURCE_DIR}" \
    "${APP_SOURCE_DIR}"

echo "==> Adding TechBench Core package lists"

cp \
    "${PROJECT_ROOT}/project/config/core/packages/"*.list.chroot \
    "${WORKSPACE}/config/package-lists/"

echo "==> Adding TechBench XFCE defaults"

cp -a \
    "${PROJECT_ROOT}/project/config/core/xfce/xfconf" \
    "${INCLUDES}/etc/skel/.config/xfce4/"

echo "==> Adding TechBench application menu"

install -m 0644 \
    "${PROJECT_ROOT}/project/config/core/menus/techbench-applications.menu" \
    "${INCLUDES}/etc/xdg/menus/techbench-applications.menu"

echo "==> Adding TechBench Testing launchers"

while IFS= read -r -d '' launcher; do
    install -m 0644 \
        "${launcher}" \
        "${INCLUDES}/usr/share/applications/$(basename "${launcher}")"
done < <(
    find "${PROJECT_ROOT}/project/testing" \
        -type f \
        -path '*/launchers/*.desktop' \
        -print0
)

echo "==> Adding TechBench Testing scripts"

while IFS= read -r -d '' test_script; do
    if [[ "$(basename "${test_script}")" == ".gitkeep" ]]; then
        continue
    fi

    install -m 0755 \
        "${test_script}" \
        "${INCLUDES}/usr/local/bin/$(basename "${test_script}")"
done < <(
    find "${PROJECT_ROOT}/project/testing" \
        -type f \
        -path '*/scripts/*' \
        -print0
)

echo "==> Adding TechBench Core launchers"

if compgen -G "${PROJECT_ROOT}/project/config/core/launchers/*.desktop" >/dev/null; then
    for launcher in "${PROJECT_ROOT}/project/config/core/launchers/"*.desktop; do
        install -m 0644 \
            "${launcher}" \
            "${INCLUDES}/usr/share/applications/$(basename "${launcher}")"
    done
fi

echo "==> Adding TechBench Wi-Fi initializer"

install -m 0755 \
    "${PROJECT_ROOT}/project/config/core/network/techbench-wifi-init" \
    "${INCLUDES}/usr/local/bin/techbench-wifi-init"

install -m 0644 \
    "${PROJECT_ROOT}/project/config/core/xfce/autostart/techbench-wifi-init.desktop" \
    "${INCLUDES}/etc/xdg/autostart/techbench-wifi-init.desktop"

echo "==> Adding TechBench wallpaper initializer"

install -m 0755 \
    "${PROJECT_ROOT}/project/config/core/xfce/scripts/techbench-wallpaper-init" \
    "${INCLUDES}/usr/local/bin/techbench-wallpaper-init"

install -m 0644 \
    "${PROJECT_ROOT}/project/config/core/xfce/autostart/techbench-wallpaper.desktop" \
    "${INCLUDES}/etc/xdg/autostart/techbench-wallpaper.desktop"

echo "==> Adding TechBench branding"

install -m 0644 \
    "${PROJECT_ROOT}/res/img/wallpaper/techbench-dark-wallpaper.jpg" \
    "${INCLUDES}/usr/share/techbench/branding/techbench-dark-wallpaper.jpg"

install -m 0644 \
    "${PROJECT_ROOT}/res/img/logo/techbench-logo.png" \
    "${INCLUDES}/usr/share/techbench/branding/techbench-logo.png"

install -m 0644 \
    "${PROJECT_ROOT}/res/img/logo/techbench-home.png" \
    "${INCLUDES}/usr/share/techbench/branding/techbench-home.png"

echo "==> Fetching pinned GPU-Viewer ${GPU_VIEWER_VERSION}"

fetch_pinned_repo \
    "${GPU_VIEWER_REPO}" \
    "${GPU_VIEWER_COMMIT}" \
    "${APP_SOURCE_DIR}/GPU-Viewer"

echo "==> Installing GPU-Viewer ${GPU_VIEWER_VERSION}"

(
    cd "${APP_SOURCE_DIR}/GPU-Viewer"

    meson setup \
        _build \
        --prefix=/usr \
        --buildtype=release

    ninja -C _build

    DESTDIR="${INCLUDES}" \
        ninja -C _build install
)

# TechBench provides its own descriptive "GPU Information" launcher.
# Hide the upstream GPU-Viewer menu entry to avoid duplicate/confusing names.
rm -f \
    "${INCLUDES}/usr/share/applications/io.github.arunsivaramanneo.GPUViewer.desktop"

echo "==> Preserving GPU-Viewer license information"

mkdir -p \
    "${INCLUDES}/usr/share/doc/techbench/third-party/GPU-Viewer"

install -m 0644 \
    "${APP_SOURCE_DIR}/GPU-Viewer/LICENSE" \
    "${INCLUDES}/usr/share/doc/techbench/third-party/GPU-Viewer/LICENSE"

cat > "${INCLUDES}/usr/share/doc/techbench/third-party/GPU-Viewer/SOURCE" <<META
Project: GPU-Viewer
Repository: ${GPU_VIEWER_REPO}
Version: ${GPU_VIEWER_VERSION}
Commit: ${GPU_VIEWER_COMMIT}
License: GPL-3.0-or-later
META

echo "==> Fetching pinned Fluent GTK theme"

fetch_pinned_repo \
    "${FLUENT_GTK_REPO}" \
    "${FLUENT_GTK_COMMIT}" \
    "${THEME_SOURCE_DIR}/Fluent-gtk-theme"

echo "==> Installing Fluent-Dark-compact"

(
    cd "${THEME_SOURCE_DIR}/Fluent-gtk-theme"

    ./install.sh \
        -d "${INCLUDES}/usr/share/themes" \
        -c dark \
        -s compact
)

echo "==> Fetching pinned Fluent icon theme"

fetch_pinned_repo \
    "${FLUENT_ICON_REPO}" \
    "${FLUENT_ICON_COMMIT}" \
    "${THEME_SOURCE_DIR}/Fluent-icon-theme"

echo "==> Installing Fluent icons"

(
    cd "${THEME_SOURCE_DIR}/Fluent-icon-theme"

    ./install.sh \
        -d "${INCLUDES}/usr/share/icons" \
        standard
)

echo "==> Preserving Fluent license information"

mkdir -p \
    "${INCLUDES}/usr/share/doc/techbench/third-party/Fluent-gtk-theme" \
    "${INCLUDES}/usr/share/doc/techbench/third-party/Fluent-icon-theme"

install -m 0644 \
    "${THEME_SOURCE_DIR}/Fluent-gtk-theme/COPYING" \
    "${INCLUDES}/usr/share/doc/techbench/third-party/Fluent-gtk-theme/COPYING"

install -m 0644 \
    "${THEME_SOURCE_DIR}/Fluent-icon-theme/COPYING" \
    "${INCLUDES}/usr/share/doc/techbench/third-party/Fluent-icon-theme/COPYING"

cat > "${INCLUDES}/usr/share/doc/techbench/third-party/Fluent-gtk-theme/SOURCE" <<META
Project: Fluent GTK Theme
Repository: ${FLUENT_GTK_REPO}
Commit: ${FLUENT_GTK_COMMIT}
License: GPL-3.0
META

cat > "${INCLUDES}/usr/share/doc/techbench/third-party/Fluent-icon-theme/SOURCE" <<META
Project: Fluent Icon Theme
Repository: ${FLUENT_ICON_REPO}
Commit: ${FLUENT_ICON_COMMIT}
License: GPL-3.0
META

rm -rf \
    "${THEME_SOURCE_DIR}" \
    "${APP_SOURCE_DIR}"

echo "==> Building TechBench Core"

(
    cd "${WORKSPACE}"
    sudo lb build
)

ISO="${WORKSPACE}/live-image-amd64.hybrid.iso"

if [[ ! -f "${ISO}" ]]; then
    echo "ERROR: Expected ISO was not produced."
    exit 1
fi

cp "${ISO}" "${OUTPUT_DIR}/TechBench-Core-amd64.iso"

echo
echo "Build complete:"
ls -lh "${OUTPUT_DIR}/TechBench-Core-amd64.iso"
