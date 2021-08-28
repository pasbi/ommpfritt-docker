#!/usr/bin/env sh

set -e

git clone git://code.qt.io/qt/qt5.git
cd qt5
git checkout v6.0.4
./init-repository --module-subset=qtbase,qtsvg,qttools,qttranslations,qtimageformats,qtshadertools,qtdeclarative,qtactiveqt
cd ..
mkdir build-qt6
cd build-qt6
../qt5/configure
cd ..
cmake --build build-qt6
cmake --install build-qt6
rm -rf qt5 build-qt6
