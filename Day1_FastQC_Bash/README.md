# Bash Script to Run FastQC

## Overview
This script runs **FastQC** on all FASTQ/FASTQ.GZ files in the `test_data` folder and saves the results in `fastqc_results`.

## Requirements
- Bash (Linux/Mac/WSL)
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) installed and accessible in your PATH

## Usage
1. Place your test `.fastq` or `.fastq.gz` files inside `test_data/`
2. Make the script executable:
   ```bash
   chmod +x run_fastqc.sh