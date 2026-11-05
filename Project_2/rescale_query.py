
import sys
import numpy as np

def read_hist(path):
    hist = {}

    with open(path) as f:
        for line in f:
            if line.strip():
                fields = line.split()
                hist[int(fields[0])] = float(fields[1])

    total = sum(hist.values())

    for length in hist:
        hist[length] /= total

    return hist

ref = read_hist("reference.hist")
query = read_hist("query.hist")

weights = {}

for length, q in query.items():
    p = ref.get(length, 0.0)
    weights[length] = p / q if p > 0 and q > 0 else 0.0

max_weight = max(weights.values())

if max_weight == 0:
    sys.exit("No overlapping fragment lengths in query and reference.")

np.random.seed(123)

for line in sys.stdin:
    fields = line.split()

    if len(fields) >= 3:
        length = int(fields[2]) - int(fields[1])
        probability = weights.get(length, 0.0) / max_weight

        if np.random.random() < probability:
            sys.stdout.write(line)

