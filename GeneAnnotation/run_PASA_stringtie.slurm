#!/bin/bash
#SBATCH --time=164:00:00
#SBATCH -J PASA
#SBATCH -p small 
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 2
#SBATCH --output=%J.out
#SBATCH --error=%J.err

source activate bio

simg=~/tool/PASApipeline-v2.5.2/pasapipeline.v2.5.2-devb.simg
genome=~/panpeanut/ref/NDH108.fa
trinity_ts_merge=~/panpeanut/genepredict/evidence/transcript/NDH108RNAseq_ts.fa
#/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/genepredict/trinity_out/transcripts.fasta


#singularity exec -B $PWD $simg /usr/local/src/PASApipeline/bin/seqclean ${trinity_ts_merge} -o ${trinity_ts_merge}.clean -r ${trinity_ts_merge}.cln

mkdir PASA_st_out
#cat ~/tool/PASApipeline-v2.5.2/sample_data/sqlite.confs/alignAssembly.config | grep -v 'DATABASE' > PASA_st_out/alignAssembly.config; echo "DATABASE=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/genepredict/PASA_st_out/PASAst.sqlite" >> PASA_st_out/alignAssembly.config

cd PASA_st_out

singularity exec -B $PWD $simg /usr/local/src/PASApipeline/Launch_PASA_pipeline.pl \
-c alignAssembly.config -R -g $genome \
-t ${trinity_ts_merge}.clean -T -u ${trinity_ts_merge} \
--ALIGNERS blat,gmap,minimap2 --CPU 1 --TRANSDECODER \
#-C

