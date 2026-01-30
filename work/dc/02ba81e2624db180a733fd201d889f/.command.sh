#!/bin/bash -ue
# Index reference (only once per work dir)
bwa index chr22.fa

# Alignment
bwa mem chr22.fa trimmed.fastq > aligned.sam

# Convert SAM → BAM
samtools view -Sb aligned.sam > aligned.bam

# Sort BAM
samtools sort aligned.bam -o aligned.sorted.bam

# Index BAM
samtools index aligned.sorted.bam
