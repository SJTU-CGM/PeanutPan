#!/bin/bash
#SBATCH --time=23:00:00
#SBATCH -J racon_ont
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -N 1
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive
sample=
th=40
source ~/tool/map.path
proj=racon 
# dependdency: minimap2 
#module load miniconda3
#source activate flye

cd /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/assembly/ont_racon

# ont fastq
fqdir=/lustre/home/acct-clswcc/clswcc/data/panpeanut/ONT
fqfile=${fqdir}/${sample}.fq.gz
# assembly

ass=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/assembly/ont_nextdenovo/${sample}/rundir/03.ctg_graph/01.ctg_graph.sh.work/ctg_graph*/nextgraph.assembly.contig.fasta #${sample}/assembly.fasta
# output dir
outdir=${sample}
mkdir $outdir


# racon
#minimap2 -d ${outdir}/${sample}_frag.mmi ${ass}
#minimap2 -x map-ont -t ${th} --MD -a $outdir/${sample}_frag.mmi -o $outdir/${sample}_readtoass.sam ${fqfile}
minimap2 -x map-ont -t ${th} --MD $outdir/${sample}_frag.mmi -o $outdir/${sample}_readtoass.paf ${fqfile}

#racon -t ${th} -m 8 -x -6 -g -8 -w 500 ${fqfile} $outdir/${sample}_readtoass.sam ${ass} > $outdir/${sample}_racon.fa
racon -t ${th} -m 8 -x -6 -g -8 -w 500 ${fqfile} $outdir/${sample}_readtoass.paf ${ass} > $outdir/${sample}_racon.fa
#rm -rf $outdir/${sample}_frag.mmi
#rm -rf $outdir/${sample}_readtoass.sam

