LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := shdisp
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_C_INCLUDES := external/libcxx/include
LOCAL_SHARED_LIBRARIES := libc
LOCAL_SRC_FILES := shdisp.c
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := shtps_glove
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_C_INCLUDES := external/libcxx/include
LOCAL_SHARED_LIBRARIES := libc
LOCAL_SRC_FILES := shtps_glove.c
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := shtps_report
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_C_INCLUDES := external/libcxx/include
LOCAL_SHARED_LIBRARIES := libc
LOCAL_SRC_FILES := shtps_report.c
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin
include $(BUILD_EXECUTABLE)