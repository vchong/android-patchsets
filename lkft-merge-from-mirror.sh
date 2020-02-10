#!/bin/bash -e

. $(dirname $0)/functions

PATCHES=0
if [ -n "$1" ]; then
        AOSP="$1"
else
        AOSP="`pwd`"
fi

if ! [ -d "$AOSP" ] && [ -d "$AOSP"/build ]; then
        echo "This script must be run from the AOSP source directory"
        echo "or with the AOSP source directory as its first parameter."
        exit 1
fi

function create_local_branch(){
    local branch_name=$1 && shift

    res=$(git branch --list ${branch_name})
    if [ -n "${res}" ]; then
        git branch -m ${branch_name} ${branch_name}-old
    fi
    git checkout -b ${branch_name} remotes/aosp/${branch_name}
    if [ -n "${res}" ]; then
        git branch -D ${branch_name}-old
    fi
}

#KERNEL_BRANCH=android-hikey-linaro-4.19
#BUILD_KERNEL_SRC_DIR=kernel/linaro/hisilicon-4.19
#KERNEL_BRANCH_MERGE_FROM=mirror-android-4.19

if [ -z "${KERNEL_BRANCH}" ]; then
    echo "KERNEL_BRANCH is not specified"
    echo "Please check and try again"
    exit 1
fi

if [ ! -d "${BUILD_KERNEL_SRC_DIR}" ]; then
    echo "BUILD_KERNEL_SRC_DIR is not specified"
    echo "Please check and try again"
    exit 1
fi

if [ -z "${KERNEL_BRANCH_MERGE_FROM}" ]; then
    echo "Please specify KERNEL_BRANCH_MERGE_FROM in the configs"
    exit 1
fi

cd ${BUILD_KERNEL_SRC_DIR}
create_local_branch "${KERNEL_BRANCH_MERGE_FROM}"
create_local_branch "${KERNEL_BRANCH}"
git merge --log --no-edit ${KERNEL_BRANCH_MERGE_FROM}
cd -

# next need to run following command to submit the change to gerrit
# git push https://android.googlesource.com/kernel/hikey-linaro HEAD:refs/for/android-hikey-linaro-4.19
# adb root && adb shell cat /proc/version && adb remount && \
#    adb shell screencap -p /data/local/tmp/bbb.png && adb pull /data/local/tmp/bbb.png /tmp/bbb.png  && gnome-open /tmp/bbb.png
