#!/usr/bin/env bash

scp ubuntu@$1:/data/workspaces/drapp/code/tsne-cuda/build/python/dist/tsnecuda-0.1.0-py3-none-any.whl ./docker/test/tsnecuda-0.1.0-py3-none-any.whl
scp ubuntu@$1:/data/workspaces/drapp/code/tsne-cuda/build/lib/libfaiss.so ./docker/test/libfaiss.so