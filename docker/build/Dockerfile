FROM tsne-cuda-base as builder

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

FROM alpine

RUN mkdir /artifacts
COPY --from=builder /workdir/build/python/dist/*.whl /artifacts
COPY --from=builder /workdir/build/lib/libfaiss.so /artifacts
