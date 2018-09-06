#!/usr/bin/env bash

cp /build/build/python/dist/tsne*.whl /tmp/

# /usr/local/nvidia/lib is in LD_LIBRARY_PATH, place libfaiss.so there...
mkdir -p /usr/local/nvidia/lib
cp /build/build/lib/libfaiss.so /usr/local/nvidia/lib

. /.venv/bin/activate
pip install /tmp/tsne*.whl

exec $@

