nextflow.enable.dsl=2

include { FASTQC as FASTQC_RAW } from './modules/fastqc'
include { FASTQC as FASTQC_TRIM } from './modules/fastqc'
include { CUTADAPT } from './modules/cutadapt'
include { BWA_MEM } from './modules/bwa'
include { SAMTOOLS_VIEW } from './modules/samtools_view'
include { SAMTOOLS_SORT } from './modules/samtools_sort'
include { BCFTOOLS_CALL } from './modules/bcftools_call'
include { BCFTOOLS_FILTER } from './modules/bcftools_filter'
workflow {

    reads = Channel.fromPath(params.reads)

    fastqc_raw = FASTQC_RAW(reads)

    trimmed = CUTADAPT(reads)

    fastqc_trim = FASTQC_TRIM(trimmed)

    sam = BWA_MEM(trimmed, params.reference)

    bam = SAMTOOLS_VIEW(sam)

    sorted_bam = SAMTOOLS_SORT(bam)

    vcf = BCFTOOLS_CALL(sorted_bam, params.reference)

    filtered = BCFTOOLS_FILTER(vcf)
}
