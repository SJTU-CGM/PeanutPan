#!/bin/bash
#SBATCH --time=164:00:00
#SBATCH -J updatePASA
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive
module load miniconda3
source activate bio

simg=~/tool/PASApipeline-v2.5.2/pasapipeline.v2.5.2-devb.simg
genome=~/panpeanut/ref/NDH108.fa

mkdir updatePASA2
cd updatePASA2
cp ~/panpeanut/ref/NDH108.uniq.gff3 NDH108.gff3
cp ../PASA_out/tmp.sqlite updatePASA2.sqlite
cat ~/tool/PASApipeline-v2.5.2/sample_data/sqlite.confs/alignAssembly.config | grep -v 'DATABASE' > alignAssembly.config; echo "DATABASE=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/genepredict/updatePASA2/updatePASA2.sqlite" >> alignAssembly.config

# singularity exec -B $PWD $simg /usr/local/src/PASApipeline/misc_utilities/pasa_gff3_validator.pl
singularity exec -B $PWD $simg /usr/local/src/PASApipeline/scripts/Load_Current_Gene_Annotations.dbi -c alignAssembly.config -g $genome -P NDH108.gff3

cat ~/tool/PASApipeline-v2.5.2/pasa_conf/pasa.annotationCompare.Template.txt | grep -v 'DATABASE' > annotCompare.config;echo "DATABASE=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/genepredict/updatePASA2/updatePASA2.sqlite" >> annotCompare.config
singularity exec -B $PWD $simg /usr/local/src/PASApipeline/Launch_PASA_pipeline.pl \
-c annotCompare.config -A \
-g $genome -t /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/genepredict/trinity_out/transcripts.fasta.clean --CPU 40 #\
#-L --annots NDH108.gff3


