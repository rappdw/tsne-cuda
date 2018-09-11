# build for docker image that can be run on EC2 p3 instance (tesla v100) with nvidia-docker2 installed
# tesla support requires adding:
#                     -gencode=arch=compute_70,code=sm_70
# on line 63 in CMakeLists.txt
#
# Once this image is built, it should be built and run:
#                     docker build -t tsne-cuda-test:latest -f docker/test/Dockerfile .
#                     docker run --init -it --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all tsne-cuda-test:latest
#
FROM nvidia/cuda:9.2-devel-ubuntu18.04

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

ADD docker/build/build.sh /usr/local/bin
WORKDIR /workdir

ENTRYPOINT ["build.sh"]
# CMD is how many cores to use for the compilation
CMD ["1"]