
#!/usr/bin/env python3
"""
Day 2: Parse FastQC results into a summary table.
This script:
1. Unzips any FastQC .zip files in test_data/
2. Reads all 'summary.txt' files
3. Combines them into a CSV summary
"""

import os
import glob
import pandas as pd
import zipfile

# Folder where FastQC results are stored
input_dir = "test_data/"
output_file = "fastqc_summary.csv"

# Step 1: Unzip all FastQC .zip files if not already extracted
zip_files = glob.glob(os.path.join(input_dir, "*.zip"))

for zf in zip_files:
    sample_name = os.path.splitext(os.path.basename(zf))[0]  # e.g., sample1_1_fastqc
    extract_path = os.path.join(input_dir, sample_name)
    if not os.path.exists(extract_path):  # only unzip if folder doesn't exist
        print(f"📦 Extracting {zf} ...")
        with zipfile.ZipFile(zf, 'r') as zip_ref:
            zip_ref.extractall(input_dir)

# Step 2: Collect all summary.txt files
summary_files = glob.glob(os.path.join(input_dir, "*", "summary.txt"))

if not summary_files:
    print("⚠️ No FastQC summary.txt files found in test_data/. Run FastQC first.")
    exit(1)

records = []

# Step 3: Parse each summary.txt
for filepath in summary_files:
    sample_name = os.path.basename(os.path.dirname(filepath))  # folder name = sample
    with open(filepath) as f:
        for line in f:
            status, test_name, _ = line.strip().split("\t")
            records.append({"Sample": sample_name, "Test": test_name, "Status": status})

# Step 4: Create summary DataFrame
df = pd.DataFrame(records)

# Pivot table: Samples × Tests
summary_table = df.pivot_table(index="Sample", columns="Test", values="Status", aggfunc=lambda x: ' '.join(x))

# Save to CSV
summary_table.to_csv(output_file)

print(f"✅ FastQC summary table saved to {output_file}")
