FROM tsne-cuda-base

ADD . /workdir

RUN mkdir build; \
    cd build; \
    cmake .. -DBUILD_PYTHON=TRUE -DWITH_FAISS_GPU_STANDALONE=ON ;\
    make -j48
