#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -J bcftools
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 4
#SBATCH --output=%J.out
#SBATCH --error=%J.err


#~/tool/bcftools-1.16/
module load miniconda3
source activate bio
bcftools merge */*.vcf.gz -O z -o P312.P8_MC.vcf.gz
