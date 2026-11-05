# Project 3 — V-plot

## Requirements

- Linux / Ubuntu / WSL
- Python 3
- GNU awk (`awk`)
- GNUplot with `pngcairo` terminal support

## 1. Open the project folder

```bash
cd ~/MTech_GitHub/Project_3_V_Plot
```

Check that the input file and scripts are present:

```bash
ls -lh "mapped (1).bed"
ls -lh project3.py plot_vplot.gp
```

## 2. Check the required programs

```bash
python3 --version
gnuplot --version
awk --version
```

If GNUplot is not installed:

```bash
sudo apt update
sudo apt install gnuplot
```

## 3. Generate the V-plot count matrix

```bash
python3 project3.py < "mapped (1).bed" > vplot_matrix.txt
```

Check the generated matrix:

```bash
ls -lh vplot_matrix.txt
head -n 5 vplot_matrix.txt
```

## 4. Prepare the matrix for GNUplot

Remove the first column containing fragment-length labels:

```bash
awk 'NR>1 {$1=""; sub(/^[ \t]+/, ""); print}' vplot_matrix.txt > plot_data.txt
```

Check the plotting data:

```bash
ls -lh plot_data.txt
head -n 5 plot_data.txt
```

## 5. Generate the V-plot

```bash
gnuplot plot_vplot.gp
```

Check that the image was created:

```bash
ls -lh vplot.png
```

## 6. Open the plot

From WSL, open the generated image in Windows:

```bash
explorer.exe vplot.png
```

## 7. Run the complete workflow

After confirming that the input file and scripts are in the project folder, run:

```bash
# Generate the V-plot count matrix
python3 project3.py < "mapped (1).bed" > vplot_matrix.txt

# Prepare the matrix for GNUplot
awk 'NR>1 {$1=""; sub(/^[ \t]+/, ""); print}' vplot_matrix.txt > plot_data.txt

# Generate the V-plot image
gnuplot plot_vplot.gp

# Open the image
explorer.exe vplot.png
```

## Expected files

**Input file:**

- `mapped (1).bed (Extract it out in the working folder)`

**Scripts:**

- `project3.py`
- `plot_vplot.gp`

**Generated files:**

- `vplot_matrix.txt`
- `plot_data.txt`
- `vplot.png`
