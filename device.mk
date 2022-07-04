# Inherit products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Call full_base
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Launched with 9.0
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Add all product locales
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Vendor
$(call inherit-product-if-exists, vendor/retroid/pocket2plus/pocket2plus-vendor.mk)

# Vendor apps
$(call inherit-product-if-exists, vendor/retroid/apps/pocket2plus-apps.mk)

# Hidl
include $(LOCAL_PATH)/hidl.mk

# Fix symlinks
$(call inherit-product, $(LOCAL_PATH)/fixsymlinks/fixsymlinks.mk)

# Device .rc files
PRODUCT_PACKAGES += \
    init.common.rc \
    init.ram.rc \
    init.storage.rc \
    init.ums312_2h10.rc \
    init.ums312_2h10.usb.rc \
    ueventd.ums312_2h10.rc

# Device fstabs
PRODUCT_PACKAGES += \
    fstab.ums312_2h10 \
    fstab.enableswap

# Vendor Prop
include $(LOCAL_PATH)/vendor_prop.mk

# Audio
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.r_submix.default \
    libalsautils \
    tinymix 

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    libwifi-hal

# DRM
PRODUCT_PACKAGES += \
    libdrm 

# Misc.
PRODUCT_PACKAGES += \
    libnbaio_mono \
    libtinycompress \
    libtinycompress_util \
    libtinyxml

# GPS
PRODUCT_PACKAGES += \
    gps.default

# Thermal
PRODUCT_PACKAGES += \
    thermal.default

# Pservice **NEEDS** these
PRODUCT_PACKAGES += \
    libstdc++.vendor 

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/configstore@1.1.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/configstore@1.1.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy 

# Permissions (system)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \

# Permissions (vendor)
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.software.cts.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.cts.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
	frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \

# Recovery files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/ueventd.ums312_2h10.rc:root/ueventd.ums312_2h10.rc \
    $(LOCAL_PATH)/rootdir/init.ums312_2h10.usb.rc:root/init.recovery.ums312_2h10.rc

# Vendor default.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    camera.disable_zsl_mode=1 \
    sys.usb.controller=musb-hdrc.0.auto \

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/aosp

PRODUCT_PACKAGES += \
    libaudiopolicyengineconfigurable \
    libwifi-system \
    libft2
    
