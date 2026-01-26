process BCFTOOLS_FILTER {
    input:
    path vcf

    output:
    path "filtered_variants.vcf"

    script:
    """
    bcftools filter -i 'QUAL>30' $vcf > filtered_variants.vcf
    """
}
