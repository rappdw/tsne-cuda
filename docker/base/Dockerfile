FROM nvidia/cuda:9.1-devel-ubuntu16.04

ADD docker/base/install-mkl.sh /usr/local/bin/

RUN apt-get update; apt-get install -y \
        build-essential \
        cmake \
        doxygen \
        git \
        graphviz \
        libzmq-dev \
        python3 \
        python3-pip \
        wget \
    ; \
    install-mkl.sh; \
    pip3 install wheel twine; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

WORKDIR /workdir


