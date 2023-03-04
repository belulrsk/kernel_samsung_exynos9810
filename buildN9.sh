#!/bin/bash

export ARCH=arm64 && export SUBARCH=arm64
export ANDROID_MAJOR_VERSION=q
make clean -j$(nproc --all)
make mrproper -j$(nproc --all)
rm -rf out/

make O=out ARCH=arm64 exynos9810-crownlte_defconfig

        PATH="/home/$USER/android/kernel/toolchains/clang-r475365b/bin:/home/$USER/android/kernel/toolchains/aarch64-linux-android-4.9/bin:${PATH}" \
        make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-