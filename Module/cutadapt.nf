process CUTADAPT {

    input:
    path reads

    output:
    path "trimmed.fastq"

    script:
    """
    cutadapt -a AGATCGGAAGAGC -o trimmed.fastq ${reads}
    """
}
