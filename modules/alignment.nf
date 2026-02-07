process ALIGNMENT {

    input:
    tuple val(sampleName), path(trimmedReads)
    path ref

    output:
    tuple val(sampleName), path("${sampleName}_aligned.sorted.bam"), path("${sampleName}_aligned.sorted.bam.bai")

    script:
    """
    ${params.bwa_bin} index ${ref}

    ${params.bwa_bin} mem ${ref} ${trimmedReads} > ${sampleName}_aligned.sam

    ${params.samtools_bin} view -Sb ${sampleName}_aligned.sam > ${sampleName}_aligned.bam

    ${params.samtools_bin} sort ${sampleName}_aligned.bam -o ${sampleName}_aligned.sorted.bam

    ${params.samtools_bin} index ${sampleName}_aligned.sorted.bam
    """
}
