# Project 2 — Rescale to Reference

## Requirements

- Linux / Ubuntu / WSL
- Python 3
- NumPy
- GNU gzip
- GNUplot

## 1. Open the project folder

```bash
cd "/mnt/c/Users/piyus/downloads/Project Files/Project_2"
```

Check that the input files and scripts are present:

```bash
ls -lh query.bed.gz reference.hist
ls -lh query_hist.py rescale_query.py plot_rescale.gp
```

## 2. Check Python and NumPy

```bash
python3 --version
python3 -c "import numpy; print(numpy.__version__)"
```

If NumPy is not installed and you use Conda:

```bash
conda install numpy
```

## 3. Generate the original query histogram

```bash
gzip -cd query.bed.gz | python3 query_hist.py > query.hist
```

Check the generated histogram:

```bash
ls -lh query.hist
head -n 5 query.hist
```

## 4. Rescale the query BED file

```bash
gzip -cd query.bed.gz | python3 rescale_query.py | gzip > query.rescaled.bed.gz
```

Check the output:

```bash
ls -lh query.rescaled.bed.gz
```

**Important:** The `rescale_query.py` code currently provided ends after `np.random.seed(123)`. It does not yet read BED records, perform sampling, or print retained records. Therefore, this command will create an empty compressed output rather than a rescaled BED file until that missing sampling/output code is added.

## 5. Generate the rescaled histogram

Run this after `rescale_query.py` has been completed and has produced a valid rescaled BED file:

```bash
gzip -cd query.rescaled.bed.gz | python3 query_hist.py > query.rescaled.hist
```

Check the output:

```bash
ls -lh query.rescaled.hist
head -n 5 query.rescaled.hist
```

## 6. Check GNUplot

```bash
gnuplot --version
```

If GNUplot is not installed:

```bash
sudo apt update
sudo apt install gnuplot
```

## 7. Generate the final plot

```bash
gnuplot plot_rescale.gp
```

Check the image:

```bash
ls -lh fragment_length_distributions.png
```

Open the plot in Windows from WSL:

```bash
explorer.exe fragment_length_distributions.png
```

## 8. Run the workflow in sequence

After the scripts and dependencies are ready, use:

```bash
# Generate the original query histogram
gzip -cd query.bed.gz | python3 query_hist.py > query.hist

# Rescale the query BED file
gzip -cd query.bed.gz | python3 rescale_query.py | gzip > query.rescaled.bed.gz

# Generate the rescaled histogram
gzip -cd query.rescaled.bed.gz | python3 query_hist.py > query.rescaled.hist

# Generate the plot
gnuplot plot_rescale.gp

# Open the plot
explorer.exe fragment_length_distributions.png
```

Run the rescaling and plotting steps only after confirming that `rescale_query.py` contains the sampling and output logic described in Step 4.

## Expected files

Input files:

- `query.bed.gz`
- `reference.hist`

Scripts:

- `query_hist.py`
- `rescale_query.py`
- `plot_rescale.gp`

Generated files:

- `query.hist`
- `query.rescaled.bed.gz`
- `query.rescaled.hist`
- `fragment_length_distributions.png`
