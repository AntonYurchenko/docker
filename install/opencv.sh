#!/bin/sh

# OpenCV version for example 3.4.3
OPEN_CV_VERSION=${1}

# OpenCV install prefix for example /usr/local
OPEN_CV_INSTALL_PREFIX=${2}
OPEN_CV_TAR="http://github.com/opencv/opencv/archive/${OPEN_CV_VERSION}.tar.gz"

# Install OpenCV
apt-get install -y wget build-essential cmake && \
    wget -qO- ${OPEN_CV_TAR} | tar xzv -C /tmp && \
    mkdir /tmp/opencv-${OPEN_CV_VERSION}/build && \
    cd /tmp/opencv-${OPEN_CV_VERSION}/build && \
    cmake -DBUILD_JAVA=ON -DCMAKE_INSTALL_PREFIX:PATH=${OPEN_CV_INSTALL_PREFIX} .. && \
    make -j$((`nproc`+1)) && \
    make install && \
    rm -rf /tmp/opencv-${OPEN_CV_VERSION}

