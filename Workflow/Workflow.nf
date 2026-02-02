include { CUTADAPT } from '../Module/cutadapt.nf'
include { FASTQC as FASTQC_RAW } from '../Module/fastqc.nf'
include { FASTQC as FASTQC_TRIMMED } from '../Module/fastqc.nf'
include { ALIGNMENT } from '../Module/Alignment.nf'
include { VARIANT_CALLING } from '../Module/VCF.nf'

workflow QC_PIPELINE {

    // ---------- INPUT CHANNELS ----------
    reads_ch = Channel
        .fromPath('Data/*.fastq')
        .map { file -> tuple(file.baseName, file) }

    ref_ch = Channel.value(file('reference/chr22.fa'))

    // ---------- STEP 1: FastQC on RAW reads ----------
    FASTQC_RAW(reads_ch)

    // ---------- STEP 2: Trimming ----------
    trimmed_ch = CUTADAPT(reads_ch)

    // ---------- STEP 3: FastQC on TRIMMED reads ----------
    FASTQC_TRIMMED(trimmed_ch)

    // ---------- STEP 4: Alignment ----------
    align_out = ALIGNMENT(trimmed_ch, ref_ch)

    // ---------- STEP 5: Variant Calling ----------
    VARIANT_CALLING(
        align_out[0],   // BAM
        align_out[1],   // BAI
        ref_ch
    )
}




