# Call device.mk (shared between CM/LineageOS & AOSP)
$(call inherit-product, device/retroid/pocket3/device.mk)

# Call tablet config
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Device branding
PRODUCT_BRAND := google
PRODUCT_DEVICE := pocket3
PRODUCT_MANUFACTURER := retroid
PRODUCT_MODEL := Retroid Pocket 3
PRODUCT_NAME := lineage_pocket3
PRODUCT_RELEASE_NAME := RetroidPocket3
