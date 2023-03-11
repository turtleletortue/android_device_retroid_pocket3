#!/bin/bash
# Copyright (C) 2021 The LineageOS Project

set -e

DEVICE=pocket3
VENDOR=retroid

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="${MY_DIR}/../../.."

HELPER="${LINEAGE_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

while [ "$1" != "" ]; do
    case $1 in
        -n | --no-cleanup )     CLEAN_VENDOR=false
                                ;;
        -s | --section )        shift
                                SECTION=$1
                                CLEAN_VENDOR=false
                                ;;
        * )                     SRC=$1
                                ;;
    esac
    shift
done

if [ -z "$SRC" ]; then
    SRC=adb
fi

function blob_fixup() {
    case "${1}" in
        vendor/bin/hw/vendor.unisoc.hardware.power-service)
            "${PATCHELF}" --replace-needed "libbinder.so" "libbinder-v30.so" "${2}"
            "${PATCHELF}" --replace-needed "libcutils.so" "libcutils-v30.so" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/proprietary-files.txt "$SRC"
extract "$MY_DIR"/proprietary-files-offline-charging-images.txt "$SRC"
extract "$MY_DIR"/proprietary-files-vendor.txt "$SRC"

"$MY_DIR"/setup-makefiles.sh
