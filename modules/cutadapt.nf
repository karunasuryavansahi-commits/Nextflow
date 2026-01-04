process CUTADAPT {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("trimmed_${sample_id}.fastq.gz")

    script:
    """
    cutadapt -a AGATCGGAAGAGC \
    -o trimmed_${sample_id}.fastq.gz \
    $reads
    """
}
