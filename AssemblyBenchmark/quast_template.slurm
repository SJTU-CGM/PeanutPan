#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -J ZP06assemsta
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

module unload xalt
module load miniconda3


sample=V14167
ref=~/panpeanut/ref/NDH108.fa
quast=~/tool/quast-5.1.0rc1/quast.py
th=40

python3 ~/100rice/EUPAN3/eupan3.py assemsta -a ~/panpeanut/assembly/${sample}.fa -r ${ref} -o ${sample} -q ${quast} -t ${th} --large_genome
