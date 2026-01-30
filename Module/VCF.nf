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
    bcftools mpileup -f ${ref} ${bam} > variants.bcf

    # Call variants
    bcftools call -mv variants.bcf -o variants.vcf
    """
}
