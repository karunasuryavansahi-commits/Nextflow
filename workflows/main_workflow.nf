include { FASTQC } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'

workflow {

    Channel
        .fromPath("data/*.fastq.gz")
        .map { file -> tuple(file.baseName, file) }
        .set { reads_ch }

    FASTQC(reads_ch)
    CUTADAPT(reads_ch)
}
