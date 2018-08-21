FROM nvidia/cuda:9.2-devel-ubuntu18.04

ADD docker/base/install-mkl.sh /usr/local/bin/

RUN apt-get update; \
    apt-get install -y \
        build-essential \
        cmake \
        git \
        python3 \
        python3-pip \
        wget \
    ; \
    install-mkl.sh; \
    pip3 install wheel twine; \
    apt-get clean; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

WORKDIR /workdir


