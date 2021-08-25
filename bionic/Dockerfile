FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive
ENV QT_PREFIX="/opt/qt515"
ENV LD_LIBRARY_PATH="/usr/local/lib/:/usr/local/lib/x86_64-linux-gnu/:/opt/qt515/lib/"

# more recent git (from ppa:git-core/ppa) is required because of https://github.com/actions/checkout/issues/335.

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && add-apt-repository ppa:beineri/opt-qt-5.15.2-bionic \
    && add-apt-repository ppa:git-core/ppa \
    && apt-get update \
    && apt-get install -y \
              build-essential \
              fuse \
              g++-9 \
              gcc-9 \
              gpg \
              git \
              libboost-all-dev \
              libcairo2-dev \
              libdouble-conversion-dev \
              libffi-dev \
              libfuse2 \
              libgl-dev \
              libgsl-dev \
              libjpeg-dev \
              libnss3-dev \
              libopenjp2-7-dev \
              libssl-dev \
              locate \
              imagemagick \
              ninja-build \
              python3-dev \
              python3-numpy \
              qt515base \
              qt515svg \
              qt515tools \
              qt515translations \
              qt515x11extras \
              wget \
              zlib1g-dev \
  && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - > /usr/share/keyrings/kitware-archive-keyring.gpg \
  && echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' > /etc/apt/sources.list.d/kitware.list \
  && apt-get update \
  && apt-get install -y cmake \
  && rm -rf /var/lib/apt/lists/* \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 \
                         --slave /usr/bin/g++ g++ /usr/bin/g++-9

RUN cmake --version

RUN git clone https://github.com/KDE/extra-cmake-modules; \
    cd extra-cmake-modules; git checkout v5.85.0; cd ..; \
    cmake -S extra-cmake-modules -B build-extra-cmake-modules -DCMAKE_BUILD_TYPE=Release; \
    cmake --build build-extra-cmake-modules --target install --config Release -j4; \
    updatedb

RUN git clone https://invent.kde.org/frameworks/kitemmodels.git; \
    cd kitemmodels; git checkout v5.84.0; cd ..; \
    cmake -S kitemmodels -B build-kitemmodels -GNinja \
          -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=${QT_PREFIX}; \
    cmake --build build-kitemmodels --target install --config Release -j4; \
    updatedb

RUN git clone https://gitlab.com/inkscape/lib2geom.git; \
    cd lib2geom; git checkout 37876ed4; cd ..; \
    cmake -S lib2geom -B build-lib2geom -GNinja -D2GEOM_TESTING=OFF -DCMAKE_BUILD_TYPE=Release; \
    cmake --build build-lib2geom --target install --config Release -j4; \
    updatedb

RUN git clone https://gitlab.freedesktop.org/poppler/poppler; \
    cd poppler; git checkout poppler-21.07.0; cd ..; \
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
          -DENABLE_UTILS=OFF \
          ; \
    cmake --build build-poppler --target install --config Release -j4; \
    updatedb

RUN git clone https://github.com/fmtlib/fmt.git; \
    cd fmt; git checkout 8.0.1; cd ..; \
    cmake -S fmt -B build-fmtlib -GNinja -DCMAKE_BUILD_TYPE=Release; \
    cmake --build build-fmtlib --target install --config Release -j4; \
    updatedb
