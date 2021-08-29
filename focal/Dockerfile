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
      libclang-dev \
      libdouble-conversion-dev \
      libffi-dev \
      libgl-dev \
      libgsl-dev \
      libjpeg-dev \
      libkf5itemmodels-dev \
      libnss3-dev \
      libopenjp2-7-dev \
      libqt5svg5-dev \
      libssl-dev \
      libtiff-dev \
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

COPY scripts/install-lib2geom.sh /
RUN /install-lib2geom.sh

COPY scripts/install-fmt.sh /
RUN /install-fmt.sh

COPY scripts/install-qt6.sh /
RUN /install-qt6.sh

COPY scripts/install-poppler.sh /
RUN /install-poppler.sh

RUN rm -rf /install-*.sh
