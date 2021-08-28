#!/usr/bin/env sh

set -e

git clone https://gitlab.com/inkscape/lib2geom.git
cd lib2geom
git checkout 37876ed4
cd ..
cmake -S lib2geom -B build-lib2geom -GNinja -D2GEOM_TESTING=OFF -DCMAKE_BUILD_TYPE=Release
cmake --build build-lib2geom --target install --config Release
rm -rf lib2geom build-lib2geom
