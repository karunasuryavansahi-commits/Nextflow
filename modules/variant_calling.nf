process VARIANT_CALLING {

    input:
    tuple val(sampleName), path(bam), path(bai)
    path ref

    output:
    path "variants.vcf"

    script:
    """
    ${params.bcftools_bin} mpileup -f ${ref} ${bam} > variants.bcf

    ${params.bcftools_bin} call -mv variants.bcf -o variants.vcf
    """
}
