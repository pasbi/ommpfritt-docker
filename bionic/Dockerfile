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

COPY scripts/install-cmake-extra-modules.sh /
RUN /install-cmake-extra-modules.sh

COPY scripts/install-kitemmodels.sh /
RUN /install-kitemmodels.sh

COPY scripts/install-lib2geom.sh /
RUN /install-lib2geom.sh

COPY scripts/install-fmt.sh /
RUN /install-fmt.sh

COPY scripts/install-poppler.sh /
RUN /install-poppler.sh

RUN rm -rf /install-*.sh
