process BCFTOOLS_CALL {
    input:
    path bam
    path reference

    output:
    path "variants.vcf"

    script:
    """
    bcftools mpileup -f $reference $bam | \
    bcftools call -mv -Ov -o variants.vcf
    """
}
