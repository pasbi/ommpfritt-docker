#!/usr/bin/env sh

set -e

git clone https://github.com/KDE/extra-cmake-modules
cd extra-cmake-modules
git checkout v5.85.0
cd ..
cmake -S extra-cmake-modules -B build-extra-cmake-modules -DCMAKE_BUILD_TYPE=Release
cmake --build build-extra-cmake-modules --target install --config Release
rm -rf extra-cmake-modules build-extra-cmake-modules
