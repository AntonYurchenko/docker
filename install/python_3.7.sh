#!/bin/sh

# Install Python 3.7 and pip 19.0.3
apt-get install -y \
    python3.7 python3-pip python3-venv \
    python3-all-dev python3-setuptools build-essential python3-wheel && \
    python3.7 -m pip install --upgrade pip==19.0.3