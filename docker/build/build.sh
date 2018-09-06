#!/usr/bin/env bash

# set -j8 for AWS p3.2xLarge instance, use value appropriate for instance
mkdir -p build
cd build
cmake .. -DBUILD_PYTHON=TRUE  -DWITH_FAISS_GPU_STANDALONE=ON
make -j8

cd python
python3 setup.py bdist_wheel
