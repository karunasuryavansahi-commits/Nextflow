include { FASTQC }   from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { ALIGNMENT } from '../modules/alignment.nf'
include { VARIANT_CALLING } from '../modules/variant_calling.nf'

workflow QC_PIPELINE {

    
    channel
        .fromPath("${params.fastq_dir}/*.{fastq,fastq.gz}")
        .set { reads }

    
    ref_genome = file(params.ref_genome)

    FASTQC(reads)

    CUTADAPT(reads)

    ALIGNMENT(CUTADAPT.out, ref_genome)

    VARIANT_CALLING(ALIGNMENT.out, ref_genome)
}