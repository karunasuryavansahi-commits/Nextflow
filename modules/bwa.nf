process BWA_MEM {
    input:
    path reads
    path reference

    output:
    path "aligned.sam"

    script:
    """
    bwa mem $reference $reads > aligned.sam
    """
}
