nextflow.enable.dsl=2

include { workflow } from './workflows/main_workflow.nf'

workflow()
