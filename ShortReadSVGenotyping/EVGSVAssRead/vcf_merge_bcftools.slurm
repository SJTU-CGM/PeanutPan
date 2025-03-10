#!/bin/bash
#SBATCH --time=148:00:00
#SBATCH -J bcftools
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

module load bcftools
mkdir tempvcf
#while read line;
#do
#	a=$line
#	zcat $line > tempvcf/${a%%/*}.vcf
#	/lustre/home/acct-clswcc/clswcc-xhz/tool/cactus-bin-v2.2.2/bin/bgzip --threads 16 tempvcf/${a%%/*}.vcf
#	/lustre/home/acct-clswcc/clswcc-xhz/tool/cactus-bin-v2.2.2/bin/tabix tempvcf/${a%%/*}.vcf.gz
#done < AABB230.vcf.list
#	ls tempvcf/*vcf.gz > AABB230.vcfs.list
#bcftools concat --min-PQ 0 --file-list AABB230.vcf.list --output AABB230.evg.c3.vcf --threads 16

#bcftools merge --file-list AABB230.vcfs.list --output AABB230.evg.c3.vcf --threads 16
bcftools merge --missing-to-ref --file-list AABB230.vcfs.list --output AABB230.evg.c3.force0.vcf --threads 16
