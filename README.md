# 🚀 30 Days of Bioinformatics Pipelines

Welcome to my **30-day learning challenge** on building and automating **bioinformatics pipelines**!  
This series is focused on hands-on practice with tools like **Nextflow, WDL, Snakemake, Docker, AWS, HPC, R, and Python** – aligned with industry requirements for NGS and multiomics workflows.

Each day, I’ll publish a small project/script in this repository, documenting my progress in mastering **pipeline engineering, workflow automation, and data analysis** for genomics.

---

## 📅 Daily Progress

- **[Day 1: Bash script to run FastQC](./Day1_FastQC_Bash/)**  
  A simple Bash script to run FastQC on FASTQ files inside a folder and save reports into a results directory.  
- **[Day 2: Python script to parse FastQC results](./Day2_FastQC_Parse/)**  
  A Python script that automatically unzips FastQC result files, extracts `summary.txt`, and combines them into a single **CSV summary table** (PASS/WARN/FAIL per sample).  
- **[Day 3: PCA Plot in R](./Day3_R_script_for_PCA_plot/)**  
  A basic R script that takes a gene expression matrix and generates a PCA plot to visualize sample clustering.  
- **[Day 4: Volcano plot generator in R](./Day4_VolcanoPlot_R/)**
  A R script that generates a volcano plot from DESeq2 differential expression results, a widely used visualization to identify significantly upregulated and downregulated genes.
- Day 5: *(coming soon... File renaming automation with Bash/Python)*  
- … and more up to **Day 30** 🚀  

---

## 🎯 Goals of This Challenge
- Gain **hands-on experience** with workflow managers (Nextflow, WDL, Snakemake, CWL).  
- Learn to **containerize bioinformatics pipelines** with Docker & Singularity.  
- Practice **CI/CD for bioinformatics** with GitHub Actions.  
- Explore **AWS and HPC integration** for scalable NGS analysis.  
- Strengthen **Python, R, and Shell scripting** for genomics workflows.  

---

## 🧰 Skills Being Practiced
- Workflow automation (Nextflow, Snakemake, WDL)  
- NGS pipelines (RNA-Seq, WGS, Metagenomics)  
- Docker & containerization  
- Cloud (AWS) & HPC environments  
- GitHub version control & CI/CD  
- R (DESeq2, edgeR, ggplot2, survival) and Python (pandas, matplotlib)  

---

## 📌 Note
This repo is primarily for **learning and practice**. Large FASTQ datasets are **not included** here.  
Instead, instructions or links are provided in each day’s README to download small **test datasets** when required.  

---

## ✨ Stay Tuned
I’ll be updating this repo daily for the next 30 days.  
If you’re interested in bioinformatics pipelines, feel free to **watch ⭐ the repo** and follow along!  
=======
