#!/usr/bin/env bash

# Apply patches to other repos
# Needs to be run from within repo and with envsetup sourced

PATCH_ROOT="$ANDROID_BUILD_TOP/device/oneplus/fajita/patches"

if [[ $# -eq 0 ]]
    then
    cd "$ANDROID_BUILD_TOP/frameworks/base"
    git am "$PATCH_ROOT/0001-Spoof-build-fingerprint-for-Google-Play-Services_FraBase.patch"
    git am "$PATCH_ROOT/0002-keystore-Block-key-attestation-for-SafetyNet_FraBase.patch"
    git am "$PATCH_ROOT/0003-Limit-SafetyNet-workarounds-to-unstable-GMS-process_FraBase.patch"
    git am "$PATCH_ROOT/0004-gmscompat-Make-CTS-Play-Integrity-pass-again.patch"
    git am "$PATCH_ROOT/0005-gmscompat-Get-package-name-from-context-instead-of-a.patch"

    cd "$ANDROID_BUILD_TOP/system/core"
    git am "$PATCH_ROOT/0001-tighten-up-mount-permissions_SysCore.patch"
    git am "$PATCH_ROOT/0002-enable-kernel-mitigations-for-link-races_SysCore.patch"
    git am "$PATCH_ROOT/0003-enable-kernel-mitigations-for-file-spoofing_SysCore.patch"
    git am "$PATCH_ROOT/0004-libfs_avb-Disable-dm-verity-when-AVB-is-permissive_SysCore.patch"
    git am "$PATCH_ROOT/0005-init-Report-valid-verified-boot-for-SafetyNet-checks_SysCore.patch"
    git am "$PATCH_ROOT/0006-init-Don-t-spoof-SafetyNet-properties-in-recovery-mo_SysCore.patch"
    git am "$PATCH_ROOT/0007-init-Weaken-property-override-security-for-the-init_SysCore.patch"
    git am "$PATCH_ROOT/0008-init-Add-more-properties-to-spoof_SysCore.patch"
    git am "$PATCH_ROOT/0009-init-Do-not-set-safety-net-props-for-ENG-builds_SysCore.patch"
    git am "$PATCH_ROOT/0010-init-Update-properties-for-snet-spoof_SysCore.patch"

    cd "$ANDROID_BUILD_TOP/packages/apps/Updater"
    git am "$PATCH_ROOT/0001-Define-new-server-URL_Updater.patch"
    git am "$PATCH_ROOT/0002-Define-new-changelog-URL_Updater.patch"

#    cd "$ANDROID_BUILD_TOP/device/oneplus/fajita"
#    git am "$PATCH_ROOT/0001-fajita-update-fingerprint-patch-to-match-SPL.patch"

    cd "$ANDROID_BUILD_TOP/packages/apps/Settings"
    git am "$PATCH_ROOT/0001-Settings-Show-full-proc-version-information.patch"
    git am "$PATCH_ROOT/0002-Settings-Change-kernel-preference-behavior.patch"
    git am "$PATCH_ROOT/0003-Make-kernel-version-clickable.patch"

    cd "$ANDROID_BUILD_TOP/build/core"
    git am "$PATCH_ROOT/0001-Make-build-ID-simple.patch"
#    git am "$PATCH_ROOT/0002-system-core-update-BUILD_ID.patch"

    echo "Done."
    exit 1
else
    cd "$ANDROID_BUILD_TOP/frameworks/base"
    git reset --hard HEAD~5

    cd "$ANDROID_BUILD_TOP/system/core"
    git reset --hard HEAD~10

    cd "$ANDROID_BUILD_TOP/packages/apps/Updater"
    git reset --hard HEAD~2

#    cd "$ANDROID_BUILD_TOP/device/oneplus/fajita"
#    git reset --hard HEAD~1

    cd "$ANDROID_BUILD_TOP/packages/apps/Settings"
    git reset --hard HEAD~3

    cd "$ANDROID_BUILD_TOP/build/core"
    git reset --hard HEAD~1

    exit 1
fi
