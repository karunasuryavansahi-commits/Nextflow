process CUTADAPT {

    input:
    path reads

    output:
    path "trimmed.fastq"

    script:
    """
    ${params.cutadapt_bin} -o trimmed.fastq ${reads}
    """
}


