# Project 1 — Quick BED Sort

## Files required

Keep these files together in the same project directory:

- `quick_bed_sort.py`
- `run_project1.sh`
- `selection.tsv`
- `shuf.a.bed.gz`
- `shuf.b.bed.gz`

## Run the project

1. Open a WSL/Linux terminal.
2. Change to the project directory:

   ```bash
   cd /path/to/Project_1_Quick_BED_Sort
   ```

3. Make the Bash script executable:

   ```bash
   chmod +x run_project1.sh
   ```

4. Run the complete pipeline:

   ```bash
   ./run_project1.sh
   ```

## Check the output

The script creates:

`sorted_bed_file_X_standard.bed`

Check the first five records:

```bash
head -n 5 sorted_bed_file_X_standard.bed
```

Count the output records:

```bash
wc -l sorted_bed_file_X_standard.bed
```

Check the output file size:

```bash
ls -lh sorted_bed_file_X_standard.bed
```

## Run the pipeline manually

If you prefer not to use the Bash script, run:

```bash
gzip -cd shuf.a.bed.gz shuf.b.bed.gz |
python3 quick_bed_sort.py |
sort -s -k1,1n -k2,2n -k3,3n |
cut -f4- > sorted_bed_file_X_standard.bed
```

The `-s` option makes GNU `sort` stable: records tied on the specified sort keys retain their input order.

## Requirements

- Linux or WSL
- Python 3
- `gzip`
- GNU `sort`
- `cut`

No additional Python packages are required.
