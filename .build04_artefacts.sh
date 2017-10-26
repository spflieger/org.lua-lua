#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
pushd build
rm -rf org.lua.lua-lua5.3
rm -rf windows_x86
rm -rf windows_x86_64
rm -rf ubuntu_1404_x86
rm -rf ubuntu_1404_x86_64
rm -rf ubuntu_1604_x86
rm -rf ubuntu_1604_x86_64
rm -rf ubuntu_1704_x86
rm -rf ubuntu_1704_x86_64
rm -rf ubuntu_1710_x86
rm -rf ubuntu_1710_x86_64

mkdir org.lua.lua-lua5.3
mkdir windows_x86
mkdir windows_x86_64
mkdir ubuntu_1404_x86
mkdir ubuntu_1404_x86_64
mkdir ubuntu_1604_x86
mkdir ubuntu_1604_x86_64
mkdir ubuntu_1704_x86
mkdir ubuntu_1704_x86_64
mkdir ubuntu_1710_x86
mkdir ubuntu_1710_x86_64

tar --extract --directory windows_x86 --file build_windows_x86.tar.gz --gzip
tar --extract --directory windows_x86_64 --file build_windows_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1404_x86 --file build_ubuntu_1404_x86.tar.gz --gzip
tar --extract --directory ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1604_x86 --file build_ubuntu_1604_x86.tar.gz --gzip
tar --extract --directory ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1704_x86 --file build_ubuntu_1704_x86.tar.gz --gzip
tar --extract --directory ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1710_x86 --file build_ubuntu_1710_x86.tar.gz --gzip
tar --extract --directory ubuntu_1710_x86_64 --file build_ubuntu_1710_x86_64.tar.gz --gzip
popd

pushd build/org.lua.lua-lua5.3
cmake -DCMAKE_INSTALL_PREFIX="" ../../lua5.3/installer
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/lua/lua/5.3.*/lua-5.3.*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/lua/lua/5.3.*/lua-5.3.*.tar.xz
popd
