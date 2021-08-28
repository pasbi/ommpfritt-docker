#!/usr/bin/env sh

set -e

git clone https://gitlab.freedesktop.org/poppler/poppler
cd poppler
git checkout poppler-21.07.0
cd ..
cmake -S poppler \
      -B build-poppler \
      -GNinja \
      -DCMAKE_PREFIX_PATH=${QT_PREFIX} \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_CPP_TESTS=OFF \
      -DBUILD_GTK_TESTS=OFF \
      -DBUILD_QT5_TESTS=OFF \
      -DBUILD_QT6_TESTS=OFF \
      -DBUILD_MANUAL_TESTS=OFF \
      -DENABLE_BOOST=OFF \
      -DENABLE_CPP=OFF \
      -DENABLE_GLIB=OFF \
      -DENABLE_LIBCURL=OFF \
      -DENABLE_UNSTABLE_API_ABI_HEADERS=OFF \
      -DENABLE_UTILS=OFF
cmake --build build-poppler --target install --config Release --parallel
rm -rf poppler build-poppler
