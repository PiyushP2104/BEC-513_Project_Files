
# Read sample information
meta <- read.delim("gdc_sample_sheet.tsv",
                   stringsAsFactors = FALSE)

# Keep tumor and normal samples
meta <- meta[meta$Sample.Type %in%
             c("Primary Tumor", "Solid Tissue Normal"), ]

# Keep STAR gene-count files only
meta <- meta[grepl("rna_seq\\.augmented_star_gene_counts\\.tsv$",
                   meta$File.Name), ]

# Extract TPM for NKX2-1
get_tpm <- function(folder) {
    file <- list.files(folder,
        pattern = "rna_seq\\.augmented_star_gene_counts\\.tsv$",
        full.names = TRUE)

    if (length(file) == 0) return(NA_real_)

    lines <- readLines(file[1], warn = FALSE)
    h <- grep("^gene_id", lines)[1]

    if (is.na(h)) return(NA_real_)

    header <- strsplit(lines[h], "\t", fixed = TRUE)[[1]]
    col <- match("tpm_unstranded", header)
    gene <- grep("\tNKX2-1\t", lines, fixed = TRUE, value = TRUE)

    if (is.na(col) || length(gene) == 0) return(NA_real_)

    values <- strsplit(gene[1], "\t", fixed = TRUE)[[1]]

    if (length(values) < col) return(NA_real_)

    as.numeric(values[col])
}

# Calculate expression for each sample
meta$TPM <- sapply(meta$File.ID, get_tpm)

# Remove missing values and transform expression
meta <- meta[!is.na(meta$TPM), ]
meta$log2_TPM <- log2(meta$TPM + 1)

# Set the order of the two groups
meta$Sample.Type <- factor(meta$Sample.Type,
    levels = c("Solid Tissue Normal", "Primary Tumor"))

# Compare the expression between groups
print(table(meta$Sample.Type))
test <- t.test(log2_TPM ~ Sample.Type, data = meta)
print(test)

# Generate the boxplot
png("NKX2-1_expression.png", width = 900, height = 700)
boxplot(log2_TPM ~ Sample.Type, data = meta,
    main = "TCGA-LUAD: NKX2-1 expression",
    xlab = "Sample type",
    ylab = "log2(TPM + 1)",
    col = c("lightblue", "pink"))

mtext(paste("p =", signif(test$p.value, 3)), side = 3, line = 0.2)
dev.off()

