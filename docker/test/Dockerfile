FROM tsne-cuda-build as builder
FROM rappdw/nvidia-python:latest

ADD docker/base/install-mkl.sh /usr/local/bin/

RUN apt-get update; apt-get install -y \
        wget \
    ; \
    install-mkl.sh; \
    apt-get clean; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

COPY --from=builder /artifacts/tsne*.whl /tmp/
RUN mkdir -p /usr/local/nvidia/lib
COPY --from=builder /artifacts/libfaiss.so /usr/local/nvidia/lib

RUN . /.venv/bin/activate; \
    pip install /tmp/*.whl