#!/bin/bash
#SBATCH --time=128:00:00
#SBATCH -J bwamem
#SBATCH -p small
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err

sample=Zhufeng1

th=16
module load samtools

library=LL
ref=~/panpeanut/ref/NDH108_Chr
fq1=../trim/${sample}_1.fq.gz
fq2=../trim/${sample}_2.fq.gz

# index, run only once
# cd ~/panpeanut/ref/
# ~/tool/bwa-0.7.17/bwa index -p NDH108_Chr NDH108.Chr.fa

# map trimmed reads
~/tool/bwa-0.7.17/bwa mem -t $th -M -R $(echo "@RG\tID:$sample\tSM:$sample\tLB:$library\tPL:ILLUMINA") $ref $fq1 $fq2 > ${sample}.sam 2> ./${sample}.mem-pe.log

samtools sort -@ $th -o ${sample}.bam ${sample}.sam
rm -rf ${sample}.sam