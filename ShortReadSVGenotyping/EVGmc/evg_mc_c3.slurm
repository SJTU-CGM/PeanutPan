#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH -J EVGmc
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

#sample=F605_hua814

module load miniconda3
source activate evg_env

export PATH=/lustre/home/acct-clswcc/clswcc-xhz/tool/bwa-0.7.17/:$PATH
export PATH=/lustre/home/acct-clswcc/clswcc-xhz/tool/vg-1.62.0/:$PATH
export PATH=/lustre/home/acct-clswcc/clswcc-xhz/tool/EVG/pangenie/build/src/:$PATH

while read line
do
#sample=DL004 #$line
# Pangenie 3.0.1
sample=$line
ref=~/panpeanut/ref/NDH108.Chr.fa
vcf=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/AABB.MC.minVariantLength10.vcf
#/lustre/home/acct-clswcc/clswcc-xhz/tool/pangenie-3.0.1/genotyping-pipelines/prepare-vcf-MC/workflow/AABB.vcf
#/lustre/home/acct-clswcc/clswcc-xhz/tool/vcf-merging/pangenome-graph-from-callset/P8_SURVIVOR_AssRead_force.pangenome.vcf
#~/panpeanut/SV/SVAss/P8_SURVIVOR_Ass_force.vcf
#idx_name='NDH108_SVAssRead'
#~/tool/vcf-merging/pangenome-graph-from-callset/AABB_mc_diploid/pangenome/pangenome.vcf
#~/panpeanut/pan_cactus/Chrmerge/AABB.mc.diploid.vcf
th=40

cd ~/panpeanut/WGS/EVGmc

# run only once
#singularity exec ~/tool/pangenie-3.0.1/container/pangenie-3.0.1.sif PanGenie-index -v $vcf -r $ref -t $th -o $idx_name

#if [ -f ${sample}/${sample}_genotyping.vcf.gz ];then
if [ -f ${sample}/genotype/PanGenie/${sample}_genotyping.vcf ];then
	echo "## Exist pangenie "$sample;
	#bgzip ${sample}/${sample}_genotyping.vcf
	#tabix ${sample}/${sample}_genotyping.vcf.gz
	continue
fi

if [ -d ${sample}/workp/ ];then
        echo "## Exist working tag: "$sample;
        #bgzip ${sample}/${sample}_genotyping.vcf
        #tabix ${sample}/${sample}_genotyping.vcf.gz
        continue
fi

#cp -r A7/convert/convert.* ${line}/convert;cp -r A7/convert/GraphAligner ${line}/convert; cp -r A7/convert/PanGenie ${line}/convert

echo "## Start EVG "$sample;

mkdir $sample
cd $sample
printf '%s\t%s\t%s' "$sample" "/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/trim/${sample}_1.fq.gz" "/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/trim/${sample}_2.fq.gz" > ${sample}.list

mkdir workp
EVG --restart --threads ${th} --depth=10 -r $ref -v $vcf -s ${sample}.list --software GraphTyper2 GraphAligner PanGenie &>${sample}.log3.txt

#mkdir genotype/GraphAligner
#vg pack -t ${th} -Q 0 -x /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/convert/GraphAligner/out.xg -g /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/GraphAligner/${sample}.gam -o /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/GraphAligner/${sample}.pack
#vg call -t ${th} -s ${sample} /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/convert/GraphAligner/out.xg -k /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/GraphAligner/${sample}.pack -r /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/convert/GraphAligner/out.snarls 1>/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/GraphAligner/${sample}.vcf

#mkdir genotype/PanGenie
#zcat /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/convert/sample.*.fq.gz 1>/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/PanGenie/${sample}.fq
#PanGenie -s ${sample} -i /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/PanGenie/${sample}.fq -f /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/convert/PanGenie/out -t ${th} -j ${th} -o /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/PanGenie/${sample}
#rm -rf /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/PanGenie/${sample}.fq

#mkdir merge
#/lustre/home/acct-clswcc/clswcc-xhz/.conda/envs/evg_env/bin/graphvcf merge -v /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/convert/convert.AABB.MC.minVariantLength10.vcf.gz --GraphTyper2 /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/GraphTyper2/graphtyper.vcf --GraphAligner /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/GraphAligner/${sample}.vcf --PanGenie /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/genotype/PanGenie/${sample}_genotyping.vcf -n ${sample} -o /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/${sample}/merge/${sample}.vcf.gz

done < /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/WGS/EVGmc/AABB230_removeA7.list
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


