process SAMTOOLS_VIEW {
    input:
    path sam

    output:
    path "aligned.bam"

    script:
    """
    samtools view -Sb $sam > aligned.bam
    """
}
