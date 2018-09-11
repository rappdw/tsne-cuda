FROM rappdw/nvidia-python:latest

ADD docker/test/install-mkl.sh /usr/local/bin/

RUN apt-get update; apt-get install -y \
        time \
        wget \
    ; \
    install-mkl.sh; \
    apt-get clean; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

# /usr/local/nvidia/lib is in LD_LIBRARY_PATH, place libfaiss.so there...
RUN mkdir -p /usr/local/nvidia/lib
COPY docker/test/libfaiss.so /usr/local/nvidia/lib
COPY docker/test/tsnecuda-0.1.0-py3-none-any.whl /tmp/

RUN . /.venv/bin/activate; \
    pip install /tmp/tsnecuda-0.1.0-py3-none-any.whl

WORKDIR /workdir
ADD docker/test/test.* /workdir/
ADD docker/test/entry-point.sh /workdir/

