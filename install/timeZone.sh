#!/bin/sh

# Availible time zone from pakage tzdata.
# For Moscow need to set 'Europe/Moscow'
TIME_ZONE=${1}

# Install TZData and set time zone
export DEBIAN_FRONTEND=noninteractive
apt-get install -y tzdata && \
    ln -sf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

