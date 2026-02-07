process CUTADAPT {

    input:
    path reads

    output:
    tuple val(baseName), path("${baseName}_trimmed.fastq.gz")

    script:
    baseName = reads.baseName.replace('.fastq', '')
    """
    ${params.cutadapt_bin} -o ${baseName}_trimmed.fastq.gz ${reads}
    """
}
