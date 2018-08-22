#!/usr/bin/env bash

source /.venv/bin/activate
/usr/bin/time -f "%e %M %P" test.py $@