if [ -z "$ANDROID_NDK" ]; then
    export ANDROID_NDK=/c/android-ndk-r13b
fi

mkdir -p build_v7a && cd build_v7a
rm -f CMakeCache.txt
cmake \
    -DANDROID_ABI=armeabi-v7a \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/android.toolchain.cmake \
    -DANDROID_NATIVE_API_LEVEL=android-9 \
    ../ \
    -G "MinGW Makefiles" \
    -DCMAKE_MAKE_PROGRAM="$ANDROID_NDK/prebuilt/windows-x86_64/bin/make.exe"
cd ..
cmake --build build_v7a --config Release
mkdir -p plugin_lua53/Plugins/Android/libs/armeabi-v7a/
cp build_v7a/libxlua.so plugin_lua53/Plugins/Android/libs/armeabi-v7a/libxlua.so

mkdir -p build_x86 && cd build_x86
rm -f CMakeCache.txt
cmake \
    -DANDROID_ABI=x86 \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/android.toolchain.cmake \
    -DANDROID_NATIVE_API_LEVEL=android-9 \
    ../ \
    -G "MinGW Makefiles" \
    -DCMAKE_MAKE_PROGRAM="$ANDROID_NDK/prebuilt/windows-x86_64/bin/make.exe"
cd ..
cmake --build build_x86 --config Release
mkdir -p plugin_lua53/Plugins/Android/libs/x86/
cp build_x86/libxlua.so plugin_lua53/Plugins/Android/libs/x86/libxlua.so


