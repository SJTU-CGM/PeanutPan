#!/bin/bash
#SBATCH --time=144:00:00
#SBATCH -J hisat2dta
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

#module use /lustre/share/spack/modules/kunpeng920/linux-centos7-aarch64
module unload xalt
#module load bcftools/1.10.2-gcc-9.3.0-openblas
module load hisat2/2.2.1-gcc-8.5.0 #hisat2/2.1.0-intel-19.0.4
module load samtools
#sample=Amon
ref=~/panpeanut/ref/NDH108.Chr.fa

th=40
while read line;
do
	pre=$line
#for pre in H107_0h_1 H107_0h_2 H107_0h_3 H107_12h_1 H107_12h_2 H107_12h_3 H107_24h_1 H107_24h_2 H107_24h_3 H108_0h_1 H108_0h_2 H108_0h_3 H108_12h_1 H108_12h_2 H108_12h_3 H108_24h_1 H108_24h_2 H108_24h_3; #NDH108-flower NDH108-fruit NDH108-leaf NDH108-root NDH108-stem;
#Amon-flower Amon-fruit Amon-leaf Amon-root Amon-stem H16-5-flower H16-5-fruit H16-5-leaf H16-5-root H16-5-stem H1314-flower H1314-fruit H1314-leaf H1314-root H1314-stem mH8-flower mH8-fruit mH8-leaf mH8-root mH8-stem NDH814-flower NDH814-fruit NDH814-leaf NDH814-root NDH814-stem ZP06-flower ZP06-fruit ZP06-leaf ZP06-root ZP06-stem;
#do
	#~/tool/hisat2-2.1.0/
	hisat2 --dta -x ~/panpeanut/ref/NDH108 -1 ../trim/${pre}.R1.fq.gz -2 ../trim/${pre}.R2.fq.gz -S ${pre}.sam -p ${th}
	samtools sort -@ ${th} -o ${pre}.bam ${pre}.sam
	samtools index ${pre}.bam
        rm -rf ${pre}.sam
done < ../trim/ndh108_tissue5_sample.list  