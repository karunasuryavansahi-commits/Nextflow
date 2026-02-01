process FASTQC {

    input:
    path reads

    output:
    path "*_fastqc.html"
    path "*_fastqc.zip"

    script:
    """
    ${params.fastqc_bin} ${reads}
    """
}

