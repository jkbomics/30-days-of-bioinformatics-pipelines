#!/usr/bin/env Rscript

# Day 4: Volcano Plot Generator in R using DESeq2 results

# Load libraries
suppressMessages(library(ggplot2))
suppressMessages(library(ggrepel))  # for smart gene labels

# Input file
input_file <- "deseq2_results.csv"

# Read DESeq2 results
res <- read.csv(input_file)

# --- Standardize column names ---
colnames(res) <- tolower(colnames(res))

# Handle naming differences (logFC vs log2FoldChange)
if ("logfc" %in% colnames(res)) {
  colnames(res)[colnames(res) == "logfc"] <- "log2foldchange"
}

# Check required columns
if (!("log2foldchange" %in% colnames(res))) {
  stop("❌ Input file must contain a 'log2FoldChange' or 'logFC' column")
}
if (!("padj" %in% colnames(res))) {
  stop("❌ Input file must contain a 'padj' column (adjusted p-value)")
}
if (!("gene" %in% colnames(res))) {
  res$gene <- paste0("Gene", seq_len(nrow(res))) # fallback if no gene column
}

# --- Define thresholds ---
log2FC_cutoff <- 1
padj_cutoff <- 0.05

# --- Label significance ---
res$Significance <- "NS"
res$Significance[res$padj < padj_cutoff & res$log2foldchange > log2FC_cutoff] <- "Up"
res$Significance[res$padj < padj_cutoff & res$log2foldchange < -log2FC_cutoff] <- "Down"

# --- Select genes to label (top 10 by significance) ---
top_genes <- res[res$Significance != "NS", ]
top_genes <- head(top_genes[order(top_genes$padj), ], 10)

# --- Volcano plot ---
p <- ggplot(res, aes(x = log2foldchange, y = -log10(padj), color = Significance)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_text_repel(
    data = top_genes,
    aes(label = gene),
    size = 3,
    box.padding = 0.3,
    max.overlaps = 10
  ) +
  scale_color_manual(values = c("Down" = "blue", "Up" = "red", "NS" = "grey")) +
  theme_minimal(base_size = 14) +
  xlab("log2 Fold Change") +
  ylab("-log10 adjusted p-value") +
  ggtitle("Volcano Plot (DESeq2 results)") +
  geom_vline(xintercept = c(-log2FC_cutoff, log2FC_cutoff), linetype = "dashed") +
  geom_hline(yintercept = -log10(padj_cutoff), linetype = "dashed")

# --- Save plot ---
ggsave("volcano_plot.png", p, width = 7, height = 6)

cat("✅ Volcano plot saved as volcano_plot.png\n")
