#!/bin/bash

# Bash script to run FastQC on all FASTQ files in test_data folder
# Usage: bash run_fastqc.sh

# Create output directory
mkdir -p fastqc_results

# Run FastQC on each FASTQ file
for file in test_data/*.fastq test_data/*.fastq.gz
do
    if [[ -f "$file" ]]; then
        echo "Running FastQC on $file ..."
        fastqc "$file" -o fastqc_results/
    fi
done

echo "FastQC analysis complete! Results are in fastqc_results/ directory."
