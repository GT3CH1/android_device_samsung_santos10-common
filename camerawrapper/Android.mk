LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils libcutils libgui libhidlbase

LOCAL_C_INCLUDES += \
    system/core/include \
    system/media/camera/include \
    system/core/base/include \
	frameworks/native/libs/nativebase/include \
	frameworks/native/libs/arect/include \
	system/libhidl/transport/token/1.0/utils/include \
	system/libhidl/base/include

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := camera.santos10
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
