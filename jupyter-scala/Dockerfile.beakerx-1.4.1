## Basic image on ubuntu 18.04
FROM ubuntu:18.04

# Version of dependencies
ARG TORNADO_VERSION='5.1.1'
ARG NOTEBOOK_SERVER_VERSION='5.7.8'
ARG NBDIME_VERSION='1.0.5'
ARG NUMPY_VERSION='1.16.2'
ARG PY4J_VERSION='0.10.8.1'
ARG PANDAS_VERSION='0.24.2'
ARG BEAKERX_VERSION='1.4.1'

# Environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/
ENV PATH $PATH:$JAVA_HOME/bin
ENV M2_HOME /usr/share/maven

# Adding of install scripts
ADD install/python_3.7.sh /install/python_3.7.sh
ADD install/jupyter_py3.7.sh /install/jupyter_py3.7.sh
ADD install/java8.sh /install/java8.sh
ADD install/beakerx_py3.7.sh /install/beakerx_py3.7.sh
RUN chmod +x -R /install/*

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        sudo \
        wajig software-properties-common apt-transport-https \
        bash-completion command-not-found man-db \
        neovim git colordiff \
        gcc cmake \
        rsync wget curl \
        unzip bzip2 \
        maven gradle && \
    cd /install && \
    ./python_3.7.sh && \
    ./jupyter_py3.7.sh ${TORNADO_VERSION} ${NOTEBOOK_SERVER_VERSION} ${NBDIME_VERSION} && \
    ./java8.sh && \
    ./beakerx_py3.7.sh ${NUMPY_VERSION} ${PY4J_VERSION} ${PANDAS_VERSION} ${BEAKERX_VERSION} && \
    apt-get autoremove -y && \
    apt-get autoclean -y

# Creation workdir and copying examples
RUN mkdir -p /workspace
COPY jupyter-scala/examples /workspace/examples

EXPOSE 8888

# Run Jupyter BeakerX
ENTRYPOINT jupyter notebook --allow-root --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/workspace
