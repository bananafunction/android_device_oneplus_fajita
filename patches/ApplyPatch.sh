#!/usr/bin/env bash

# Apply patches to other repos
# Needs to be run from within repo and with envsetup sourced

PATCH_ROOT="$ANDROID_BUILD_TOP/device/oneplus/fajita/patches"

if [[ $# -eq 0 ]]
    then
    cd "$ANDROID_BUILD_TOP/packages/apps/Updater"
    git am "$PATCH_ROOT/0001-Define-new-server-URL_Updater.patch"
    git am "$PATCH_ROOT/0002-Define-new-changelog-URL_Updater.patch"

    echo "Done."
    exit 1
else
    cd "$ANDROID_BUILD_TOP/packages/apps/Updater"
    git reset --hard HEAD~2

    exit 1
fi
