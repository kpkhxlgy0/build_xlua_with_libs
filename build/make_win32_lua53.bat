mkdir build32 & pushd build32
del /f .\CMakeCache.txt
cmake -G "Visual Studio 15 2017" ..
popd
cmake --build build32 --config Release
md plugin_lua53\Plugins\x86
copy /Y build32\Release\xlua.dll plugin_lua53\Plugins\x86\xlua.dll
pause
