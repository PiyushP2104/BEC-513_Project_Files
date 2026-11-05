
import sys

counts = {}
total = 0

for line in sys.stdin:
    fields = line.split()

    if len(fields) >= 3:
        length = int(fields[2]) - int(fields[1])

        if length > 0:
            counts[length] = counts.get(length, 0) + 1
            total += 1

for length in sorted(counts):
    print(length, counts[length] / total)


