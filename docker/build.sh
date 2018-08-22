#!/usr/bin/env bash

docker build  --compress -t tsne-cuda-test:latest -f docker/test/Dockerfile .


docker run --init -it --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all tsne-cuda-test:latest 1500
