# Nextflow-Based Variant Analysis Pipeline with Integrated QC and Alignment

## Overview
This project implements a basic Nextflow pipeline for preprocessing, alignment, and variant calling of sequencing data.

The pipeline performs quality control, trimming, post-trimming quality check, read alignment, and variant calling on a single FASTQ file.

---

## Pipeline Flow

Raw FASTQ  
↓  
FastQC (Raw Reads)  
↓  
Trimming  
↓  
FastQC (Trimmed Reads)  
↓  
Alignment (BAM)  
↓  
Variant Calling (VCF)

---

## Pipeline Steps

### Step 1: Raw Read Quality Control (FastQC)
- Performs quality assessment on the raw FASTQ file  
- Generates reports for base quality, GC content, and adapter contamination  

**Tool used:**  
FastQC

---

### Step 2: Read Trimming
- Removes low-quality bases and adapters from raw reads  
- Improves read quality for downstream analysis  

**Tool used:**  
Cutadapt (Single-end mode)

---

### Step 3: Quality Control After Trimming
- Runs FastQC again on the trimmed reads  
- Confirms improvement in read quality after trimming  

**Tool used:**  
FastQC

---

### Step 4: Read Alignment
- Aligns trimmed reads to the reference genome  
- Produces alignment output in BAM format  

**Tool used:**  
BWA + Samtools

---

### Step 5: Variant Calling
- Detects genetic variants from aligned BAM files  
- Produces variant output in VCF format  

**Tool used:**  
bcftools

---

## Input Data
- Single FASTQ file: `Data/Sample.fastq`
- Reference genome: `reference/chr22.fa`

Input data is used locally for execution and is not included in the GitHub repository.

---

## Output
- FastQC reports (raw and trimmed)
- Trimmed FASTQ file
- Alignment output (BAM and BAI files)
- Variant output (VCF file)

All outputs are generated inside the Nextflow working directory.

---

## Project Structure

```text
Nextflow/
├── main.nf
├── nextflow.config
├── environment.yml
├── README.md
├── modules/
│   ├── fastqc.nf
│   ├── cutadapt.nf
│   ├── alignment.nf
│   └── vcf.nf
├── workflows/
│   └── workflow.nf
├── Data/
│   └── Sample.fastq
├── reference/
│   └── chr22.fa
└── work/

---
```
# Clone the GitHub repository
```bash
git clone https://github.com/your-username/Nextflow.git
cd Nextflow

---
```

# Activate Conda environment
```bash
conda activate bnf

---
```
# Verify required tools
```bash
which fastqc cutadapt bwa samtools bcftools

---
```
# Run the Nextflow pipeline
```bash
nextflow run main.nf

---
```

# Resume the pipeline if needed
```bash
nextflow run main.nf -resume




