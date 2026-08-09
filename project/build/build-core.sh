#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

echo "==> Preparing TechBench Core build"

WORKSPACE="$(prepare_workspace core)"

configure_live_build "${WORKSPACE}"

echo "==> Adding TechBench Core package lists"

cp \
    "${PROJECT_ROOT}/project/config/core/packages/"*.list.chroot \
    "${WORKSPACE}/config/package-lists/"

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
