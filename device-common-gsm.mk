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

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-gsm

# RIL
PRODUCT_PACKAGES += \
    libsecril-client-sap \
    SamsungServiceMode

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=Santos10RIL \
    rild.libargs=-d /dev/ttyS0 \
    rild.libpath=/system/vendor/lib/libsec-ril.so

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml