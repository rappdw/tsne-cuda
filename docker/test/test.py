#!/usr/bin/env python3

import numpy as np
import time
import sys
from tsnecuda import TSNE

if __name__ == "__main__":
    if len(sys.argv) == 1:
        instances = 10000
    else:
        instances = int(sys.argv[1])
    X = np.random.rand(instances, 150)
#    X = np.array([[0, 0, 0], [0, 1, 1], [1, 0, 1], [1, 1, 1]])
    t = TSNE(n_components=2, verbose=1)
    start = time.time()

    X2d = t.fit_transform(X)

    end = time.time()

    print(f"Duration: {end - start}")