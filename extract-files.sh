#!/bin/bash
# Copyright (C) 2021 The LineageOS Project

set -e

DEVICE=pocket2plus
VENDOR=retroid

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="${MY_DIR}/../../.."

HELPER="${LINEAGE_ROOT}/vendor/lineage/build/tools/extract_utils.sh"
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
        vendor/lib/hw/camera.ums312.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib64/hw/camera.ums312.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib/libcamdrv.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib64/libcamdrv.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib/libcamoem.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib64/libcamoem.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib/libispalg.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib64/libispalg.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib/hw/hwcomposer.ums312.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib64/hw/hwcomposer.ums312.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib/libWT.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libWT.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib/libbokeh_depth.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libbokeh_depth.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_deintl.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_h264dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_h264enc.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_h265dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_h265enc.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_mpeg4dec.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_mpeg4enc.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_vp9dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libstagefright_sprd_vpxdec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib/libtdnsTest.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_deintl.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_h264dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_h264enc.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_h265dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_h265enc.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_mpeg4dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_mpeg4enc.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_vp9dec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libstagefright_sprd_vpxdec.so)
            ./patchelf-0_9 --add-needed "libui-v28.so" "${2}"
            ;;
        vendor/lib64/libtdnsTest.so)
            ./patchelf-0_9 --replace-needed "libui.so" "libui-v28.so" "${2}"
            ;;
        vendor/lib/libsprdaudiohal.so)
            ./patchelf-0_9 --replace-needed "android.hardware.audio.common@4.0-util.so" "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib/libsprdaudiohal@4.0.so)
            ./patchelf-0_9 --replace-needed "android.hardware.audio.common@4.0-util.so" "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib64/libsprdaudiohal.so)
            ./patchelf-0_9 --replace-needed "android.hardware.audio.common@4.0-util.so" "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib64/libsprdaudiohal@4.0.so)
            ./patchelf-0_9 --replace-needed "android.hardware.audio.common@4.0-util.so" "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib/hw/android.hardware.audio@4.0-impl.so)
            ./patchelf-0_9 --add-needed "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib64/hw/android.hardware.audio@4.0-impl.so)
            ./patchelf-0_9 --add-needed "android.hardware.audio.common@4.0-util-v28.so" "${2}"
            ;;
        vendor/lib/hw/audio.primary.ums312.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
        vendor/lib64/hw/audio.primary.ums312.so)
            ./patchelf-0_9 --add-needed "libprocessgroup.so" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/proprietary-files.txt "$SRC"
extract "$MY_DIR"/proprietary-files-offline-charging-images.txt "$SRC"
extract "$MY_DIR"/proprietary-files-vendor.txt "$SRC"

"$MY_DIR"/setup-makefiles.sh
