FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
      build-essential \
      clang \
      clazy \
      cmake \
      g++ \
      git \
      libboost-all-dev \
      libcairo2-dev \
      libdouble-conversion-dev \
      libffi-dev \
      libgl-dev \
      libgsl-dev \
      libkf5itemmodels-dev \
      libpoppler-qt5-dev \
      libqt5svg5-dev \
      libssl-dev \
      imagemagick \
      ninja-build \
      python3-dev \
      python3-numpy \
      qt5-default \
      qtbase5-dev \
      qtchooser \
      qttools5-dev-tools \
      qttools5-dev \
      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://gitlab.com/inkscape/lib2geom.git; \
    cd lib2geom; git checkout 37876ed4; cd ..; \
    cmake -S lib2geom -B build-lib2geom -GNinja -D2GEOM_TESTING=OFF -DCMAKE_BUILD_TYPE=Release; \
    cmake --build build-lib2geom --target install --config Release -j4

RUN git clone https://github.com/fmtlib/fmt.git; \
    cd fmt; git checkout 8.0.1; cd ..; \
    cmake -S fmt -B build-fmtlib -GNinja -DCMAKE_BUILD_TYPE=Release; \
    cmake --build build-fmtlib --target install --config Release -j4; \
