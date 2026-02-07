include { FASTQC }   from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { ALIGNMENT } from '../modules/alignment.nf'
include { VARIANT_CALLING } from '../modules/variant_calling.nf'

workflow QC_PIPELINE {

    // Create channel for reads (both .fastq and .fastq.gz)
    channel
        .fromPath("${params.fastq_dir}/*.{fastq,fastq.gz}")
        .set { reads }

    // Create channel for reference genome
    ref_genome = file(params.ref_genome)

    // Run FASTQC on raw reads
    FASTQC(reads)

    // Run CUTADAPT on reads (per sample)
    CUTADAPT(reads)

    // Run ALIGNMENT on trimmed reads with reference
    ALIGNMENT(CUTADAPT.out, ref_genome)

    // Run VARIANT_CALLING on aligned BAM with index and reference
    VARIANT_CALLING(ALIGNMENT.out, ref_genome)
}
