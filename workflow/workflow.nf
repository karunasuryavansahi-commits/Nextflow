include { CUTADAPT } from './../Module/cutadapt.nf'
include { FASTQC as FASTQC_RAW } from './../Module/fastqc.nf'
include { FASTQC as FASTQC_TRIMMED } from './../Module/fastqc.nf'
include { ALIGNMENT } from './../Module/alignment.nf'
include { VARIANT_CALLING } from './../Module/variant_calling.nf'

workflow QC_PIPELINE {

    reads_ch = Channel
        .fromPath("${projectDir}/../Data/*.fastq")
        .map { file -> tuple(file.baseName, file) }

    ref_ch = Channel.value(file("${projectDir}/../reference/chr22.fa"))

    
    FASTQC_RAW(reads_ch)
    
    trimmed_ch = CUTADAPT(reads_ch)
    
    FASTQC_TRIMMED(trimmed_ch)
    
    align_out = ALIGNMENT(trimmed_ch.map{ it[1] }, ref_ch)

    VARIANT_CALLING(
        align_out[0], // aligned.sorted.bam
        align_out[1], // aligned.sorted.bam.bai
        ref_ch
    )
}


