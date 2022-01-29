FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV QT_PREFIX="/opt/qt515"
ENV LD_LIBRARY_PATH="/usr/local/lib/:/usr/local/lib/x86_64-linux-gnu/:/opt/qt515/lib/"

RUN apt-get update \
    && apt-get install -y software-properties-common wget \
    && add-apt-repository ppa:beineri/opt-qt-5.15.2-focal \
    && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - > /usr/share/keyrings/kitware-archive-keyring.gpg \
    && echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' > /etc/apt/sources.list.d/kitware.list \
    && apt-get update \
    && apt-get install -y \
      build-essential \
      clang-11 \
      clang-tidy \
      clang-tools-11 \
      cmake \
      g++ \
      git \
      imagemagick \
      libboost-all-dev \
      libcairo2-dev \
      libclang-11-dev \
      libclang-common-11-dev \
      libclang-cpp11 \
      libclang-cpp11-dev \
      libclang1-11 \
      libdouble-conversion-dev \
      libffi-dev \
      libgl-dev \
      libgsl-dev \
      libllvm11 \
      libpoppler-qt5-dev \
      libssl-dev \
      llvm-11 \
      llvm-11-dev \
      llvm-11-runtime \
      llvm-11-tools \
      ninja-build \
      python3-dev \
      python3-numpy \
      qt515base \
      qt515svg \
      qt515tools \
      qt515translations \
      qt515x11extras \
      xvfb \
      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/install-lib2geom.sh /
RUN /install-lib2geom.sh && rm /install-lib2geom.sh

COPY scripts/install-fmt.sh /
RUN /install-fmt.sh && rm /install-fmt.sh

COPY scripts/install-clazy.sh /
RUN /install-clazy.sh && rm /install-clazy.sh
