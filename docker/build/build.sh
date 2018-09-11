#!/usr/bin/env bash

# set -j8 for AWS p3.2xLarge instance, use value appropriate for instance
mkdir -p build
cd build
cmake .. -DBUILD_PYTHON=TRUE

if [ "$#" -ne 1 ]; then
    make
else
    # The build isn't stable, use the heuristic to run it 3 times with multiple jobs and then a final time with
    # a single job. This produces an executable that seems to work in most cases
    make -j$1
    make -j$1
    make -j$1
    make -j1
fi

cd python
python3 setup.py bdist_wheel
