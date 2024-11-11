#!/bin/bash
#SBATCH --time=160:00:00
#SBATCH -J EVM1
#SBATCH -p small 
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 8
#SBATCH --output=%J.out
#SBATCH --error=%J.err

i=Chr01
singularity exec ~/tool/evidencemodeler.sif EVidenceModeler \
        --sample_id EVM_weight.config \
        --genome NDH108_${i}.fa \
        --gene_predictions gene_predictions.gff3 \
        --protein_alignments evidence/protein/mergeclust/protein.miniprot.2evmalign.gff3 \
        --transcript_alignments evidence/gtf/TD/NDH108_mergeRNAseq_ts.fa.transdecoder.genome.gff3 \
        --segmentSize 100000 \
        --overlapSize 10000 



