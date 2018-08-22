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
    t = TSNE(n_components=2, verbose=1, n_iter=1000)
    start = time.time()

    X2d = t.fit_transform(X)

    end = time.time()

    print(f"Duration: {end - start}")