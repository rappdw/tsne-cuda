FROM rappdw/nvidia-python:latest

ADD docker/test/install-mkl.sh /usr/local/bin/

RUN apt-get update; apt-get install -y \
        time \
        wget \
    ; \
    install-mkl.sh; \
    apt-get clean; \
    rm -rf /var/tmp/* /tmp/* /var/lib/apt/lists/*

WORKDIR /workdir
ADD docker/test/test.* /workdir/
ADD docker/test/build.sh /usr/local/bin/

ENTRYPOINT ["build.sh"]
CMD ["/bin/bash"]
