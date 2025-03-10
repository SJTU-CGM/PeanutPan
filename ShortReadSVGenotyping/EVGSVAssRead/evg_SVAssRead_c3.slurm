#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH -J EVGAssRead
#SBATCH -p huge
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBAT#CH --exclusive

#sample=F605_hua814

module load miniconda3
source activate evg_env

export PATH=/lustre/home/acct-clswcc/clswcc-xhz/tool/bwa-0.7.17/:$PATH
export PATH=/lustre/home/acct-clswcc/clswcc-xhz/tool/vg-1.53.0/:$PATH
export PATH=/lustre/home/acct-clswcc/clswcc-xhz/tool/EVG/pangenie/build/src/:$PATH

#rm -rf run.list
#while read line
#do
#	sample=$line
#	printf '%s\t%s\t%s\n' "$sample" "/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/trim/${sample}_1.fq.gz" "/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/trim/${sample}_2.fq.gz" >> run.list
#done < AABB230.list

#sample=Tifrunner #$line
# Pangenie 3.0.1

ref=~/panpeanut/ref/NDH108.Chr.fa
vcf=/lustre/home/acct-clswcc/clswcc-xhz/tool/vcf-merging/pangenome-graph-from-callset/P8_SURVIVOR_AssRead_force.pangenome.vcf
#~/panpeanut/SV/SVAss/P8_SURVIVOR_Ass_force.vcf
#idx_name='NDH108_SVAssRead'
#~/tool/vcf-merging/pangenome-graph-from-callset/AABB_mc_diploid/pangenome/pangenome.vcf
#~/panpeanut/pan_cactus/Chrmerge/AABB.mc.diploid.vcf
th=16

cd ~/panpeanut/WGS/EVGSVAssRead

# run only once
#singularity exec ~/tool/pangenie-3.0.1/container/pangenie-3.0.1.sif PanGenie-index -v $vcf -r $ref -t $th -o $idx_name

#if [ -f ${sample}/${sample}_genotyping.vcf.gz ];then
#if [ -d ${sample} ];then
#	echo "## Exist "$sample;
#	#bgzip ${sample}/${sample}_genotyping.vcf
#	#tabix ${sample}/${sample}_genotyping.vcf.gz
#	continue
#fi
echo "## Start EVG " #$sample;

mkdir AABB230dep10c3 #$sample
cd AABB230dep10c3 #$sample
#printf '%s\t%s\t%s' "$sample" "/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/trim/${sample}_1.fq.gz" "/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/trim/${sample}_2.fq.gz" > ${sample}.list


EVG --restart --threads ${th} --depth 10 -r $ref -v $vcf -s /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGSVAssRead/run.list --software VG-Giraffe GraphAligner PanGenie &>AABB230dep10.log2.txt

#TEMPDIR=/scratch/home/acct-clswcc/clswcc-xhz
#fq=${TEMPDIR}/${sample}.fq 
#zcat ~/panpeanut/WGS/trim/${sample}_1.fq.gz ~/panpeanut/WGS/trim/${sample}_2.fq.gz > $fq

#singularity exec ~/tool/pangenie-3.0.1/container/pangenie-3.0.1.sif PanGenie -u -f ../$idx_name -i $fq -s $sample -j $th -t $th -o $sample

#source activate bio
#bgzip ${sample}_genotyping.vcf 
#tabix ${sample}_genotyping.vcf.gz

#rm -rf $fq

#done < ../trim/samplelist_312.txt
#vg giraffe -p -t 40 -Z ~/panpeanut/pan_cactus/Chrmerge/AABB.mc.giraffe.gbz -m ~/panpeanut/pan_cactus/Chrmerge/AABB.mc.min -d ~/panpeanut/pan_cactus/Chrmerge/AABB.mc.dist -f ~/panpeanut/WGS/trim/F605-hua814_1.fq.gz -f ~/panpeanut/WGS/trim/F605-hua814_2.fq.gz > F605-hua814.giraffe.mc.gam


