#!/bin/bash
#SBATCH --time=160:00:00
#SBATCH -J MM2ONT
#SBATCH -p centos
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err


#module use /lustre/share/spack/modules/kunpeng920/linux-centos7-aarch64
#module unload xalt

th=16

ref=~/panpeanut/ref/NDH108.Chr.fa
fq=../fq/Amon.ONT.fq.gz #Tifrunner.fastq.gz #Adu_Hifi.fastq.gz #../fq/mH8_Hifi.fastq.gz
prefix=Amon_ONT_to_NDH108 #mH8_Hifi_to_NDH108 #NDH108_ONTlong_to_NDH108

# Hifi
#~/armtools/minimap2-2.24/minimap2 -t ${th} -o ${prefix}.sam -ax map-hifi $ref $fq

# ONT long
#~/armtools/minimap2-2.24/minimap2 -t ${th} -o ${prefix}.sam -ax map-ont $ref $fq

ulimit -u 65535
~/tool/VISOR/samtools-1.11/samtools sort -@ ${th} -o ${prefix}.bam ${prefix}.sam
~/tool/VISOR/samtools-1.11/samtools index ${prefix}.bam

#rm -rf ${prefix}.sam

module load miniconda3
source activate cutesv203

bam=${prefix}.bam
out_dir=${prefix}_cutesv

mkdir ${prefix}_tmp

cuteSV=/lustre/home/acct-clswcc/clswcc-xhz/tool/cuteSV-v2.0.3/src/cuteSV/cuteSV

# Hifi
#$cuteSV --genotype --max_cluster_bias_INS 1000 --diff_ratio_merging_INS 0.9 --max_cluster_bias_DEL 1000 --diff_ratio_merging_DEL 0.5 $bam $ref $out_dir ./${prefix}_tmp

# ONT
$cuteSV --genotype --max_cluster_bias_INS 100 --diff_ratio_merging_INS 0.3 --max_cluster_bias_DEL 100 --diff_ratio_merging_DEL 0.3 $bam $ref $out_dir ./${prefix}_tmp
