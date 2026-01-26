process SAMTOOLS_SORT {
    input:
    path bam

    output:
    path "sorted.bam"

    script:
    """
    samtools sort $bam -o sorted.bam
    """
}
