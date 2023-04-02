DEVICE_PATH := device/retroid/pocket3

# Inherit from t310-common
include device/retroid/t310-common/BoardConfigCommon.mk

# Prebuilt 2plus kernel
TARGET_PREBUILT_KERNEL := device/retroid/pocket3/prebuilt/kernel

# Kernel and recoveryimage generation
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS += --base 0x00000000
BOARD_MKBOOTIMG_ARGS += --pagesize 2048
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x05400000
BOARD_MKBOOTIMG_ARGS += --tags_offset 0x00000100
BOARD_MKBOOTIMG_ARGS += --kernel_offset 0x00008000
BOARD_MKBOOTIMG_ARGS += --second_offset 0x00000000
BOARD_MKBOOTIMG_ARGS += --dtb_offset 0x01f00000
BOARD_MKBOOTIMG_ARGS += --header_version 2
BOARD_MKBOOTIMG_ARGS += --cmdline "console=ttyS1,115200n8 buildvariant=user androidboot.selinux=permissive enforcing=0"
BOARD_MKBOOTIMG_ARGS += --dtb $(PRODUCT_OUT)/dtb.img

# Recovery fstab
TARGET_RECOVERY_FSTAB := device/retroid/pocket3/recovery/recovery.fstab
BOARD_SUPPRESS_EMMC_WIPE := true

# Bootanimation rotated for pocket3 screen
TARGET_BOOTANIMATION := device/retroid/pocket3/bootanimation/bootanimation-rotated.zip

# Bootanimation generation
TARGET_SCREEN_HEIGHT := 750
TARGET_SCREEN_WIDTH := 1334

# Display
TARGET_SCREEN_DENSITY := 266

# System prop
TARGET_SYSTEM_PROP += device/retroid/pocket3/system.prop

