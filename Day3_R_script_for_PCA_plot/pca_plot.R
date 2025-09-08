#!/usr/bin/env Rscript

# Day 3: PCA plot from gene expression matrix

# Load libraries
suppressMessages(library(ggplot2))

# Input expression matrix (genes x samples)
expr_file <- "expression_matrix.csv"

# Read data
expr <- read.csv(expr_file, row.names = 1, check.names = FALSE)

# Transpose (samples as rows for PCA)
expr_t <- t(expr)

# Convert to numeric matrix
expr_t <- apply(expr_t, 2, as.numeric)

# Run PCA
pca <- prcomp(expr_t, scale. = TRUE)

# Prepare data for plotting
pca_df <- as.data.frame(pca$x)
pca_df$Sample <- rownames(pca_df)

# Plot PCA
p <- ggplot(pca_df, aes(x = PC1, y = PC2, label = Sample)) +
  geom_point(size = 4, color = "steelblue") +
  geom_text(vjust = -1.2, size = 4) +
  theme_minimal() +
  ggtitle("PCA of Gene Expression Data")

# Save plot
ggsave("pca_plot.png", p, width = 6, height = 5)

cat("✅ PCA plot saved as pca_plot.png\n")
