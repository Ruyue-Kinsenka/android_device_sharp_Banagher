#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/sharp/Banagher

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Banagher
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 640

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 \
                        earlycon=msm_geni_serial,0xa90000 \
                        androidboot.hardware=qcom \
                        androidboot.console=ttyMSM0 \
                        androidboot.memcg=1 \
                        lpm_levels.sleep_disabled=1 \
                        video=vfb:640x400,bpp=32,memsize=3072000 \
                        msm_rtb.filter=0x237 \
                        service_locator.enable=1 \
                        androidboot.usbcontroller=a600000.dwc3 \
                        swiotlb=2048 \
                        loop.max_part=7 \
                        cgroup.memory=nokmem,nosocket \
                        reboot=panic_warm \
                        buildvariant=user \
                        androidboot.selinux=permissive

TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_RAMDISK_OFFSET       := 0x01000000
NEED_KERNEL_MODULE_SYSTEM := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board ""
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := banagher_defconfig
TARGET_KERNEL_SOURCE := kernel/sharp/msm4.19

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
BANAGHER_PREBUILT := device/sharp/Banagher-prebuilt
TARGET_PREBUILT_KERNEL := $(BANAGHER_PREBUILT)/kernel
TARGET_PREBUILT_DTB := $(BANAGHER_PREBUILT)/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_PREBUILT_DTBOIMAGE := $(BANAGHER_PREBUILT)/dtbo.img

BOARD_ODM_KERNEL_MODULES += $(wildcard $(BANAGHER_PREBUILT)/modules/odm/*.ko)
BOARD_VENDOR_KERNEL_MODULES += $(wildcard $(BANAGHER_PREBUILT)/modules/vendor/*.ko)
PRODUCT_COPY_FILES += $(BANAGHER_PREBUILT)/dtb.img:dtb.img
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_SUPER_PARTITION_SIZE := 9126805504 
BOARD_SUPER_PARTITION_GROUPS := qualcomm_dynamic_partitions
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    odm \
    vendor \
    product \
    system_ext \
    system
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_SIZE := 9122611200 
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform
TARGET_BOARD_PLATFORM := kona

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 150
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-11-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current
BOARD_VENDOR := sharp

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kona
BUILD_WITHOUT_VENDOR := true
