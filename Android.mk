LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),pocket2plus)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
include $(CLEAR_VARS)

KERNEL_OUT := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ

$(KERNEL_OUT):
	mkdir -p $(KERNEL_OUT)

endif
