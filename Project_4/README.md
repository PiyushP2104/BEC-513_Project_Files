# Project 4 — TCGA-LUAD: NKX2-1 Expression Analysis

## Requirements

- Linux / Ubuntu / WSL
- R and `Rscript`
- The TCGA sample sheet: `gdc_sample_sheet.tsv`
- The downloaded TCGA archive: `tcga_data.tar.gz`
- Extracted sample folders containing STAR gene-count files

The analysis uses Base R, so no additional R packages are required.

## 1. Open the Project 4 folder

```bash
cd ~/MTech_GitHub/Project_4_TCGA_LUAD
```

Check that the script, sample sheet, and archive are present:

```bash
ls -lh project4.R gdc_sample_sheet.tsv tcga_data.tar.gz
```

If your project is stored in a different location, change to that folder before running the commands.

## 2. Check the R installation

```bash
R --version
Rscript --version
```

If R is not installed in Ubuntu / WSL:

```bash
sudo apt update
sudo apt install r-base
```

## 3. Extract the TCGA data

If the sample archive has not already been extracted, run:

```bash
tar -zxvf tcga_data.tar.gz
```

The extracted sample folders must be located directly inside the project directory and named using the corresponding `File.ID` values from `gdc_sample_sheet.tsv`.

Each sample folder should contain a STAR gene-count file whose name ends with:

```text
rna_seq.augmented_star_gene_counts.tsv
```

Expected layout:

```text
Project_4_TCGA_LUAD/
├── project4.R
├── gdc_sample_sheet.tsv
├── tcga_data.tar.gz
├── <File.ID-1>/
│   └── <sample>.rna_seq.augmented_star_gene_counts.tsv
├── <File.ID-2>/
│   └── <sample>.rna_seq.augmented_star_gene_counts.tsv
└── ...
```

If extraction creates an additional parent directory, move or copy the individual `File.ID` sample folders into the project directory so that the script can locate them.

## 4. Run the analysis

```bash
Rscript project4.R
```

The script reads the sample sheet, selects Primary Tumor and Solid Tissue Normal samples, extracts NKX2-1 TPM values, transforms expression using `log2(TPM + 1)`, performs a t-test, and creates a boxplot.

## 5. Check the generated output

```bash
ls -lh NKX2-1_expression.png
```

Open the plot in Windows from WSL:

```bash
explorer.exe NKX2-1_expression.png
```

The plot compares NKX2-1 expression between Solid Tissue Normal and Primary Tumor samples. The t-test p-value is displayed above the boxes.

## 6. Run the workflow

After the sample sheet and extracted sample folders are in the required locations, run:

```bash
# Run the analysis
Rscript project4.R

# Check the generated plot
ls -lh NKX2-1_expression.png

# Open the plot
explorer.exe NKX2-1_expression.png
```

## Expected files

**Input files:**

- `gdc_sample_sheet.tsv`
- `tcga_data.tar.gz` (used only if the sample data still needs extraction)
- Extracted sample folders named by `File.ID`
- STAR gene-count files ending in `rna_seq.augmented_star_gene_counts.tsv`

**Code file:**

- `project4.R`

**Generated output:**

- `NKX2-1_expression.png`

## Data-use note

Check the access category and data-use terms for the downloaded GDC files before uploading them to GitHub. Do not upload controlled-access or otherwise restricted TCGA data to a public repository. You can publish the analysis script and this README while keeping restricted or large input data outside the repository.
