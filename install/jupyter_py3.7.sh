#!/bin/sh

# Environment
TORNADO_VERSION=${1}
NOTEBOOK_SERVER_VERSION=${2}
NBDIME_VERSION=${3}

# Install Jupyter
python3.7 -m pip install \
    tornado==${TORNADO_VERSION} \
    notebook==${NOTEBOOK_SERVER_VERSION} \
    jupyter \
    nbdime==${NBDIME_VERSION}
