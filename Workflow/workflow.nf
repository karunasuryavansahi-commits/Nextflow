include { CUTADAPT } from '../Module/cutadapt.nf'
include { FASTQC as FASTQC_RAW } from '../Module/fastqc.nf'
include { FASTQC as FASTQC_TRIMMED } from '../Module/fastqc.nf'
include { ALIGNMENT } from '../Module/Alignment.nf'
include { VARIANT_CALLING } from '../Module/VCF.nf'

workflow QC_PIPELINE {

    
    reads_ch = Channel
        .fromPath('Data/*.fastq')
        .map { file -> tuple(file.baseName, file) }

    ref_ch = Channel.value(file('reference/chr22.fa'))

    FASTQC_RAW(reads_ch)

    trimmed_ch = CUTADAPT(reads_ch)

    FASTQC_TRIMMED(trimmed_ch)
    align_out = ALIGNMENT(trimmed_ch, ref_ch)

    VARIANT_CALLING(
        align_out[0],   // BAM
        align_out[1],   // BAI
        ref_ch
    )
}




