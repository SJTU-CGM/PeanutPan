#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -J QVAmon
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

module load miniconda3
source activate merqury

#~/tool/merqury/best_k.sh 2500000000

#meryl k=21 count output read1.meryl Amon_1.fq.gz
#meryl k=21 count output read2.meryl Amon_2.fq.gz
#meryl union-sum output Amon.meryl read*.meryl

#~/tool/merqury/merqury.sh Amon.meryl ~/panpeanut/LAI/Amon1_0/Amon1_0.fa amon10
cp ~/panpeanut/assembly/Amon.fa Amon2_0.fa
~/tool/merqury/merqury.sh Amon.meryl Amon2_0.fa amon20
rm -rf Amon2_0.fa
