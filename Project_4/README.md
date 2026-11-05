# Project 4 — TCGA-LUAD: NKX2-1 Expression Analysis

## Requirements

- Linux / Ubuntu / WSL
- R and `Rscript`
- TCGA-LUAD sample information file: `gdc_sample_sheet.tsv`
- Extracted GDC STAR gene-count files

The R script uses base R functions and does not require additional R packages.

## 1. Open the project folder

```bash
cd ~/MTech_GitHub/Project_4_TCGA_LUAD
```

Check that the script and sample sheet are present:

```bash
ls -lh project4.R gdc_sample_sheet.tsv
```

## 2. Check R installation

```bash
R --version
Rscript --version
```

If R is not installed in Ubuntu / WSL:

```bash
sudo apt update
sudo apt install r-base
```

## 3. Check the input folder structure

The extracted sample folders should be inside the project directory and named using their GDC File IDs. Each sample folder should contain its corresponding STAR gene-count file.

Example:

```text
Project_4_TCGA_LUAD/
├── project4.R
├── gdc_sample_sheet.tsv
├── <GDC-File-ID-1>/
│   └── <sample>.rna_seq.augmented_star_gene_counts.tsv
├── <GDC-File-ID-2>/
│   └── <sample>.rna_seq.augmented_star_gene_counts.tsv
└── ...
```

The folder names must match the `File ID` values in `gdc_sample_sheet.tsv`.

## 4. Run the analysis

```bash
Rscript project4.R
```

The script reads the sample sheet, selects primary tumour and solid tissue normal samples, extracts NKX2-1 TPM values, applies the `log2(TPM + 1)` transformation, compares the two groups using a t-test, and saves a boxplot.

## 5. Check the output

```bash
ls -lh NKX2-1_expression.png
```

Open the plot in Windows from WSL:

```bash
explorer.exe NKX2-1_expression.png
```

## 6. Run the workflow

After placing the script, sample sheet, and extracted sample folders in the project directory, run:

```bash
# Run the R analysis
Rscript project4.R

# Check the generated plot
ls -lh NKX2-1_expression.png

# Open the plot
explorer.exe NKX2-1_expression.png
```

## Expected files

**Input files:**

- `gdc_sample_sheet.tsv`
- Extracted sample folders named by GDC `File ID`
- STAR gene-count files named `*.rna_seq.augmented_star_gene_counts.tsv`

**Script:**

- `project4.R`

**Generated output:**

- `NKX2-1_expression.png`

## Data handling note

Check the access category and data-use terms for your GDC files before uploading any data to GitHub. Do not place controlled-access or otherwise restricted data in a public repository. When in doubt, keep the repository private and exclude the downloaded data files.
