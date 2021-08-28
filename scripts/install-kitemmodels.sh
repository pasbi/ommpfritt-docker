#!/usr/bin/env sh

set -e

git clone https://invent.kde.org/frameworks/kitemmodels.git
cd kitemmodels
git checkout v5.84.0
cd ..
cmake -S kitemmodels -B build-kitemmodels -GNinja \
      -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=${QT_PREFIX}
cmake --build build-kitemmodels --target install --config Release
rm -rf kitemmodels build-kitemmodels
