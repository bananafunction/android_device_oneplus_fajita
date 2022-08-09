#!/usr/bin/env bash

# Apply patches to other repos
# Needs to be run from within repo and with envsetup sourced

PATCH_ROOT="$ANDROID_BUILD_TOP/device/oneplus/fajita/patches"

if [[ $# -eq 0 ]]
    then
    cd "$ANDROID_BUILD_TOP/system/core"
    git am "$PATCH_ROOT/0001-init-Weaken-property-override-security-for-the-init-_SysCore.patch"
    git am "$PATCH_ROOT/0002-init-workaround-SafetyNet-check_SysCore.patch"
    git am "$PATCH_ROOT/0003-init-add-vendor.-keys-to-spoof-safetynet_SysCore.patch"
    git am "$PATCH_ROOT/0004-init-Weaken-property-override-security-only-when-spo_SysCore.patch"
    git am "$PATCH_ROOT/0005-init-Only-set-safetynet-props-if-not-eng-build_SysCore.patch"
    git am "$PATCH_ROOT/0006-core-Add-more-props-for-snet-spoofing_SysCore.patch"
    git am "$PATCH_ROOT/0007-core-Don-t-spoof-props-in-recovery-mode_SysCore.patch"

    cd "$ANDROID_BUILD_TOP/device/oneplus/fajita"
    git am "$PATCH_ROOT/0001-fajita-use-fingerprint-of-Pixel-device.patch"

    cd "$ANDROID_BUILD_TOP/packages/apps/Updater"
    git am "$PATCH_ROOT/0001-Define-new-server-URL.patch"
    git am "$PATCH_ROOT/0002-Define-new-changelog-URL.patch"

    echo "Done."
    exit 1
else

    cd "$ANDROID_BUILD_TOP/system/core"
    git reset --hard HEAD~7
    
    cd "$ANDROID_BUILD_TOP/device/oneplus/fajita"
    git reset --hard HEAD~1

    cd "$ANDROID_BUILD_TOP/packages/apps/Updater"
    git reset --hard HEAD~2

    exit 1
fi
