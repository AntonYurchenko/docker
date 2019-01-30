#!/bin/sh

# Sbt version for example 1.2.6
SBT_VERSION=${1}
SBT_DEB="http://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb"

# Install Sbt
apt-get install -y wget && \
    wget -q ${SBT_DEB} -O /tmp/sbt.deb && dpkg -i /tmp/sbt.deb && \
    sbt sbtVersion && \
    rm /tmp/sbt.deb

