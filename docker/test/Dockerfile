FROM nvidia/cuda:9.2-devel-ubuntu18.04 as builder

ADD docker/test/install-mkl.sh /usr/local/bin/

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

ADD cmake /workdir/cmake
ADD docs /workdir/docs
ADD src /workdir/src
ADD third_party /workdir/third_party
ADD visualization /workdir/visualization
ADD CMakeLists.txt /workdir

RUN mkdir build; \
    cd build; \
    cmake .. -DBUILD_PYTHON=TRUE  -DWITH_FAISS_GPU_STANDALONE=ON ;\
    make -j8

RUN cd build/python; \
    python3 setup.py bdist_wheel

FROM rappdw/nvidia-python:latest

ADD docker/test/install-mkl.sh /usr/local/bin/

RUN apt-get update; apt-get install -y \
        time \
        wget \
    ; \
    install-mkl.sh; \
    apt-get clean; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

COPY --from=builder /workdir/build/python/dist/tsne*.whl /tmp/

# /usr/local/nvidia/lib is in LD_LIBRARY_PATH, place libfaiss.so there...
RUN mkdir -p /usr/local/nvidia/lib
COPY --from=builder /workdir/build/lib/libfaiss.so /usr/local/nvidia/lib

RUN . /.venv/bin/activate; \
    pip install /tmp/*.whl

ADD docker/test/test.* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/test.sh"]