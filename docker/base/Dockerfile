FROM nvidia/cuda:9.1-devel-ubuntu16.04

RUN apt-get update; apt-get install -y \
        build-essential \
        cmake \
        doxygen \
        git \
        graphviz \
        libopenblas-dev \
        libzmq-dev \
        python3 \
    ; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

WORKDIR /workdir

#RUN cd build; cmake .. -DBUILD_PYTHON=TRUE -DWITH_MKL=FALSE -DWITH_ZMQ=ON -DWITH_FAISS_GPU_STANDALONE=ON -DBUILD_TEST=ON -DBUILD_DOC=ON
#RUN cd build; make

