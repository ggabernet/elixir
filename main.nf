#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/elixirpipeline
========================================================================================
    Github : https://github.com/nf-core/elixirpipeline
    Website: https://nf-co.re/elixirpipeline
    Slack  : https://nfcore.slack.com/channels/elixirpipeline
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { ELIXIRPIPELINE } from './workflows/elixirpipeline'

//
// WORKFLOW: Run main nf-core/elixirpipeline analysis pipeline
//
workflow NFCORE_ELIXIRPIPELINE {
    ELIXIRPIPELINE ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_ELIXIRPIPELINE ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
