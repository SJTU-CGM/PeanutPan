#!/bin/bash
#SBATCH --time=160:00:00
#SBATCH -J LAINDH108
#SBATCH -p small
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err



sample=NDH108
genome=${sample}.fa
#cp ~/panpeanut/ref/NDH108.fa ./${genome}
#gunzip -c ~/panpeanut/ref/NDH108.fa.out.gz > ${sample}.fa.out

module load miniconda3
source activate LTR_retriever
export PATH=$PATH:/lustre/home/acct-clswcc/clswcc-xhz/tool/cd-hit-v4.8.1
export PATH=$PATH:/lustre/home/acct-clswcc/clswcc-xhz/tool/RepeatMasker-4.1.0
export PATH=$PATH:/lustre/home/acct-clswcc/clswcc-xhz/tool/ncbi-blast-2.10.1+/bin
export PATH=$PATH:/lustre/home/acct-clswcc/clswcc-xhz/tool/hmmer-3.3/bin
export PATH=$PATH:/lustre/home/acct-clswcc/clswcc-xhz/tool

echo "#start LTRharvest v1.5.10"
#~/tool/gt-1.5.10-Linux_x86_64-64bit-complete/bin/gt suffixerator -db ${genome} -indexname ${sample}.idx -tis -suf -lcp -des -ssp -sds -dna
#~/tool/gt-1.5.10-Linux_x86_64-64bit-complete/bin/gt ltrharvest -index ${sample}.idx -minlenltr 100 -maxlenltr 7000 -mintsd 4 -maxtsd 6 -motif TGCA -motifmis 1 -similar 85 -vic 10 -seed 20 -seqids yes > ${sample}.fa.harvest.scn
echo "#end LTRharvest v1.5.10"
echo "#start LTR_FINDER_parallel v1.2"
#~/tool/LTR_FINDER_parallel_v1.2/LTR_FINDER_parallel -seq ${genome} -threads 40 -harvest_out -size 1000000 -time 300
echo "#end LTR_FINDER_parallel v1.2"
#cat ${sample}.fa.harvest.scn ${sample}.fa.finder.combine.scn > ${sample}.fa.rawLTR.scn

echo "#start LTR_retriever v2.9"
#~/tool/LTR_retriever_v2.9/LTR_retriever -genome ${genome} -inharvest ${sample}.fa.rawLTR.scn -threads 16
#mv ${sample}.fa.list ${sample}.fa.pass.list
~/tool/LTR_retriever_v2.9/LAI -genome ${genome} -intact ${sample}.fa.pass.list -all ${sample}.fa.out -mono Chr1_10subgenome.list
~/tool/LTR_retriever_v2.9/LAI -genome ${genome} -intact ${sample}.fa.pass.list -all ${sample}.fa.out -mono Chr11_20subgenome.list
echo "#end LTR_retriever v2.9"


