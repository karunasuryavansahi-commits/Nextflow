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
    # Index reference (only once per work dir)
    bwa index ${ref}

    # Alignment
    bwa mem ${ref} ${reads} > aligned.sam

    # Convert SAM → BAM
    samtools view -Sb aligned.sam > aligned.bam

    # Sort BAM
    samtools sort aligned.bam -o aligned.sorted.bam

    # Index BAM
    samtools index aligned.sorted.bam
    """
}

