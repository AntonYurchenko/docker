#!/bin/sh

# Environment
NUMPY_VERSION=${1}
PY4J_VERSION=${2}
PANDAS_VERSION=${3}
BEAKERX_VERSION=${4}

# Install BeakerX
python3.7 -m pip install \
        numpy==${NUMPY_VERSION} \
        py4j==${PY4J_VERSION} \
        pandas==${PANDAS_VERSION} \
        beakerx==${BEAKERX_VERSION} && \
    beakerx install