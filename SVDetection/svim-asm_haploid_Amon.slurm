#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -J Amonsvim-asm
#SBATCH -p centos
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

module unload xalt
module load miniconda3
module load samtools
source activate svimasm103
#module load r

sample=Amon
ref=~/panpeanut/ref/NDH108.Chr.fa
th=40

#get ChrAB contigs
#python3 fasta_rename2.py ../assembly/${sample}.fa ../assembly/${sample}.Chr.list ${sample}.Chr.fa

mkdir ${sample}
cd ${sample}

# minimap2 map 
#~/tool/minimap2_v2.22/minimap2 -a -x asm5 --cs -r2k -t $th $ref ~/panpeanut/assembly/${sample}.fa > ${sample}.sam
~/tool/VISOR/samtools-1.11/samtools sort -m4G -@ ${th} -o ${sample}.bam ${sample}.sam 
~/tool/VISOR/samtools-1.11/samtools index ${sample}.bam

svim-asm haploid ./ ${sample}.bam $ref





