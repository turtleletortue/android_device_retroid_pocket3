#!/bin/bash
# Copyright (C) 2021 The LineageOS Project

set -e

DEVICE=pocket2plus
VENDOR=retroid

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/tools/extract-utils/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT"

# Copyright headers and guards
write_headers "$DEVICE"

# The standard blobs
write_makefiles "$MY_DIR"/proprietary-files.txt true

# vendor blobs
write_makefiles "$MY_DIR"/proprietary-files-offline-charging-images.txt true

# offline charging images
write_makefiles "$MY_DIR"/proprietary-files-vendor.txt true

# We are done!
write_footers

