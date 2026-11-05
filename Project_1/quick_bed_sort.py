import sys

# Read chromosome priority
chrom_order = {}

with open("selection.tsv", "r") as f:
    for line in f:
        chrom = line.strip()
        if chrom:
            chrom_order[chrom] = len(chrom_order)

# Filter records and add sorting keys
for line in sys.stdin:
    columns = line.rstrip("\n").split("\t")

    if len(columns) >= 3 and columns[0] in chrom_order:
        print(chrom_order[columns[0]], columns[1],
              columns[2], "\t".join(columns), sep="\t")
