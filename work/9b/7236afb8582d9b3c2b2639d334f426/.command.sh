#!/bin/bash -ue
# Create BCF
bcftools mpileup -f chr22.fa aligned.sorted.bam > variants.bcf

# Call variants
bcftools call -mv variants.bcf -o variants.vcf
