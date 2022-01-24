#!/usr/bin/env bash

# focal bundles clazy 1.6 with clang 9.
# We need more clazy with a more recent clang 9/

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 50
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 50
update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-11 50

git clone https://github.com/KDE/clazy
cmake -S clazy/ -B build-clazy -GNinja
cmake --build build-clazy/ --config Release --target install
rm -rf clazy build-clazy

update-alternatives --install /usr/bin/clazy clazy /usr/local/bin/clazy 50
