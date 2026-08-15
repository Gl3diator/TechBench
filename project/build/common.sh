#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

WORK_DIR="${PROJECT_ROOT}/.build"
OUTPUT_DIR="${PROJECT_ROOT}/out"

DISTRIBUTION="trixie"
ARCHITECTURE="amd64"

prepare_workspace() {
    local profile="$1"
    local workspace="${WORK_DIR}/${profile}"

    if [[ -d "${workspace}" ]]; then
        sudo rm -rf -- "${workspace}"
    fi

    mkdir -p "${workspace}/config/package-lists"
    mkdir -p "${OUTPUT_DIR}"

    echo "${workspace}"
}

configure_live_build() {
    local workspace="$1"

    (
        cd "${workspace}"

        lb config \
            --distribution "${DISTRIBUTION}" \
            --architectures "${ARCHITECTURE}" \
            --binary-images iso-hybrid \
            --iso-volume "TechBench" \
            --archive-areas "main non-free-firmware" \
            --memtest memtest86+ \
            --apt-recommends false
    )
}
