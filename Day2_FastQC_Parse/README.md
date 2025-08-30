# Day 2: Parse FastQC Results into a Summary Table

## Overview
This script takes the `summary.txt` files produced by **FastQC** and compiles them into a single CSV file.  
Each row = sample, each column = QC test, and the values show **PASS/WARN/FAIL**.

## Requirements
- Python 3
- pandas library (`pip install pandas`)

## Usage
1. Make sure you already ran **FastQC** (see [Day 1](../Day1_FastQC_Bash/)) and placed the FastQC result folders inside `test_data/`.
   Example:
