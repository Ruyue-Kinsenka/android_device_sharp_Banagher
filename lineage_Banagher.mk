#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from Aquos device
#$(call inherit-product, device/sharp/Banagher/device.mk)

PRODUCT_BRAND := SHARP
PRODUCT_DEVICE := Banagher
PRODUCT_MANUFACTURER := SHARP
PRODUCT_NAME := lineage_Banagher
PRODUCT_MODEL := Banagher

PRODUCT_GMS_CLIENTID_BASE := android-sharp


