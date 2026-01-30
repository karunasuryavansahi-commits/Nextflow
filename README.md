# Nextflow QC, Alignment, and Variant Calling Pipeline

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
Trimmomatic (Single-end mode)

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
- BAM file is generated inside the Nextflow `work/` directory

**Tool used:**  
Aligner configured in the pipeline

---

### Step 5: Variant Calling
- Detects genetic variants from aligned BAM files
- Produces variant output in VCF format

**Tool used:**  
bcftools

---

## Input Data
- Single FASTQ file: `data/sample_R1.fastq`
- Reference genome: `data/reference/chr22.fa`

Input data is used locally for execution and is not included in the GitHub repository.

---

## Output
- FastQC reports (raw and trimmed)
- Trimmed FASTQ file
- Alignment output (BAM and BAI files)
- Variant output (VCF file)

All outputs are stored in the Nextflow `work/` directory by default.

---

## Project Structure 
Nextflow/
├── main.nf
├── nextflow.config
├── README.md
├── modules/
│   ├── fastqc.nf
│   ├── cutadapt.nf
│   ├── alignment.nf
│   └── vcf.nf
└── workflows/
    └── workflow.nf
---
##How to Run the Pipeline

nextflow run main.nf
nextflow run main.nf -resume
