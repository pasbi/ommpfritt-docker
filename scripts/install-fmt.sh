#!/usr/bin/env sh

set -e

git clone https://github.com/fmtlib/fmt.git
cd fmt
git checkout 8.0.1
cd ..
cmake -S fmt -B build-fmt -GNinja -DCMAKE_BUILD_TYPE=Release
cmake --build build-fmt --target install --config Release
rm -rf fmt build-fmt
