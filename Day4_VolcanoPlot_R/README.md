Day 4: Volcano Plot Generator in R (DESeq2 Results)
📖 Overview

This project generates a volcano plot from DESeq2 differential expression results, a widely used visualization to identify significantly upregulated and downregulated genes.

The script automatically:
✔ Detects common column names (logFC or log2FoldChange)
✔ Labels the most significant genes using ggrepel
✔ Applies significance thresholds for fold change and adjusted p-value
✔ Saves a clean, publication-quality volcano plot

This is part of my 30 Days of Bioinformatics Pipelines learning challenge.

📁 Input

The script expects a CSV file (deseq2_results.csv) with at least:

Column Name	Description
gene	Gene identifier (any ID allowed)
log2FoldChange or logFC	Fold change values (DESeq2 or edgeR style)
padj	Adjusted p-value (FDR-corrected significance)
Example input:
gene,log2FoldChange,padj
GeneA,2.5,0.001
GeneB,-1.8,0.05
GeneC,0.2,0.8
GeneD,-2.2,0.0005
GeneE,1.5,0.2

🧬 Script Used

Run the volcano plot generator:

Rscript volcano_plot.R

🎨 Output

Running the script produces:
📄 volcano_plot.png — a publication-quality volcano plot.

Features of the plot:

Red = significantly upregulated genes

Blue = significantly downregulated genes

Grey = non-significant

Cutoff lines:

|log2FC| > 1

padj < 0.05

Top 10 significant genes labeled automatically

📦 Dependencies

Make sure the following R packages are installed:

install.packages("ggplot2")
install.packages("ggrepel")

🧠 Concepts Reinforced

Working with DESeq2-style differential expression results

Using ggplot2 for advanced visualization

Adding gene labels with ggrepel

Automating QC visualization workflows

Structuring reproducible R scripts for NGS analysis

🗂 Part of

30 Days of Bioinformatics Pipelines
A hands-on learning challenge covering workflow automation, scripting, and multiomics analysis.
