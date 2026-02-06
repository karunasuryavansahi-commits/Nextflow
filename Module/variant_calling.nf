process VARIANT_CALLING {

    tag "VCF_${bam.baseName}"

    input:
    path bam
    path bai
    path ref

    output:
    path "variants.vcf"

    script:
    """
    # Create BCF
    ${params.bcftools_bin} mpileup -f ${ref} ${bam} > variants.bcf

    # Call variants
    ${params.bcftools_bin} call -mv variants.bcf -o variants.vcf
    """
}

