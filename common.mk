#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Add common symlinks definitions for Qualcomm
$(call soong_config_set,rfs,mpss_firmware_symlink_target,firmware_modem)
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Non-A/B device
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# API levels
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_SHIPPING_API_LEVEL)

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom.vendor_ramdisk \
    init.class_main.sh \
    init.mdm.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.recovery.qcom.rc \
    init.recovery.samsung.rc \
    init.samsung.bsp.rc \
    init.samsung.connector.rc \
    init.samsung.display.rc \
    init.samsung.dp.rc \
    init.samsung.power.rc \
    init.samsung.rc \
    init.target.rc \
    ueventd.odm.rc \
    ueventd.qcom.rc

# Partitions
PRODUCT_PACKAGES += \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint \
    vendor_firmware-modem_mountpoint \
    vendor_vm-system_mountpoint

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QTI
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/samsung \
    kernel/samsung/sm8650 \
    kernel/samsung/sm8650-modules

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/sm8650-common/sm8650-common-vendor.mk)
