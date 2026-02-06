process ALIGNMENT {

    tag "ALIGN_${reads.baseName}"

    input:
    path reads
    path ref

    output:
    path "aligned.sorted.bam"
    path "aligned.sorted.bam.bai"

    script:
    """
    ${params.bwa_bin} index ${ref}    #Index reference

    ${params.bwa_bin} mem ${ref} ${reads} > aligned.sam    #Alignment

    ${params.samtools_bin} view -Sb aligned.sam > aligned.bam   # Convert SAM → BAM

    ${params.samtools_bin} sort aligned.bam -o aligned.sorted.bam  # Sort BAM

    ${params.samtools_bin} index aligned.sorted.bam  # Index BAM
    """
}
