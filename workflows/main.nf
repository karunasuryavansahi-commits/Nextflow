workflow {

    fastqc1 = FASTQC(params.reads)
    trimmed = CUTADAPT(params.reads)
    fastqc2 = FASTQC(trimmed)

    sam = BWA_MEM(trimmed, params.reference)
    bam = SAMTOOLS_VIEW(sam)
    sorted_bam = SAMTOOLS_SORT(bam)

    vcf = BCFTOOLS_CALL(sorted_bam, params.reference)
    filtered = BCFTOOLS_FILTER(vcf)
}
