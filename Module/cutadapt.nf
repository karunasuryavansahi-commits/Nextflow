process CUTADAPT {

    input:
    path reads

    output:
    path "trimmed.fastq"

    script:
    """
    ${params.cutadapt_bin} -a AGATCGGAAGAGC -o trimmed.fastq ${reads}
    """
}

