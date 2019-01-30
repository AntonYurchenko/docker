#!/bin/sh

# Scala version for example 2.12.7
SCALA_VERSION=${1}
SCALA_DEB="http://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb"

# Install Scala
apt-get install -y wget && \
    wget -q ${SCALA_DEB} -O /tmp/scala.deb && dpkg -i /tmp/scala.deb && \
    scala -version && \
    rm /tmp/scala.deb

