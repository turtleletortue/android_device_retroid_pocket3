# Call device.mk (shared between CM/LineageOS & AOSP)
$(call inherit-product, device/retroid/pocket2plus/device.mk)

# Call tablet config
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Device branding
PRODUCT_BRAND := google
PRODUCT_DEVICE := pocket2plus
PRODUCT_MANUFACTURER := retroid
PRODUCT_MODEL := Retroid Pocket 2 Plus
PRODUCT_NAME := lineage_pocket2plus
PRODUCT_RELEASE_NAME := RetroidPocket2Plus

# Lineage Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/lineage

