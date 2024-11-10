#!/bin/bash

#SBATCH --time=120:00:00
#SBATCH -J ONT_nanoplot
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err

module purge
module load miniconda3 #/4.6.14-intel-19.0.4
source activate cutesv203

############# 
# QC with NanoPlot 

for file in mH8.Hifi.fq.gz #H16-5.Hifi.fq.gz #Adu.Hifi.fq.gz #NDH108.ONTlong.fq.gz #Amon.ONT.fq.gz  Tifrunner.ONT.fq.gz  ZP06.Hifi.fq.gz
do
        # NanoPlot-1.42.0
        NanoPlot -t 16 --fastq ../fq/${file} -o ./ -p ${file} --plots hex dot
done