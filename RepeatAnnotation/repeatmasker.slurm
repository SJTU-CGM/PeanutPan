#!/bin/bash
#SBATCH --time=160:00:00
#SBATCH -J rmNDH108
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --exclusive
#SBATCH --output=%J.out
#SBATCH --error=%J.err


#singularity exec ~/tool/EDTA.sif EDTA.pl --genome NDH108.fa --sensitive 1 --anno 1 --threads 40

source ~/tool/map.path
module load miniconda3
source activate maker
RepeatMasker -lib /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/ref/NDH108.fa.mod.EDTA.TElib.fa -pa 40 -dir ./ -gff NDH108.fa


