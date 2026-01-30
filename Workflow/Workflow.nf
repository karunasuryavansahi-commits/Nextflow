include { CUTADAPT } from '../Module/cutadapt.nf'
include { FASTQC as FASTQC_RAW } from '../Module/fastqc.nf'
include { FASTQC as FASTQC_TRIMMED } from '../Module/fastqc.nf'
include { ALIGNMENT } from '../Module/Alignment.nf'
include { VARIANT_CALLING } from '../Module/VCF.nf'

workflow QC_PIPELINE {

    reads_ch = Channel.fromPath('Data/Sample.fastq')

    ref_ch = Channel.fromPath('reference/chr22.fa')

    trimmed_ch = CUTADAPT(reads_ch)

    FASTQC_RAW(reads_ch)
    FASTQC_TRIMMED(trimmed_ch)

    align_out = ALIGNMENT(trimmed_ch, ref_ch)

    // ✅ Variant calling added (ONLY new logic)
    VARIANT_CALLING(
        align_out[0],   // aligned.sorted.bam
        align_out[1],   // aligned.sorted.bam.bai
        ref_ch
    )
}



