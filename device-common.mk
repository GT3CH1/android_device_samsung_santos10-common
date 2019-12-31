#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/santos10-common

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Houdini
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libhoudini.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1

# Filesystem
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Video
PRODUCT_PACKAGES += \
    libshim_mds \
    libshim_drm \
    \
    libdrm \
    libgccdemangle \
    pvrsrvctl \
    \
    hdmi_helper

PRODUCT_PACKAGES += \
    libcorkscrew \
    libva \
    libva-android \
    libva-tpi \
    libwsbm

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    \
    ro.opengles.version=131072

# Audio
PRODUCT_PACKAGES += \
    audio.primary.clovertrail \
    audio.hdmi.clovertrail \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths_0.xml:system/etc/mixer_paths_0.xml

# Multimedia
PRODUCT_PACKAGES += \
    libstagefrighthw \
    \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    \
    libva_videodecoder \
    libva_videoencoder \
    \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoEncoderAVC \
    \
    pvr_drv_video

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/wrs_omxil_components.list:system/etc/wrs_omxil_components.list

# Camera
PRODUCT_PACKAGES += \
    libshim_camera \
    \
    camera.santos10

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera_profiles.xml:system/etc/camera_profiles.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true  \
    media.stagefright.less-secure=true

# Power
PRODUCT_PACKAGES += \
    power.clovertrail

# Wifi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_supplicant.conf \
    hostapd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Sensors
PRODUCT_PACKAGES += \
		sensors.santos10 \
    context_hub.default \
    android.hardware.sensors@1.0-impl \
    android.hardware.contexthub@1.0-impl \

# Lights
PRODUCT_PACKAGES += \
    lights.clovertrail

# IR
PRODUCT_PACKAGES += \
    consumerir.clovertrail

# GPS
PRODUCT_PACKAGES += \
    libshim_gps \
    \
    libsecril-client \
    libstlport

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# AdvancedSettings
PRODUCT_PACKAGES += \
    AdvancedSettings

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/sec_keyboard.idc:system/usr/idc/sec_keyboard.idc \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.santos10.rc:root/init.santos10.rc \
    $(LOCAL_PATH)/rootdir/init.santos10.usb.rc:root/init.santos10.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.santos10.rc:root/ueventd.santos10.rc \
    $(LOCAL_PATH)/rootdir/fstab.santos10:root/fstab.santos10

# Charger mode
PRODUCT_PACKAGES += \
    charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

PRODUCT_CHARACTERISTICS := tablet

# Boot animation
TARGET_SCREEN_WIDTH := 1280
TARGET_SCREEN_HEIGHT := 480

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

$(call inherit-product, vendor/samsung/santos10-common/santos10-common-vendor.mk)
