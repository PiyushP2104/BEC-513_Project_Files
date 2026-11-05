
import sys

PM, PX = -500, 499
LM, LX = 50, 400

positions = range(PM, PX + 1)
lengths = range(LM, LX + 1)

matrix = [[0] * len(positions) for _ in lengths]

for line in sys.stdin:

    columns = line.split()

    if len(columns) < 13:
        continue

    try:
        # Reference coordinates from columns 3 and 4
        ref_chr = columns[1]
        ref_start = int(columns[2])
        ref_end = int(columns[3])

        site_center = (ref_start + ref_end) // 2

        # Fragment coordinates from columns 9 and 10
        frag_chr = columns[7]
        start = int(columns[8])
        end = int(columns[9])

        # Calculate fragment length
        length = end - start

        # Calculate fragment midpoint and offset
        fragment_center = (start + end) // 2
        position = fragment_center - site_center

    except ValueError:
        continue

    # Check chromosome matching
    if ref_chr != frag_chr:
        continue

    # Count fragments within selected ranges
    if PM <= position <= PX and LM <= length <= LX:
        matrix[length - LM][position - PM] += 1


# Print the count matrix
print("length\t" + "\t".join(map(str, positions)))

for i, length in enumerate(lengths):
    print(length, *matrix[i], sep="\t")

