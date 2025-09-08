# Day 3: PCA Plot in R from Gene Expression Matrix

## Overview
This script generates a **PCA plot** from a gene expression matrix (genes as rows, samples as columns).  
PCA (Principal Component Analysis) reduces dimensionality and helps visualize clustering of samples.

## Input Format
A CSV file where:
- Rows = Genes
- Columns = Samples
- First column = Gene names


## Usage
1. Place your expression matrix in the same folder as `pca_plot.R` (default: `expression_matrix.csv`).
2. Run the script:
   ```bash
   Rscript pca_plot.R

