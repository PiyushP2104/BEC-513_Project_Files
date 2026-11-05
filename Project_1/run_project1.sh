#!/usr/bin/env bash
set -euo pipefail

# Run from the directory containing this script and the input files.
cd "$(dirname "$0")"

# Check required input and script files.
for file in selection.tsv shuf.a.bed.gz shuf.b.bed.gz quick_bed_sort.py; do
    if [[ ! -f "$file" ]]; then
        echo "Error: required file not found: $file" >&2
        exit 1
    fi
done

# Check required commands.
for command in gzip python3 sort cut; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Error: required command not found: $command" >&2
        exit 1
    fi
done

# Combine, filter, stably sort, and remove the temporary sort columns.
gzip -cd shuf.a.bed.gz shuf.b.bed.gz |
    python3 quick_bed_sort.py |
    sort -s -k1,1n -k2,2n -k3,3n |
    cut -f4- > sorted_bed_file_X_standard.bed

echo "Project 1 completed."
echo "Output: sorted_bed_file_X_standard.bed"
echo "Records: $(wc -l < sorted_bed_file_X_standard.bed)"
