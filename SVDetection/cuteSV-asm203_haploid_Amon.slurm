#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -J AmoncuteSV-asm
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

module unload xalt
module load miniconda3
module load samtools

source activate cutesv203

sample=Amon
ref=~/panpeanut/ref/NDH108.Chr.fa
th=40
ass=~/panpeanut/assembly/${sample}.fa

mkdir ${sample}
cd ${sample}

~/tool/minimap2_v2.22/minimap2 --paf-no-hit -a -x asm5 --cs -r 2k -t $th $ref $ass > ${sample}.sam
module load samtools
samtools sort -@ $th -o ${sample}.bam ${sample}.sam
/samtools index -@ $th ${sample}.bam
:<<!
~/tool/VISOR/samtools-1.11/samtools sort -@ $th -o ${sample}.bam ${sample}.sam
~/tool/VISOR/samtools-1.11/samtools index -@ $th ${sample}.bam

cuteSV ${sample}.bam $ref ${sample}.raw.vcf ./ \
-s 1 --genotype --report_readid -p -1 -mi 500 -md 500 \
    --max_cluster_bias_INS 1000 \
    --diff_ratio_merging_INS 0.9 \
    --max_cluster_bias_DEL 1000 \
    --diff_ratio_merging_DEL 0.5

python3 ~/tool/cuteSV-v2.0.3/src/cuteSV/diploid_calling.py ${sample}.raw.vcf ${sample}.final.vcf
!

