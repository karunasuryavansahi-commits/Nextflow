process FASTQC {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    path "fastqc_${sample_id}_out"

    script:
    """
    mkdir fastqc_${sample_id}_out
    fastqc $reads -o fastqc_${sample_id}_out
    """
}
