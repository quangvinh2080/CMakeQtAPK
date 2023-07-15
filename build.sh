#!/bin/bash

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home 
export ANDROID_SDK_ROOT=/Users/vinhthieu/Library/Android/sdk 
export ANDROID_NDK_ROOT=/Users/vinhthieu/Library/Android/sdk/ndk/20.1.5948944 
cmake ./ -B build_android -GNinja -DANDROID_ABI=x86_64 \
        -DANDROID_PLATFORM=23 \
        -DANDROID_SDK=/Users/vinhthieu/Library/Android/sdk \
        -DCMAKE_PREFIX_PATH=/Users/vinhthieu/Qt/5.15.2/android \
        -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=BOTH \
        -DCMAKE_TOOLCHAIN_FILE=/Users/vinhthieu/Library/Android/sdk/ndk/20.1.5948944/build/cmake/android.toolchain.cmake

# -DANDROID_BUILD_ABI_armeabi-v7a=ON \
cmake --build ./build_android --target apk
