#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH -J vcfmerge
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH --output=%J.out
#SBATCH --error=%J.err


export PATH=$PATH:/lustre/home/acct-clswcc/clswcc-xhz/tool/bcftools-1.16/

module load miniconda3
source activate bio
#source activate snakemake
#snakemake -j 1
invcf=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/SV/SVAssRead/P8_SURVIVOR_AssRead_force.vcf # AABB_mc_diploid/input-vcf/callset-biallelic.vcf
python3 scripts/merge_vcfs.py merge -vcf $invcf -r /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/ref/NDH108.Chr.fa -ploidy 2  2> P8_SURVIVOR_AssRead_force.log 1>P8_SURVIVOR_AssRead_force.pangenome.vcf #AABB_mc_diploid/pangenome/pangenome.log 1> AABB_mc_diploid/pangenome/pangenome.vcf

bgzip P8_SURVIVOR_AssRead_force.pangenome.vcf
tabix P8_SURVIVOR_AssRead_force.pangenome.vcf.gz
zcat P8_SURVIVOR_AssRead_force.pangenome.vcf.gz > P8_SURVIVOR_AssRead_force.pangenome.vcf
#~/tool/vcfbub-0.1.0/release/bin/vcfbub -l 0 -r 100000 -i P8_SURVIVOR_Ass_force.pangenome.vcf.gz > P8_SURVIVOR_Ass_force.pangenome.vcfbublor10w.vcf

