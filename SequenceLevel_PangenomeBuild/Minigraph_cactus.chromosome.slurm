#!/bin/bash
#SBATCH --time=144:00:00
#SBATCH -J cactus01
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 40
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive

module load miniconda3
conda activate cactus27
source activate cactus27
source /lustre/home/acct-clswcc/clswcc-xhz/tool/cactus-bin-v2.7.0/bin/activate
############# 
# Chromosome ID
i=01


############# 
# Prepare the files 
export MYBUCKET=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/pan_cactus27_8/AABB_chr${i}

mkdir $MYBUCKET
mkdir $MYBUCKET/tmp

PANSR=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/pan_cactus_8/pansn/chr${i}/Chr${i}.fasta.gz
PANSRlist=~/panpeanut/pan_cactus_8/pansn/chr${i}/chr${i}.list
zcat $PANSR > $MYBUCKET/tmp/Chr${i}.AABB.fa
seqfile=chr${i}.seqfile
while read line;
do
        sample=${line%%#*}
        echo $line > $MYBUCKET/tmp/temp.list
        ~/tool/faSomeRecords $MYBUCKET/tmp/Chr${i}.AABB.fa $MYBUCKET/tmp/temp.list $MYBUCKET/tmp/${sample}.Chr${i}.fa
        echo -e ${sample}"_Chr"${i}".1\t"$MYBUCKET/tmp/${sample}.Chr${i}.fa  
done< $PANSRlist > seqFile
sed "s/NDH108_Chr${i}.1/NDH108_Chr${i}/g" seqFile > $seqfile
############# 
# pan-genome build with minigraph-cactus 
cactus-pangenome ./AABB_Chr${i}_js $seqfile --outDir $MYBUCKET --outName AABB_Chr${i} --reference NDH108_Chr${i} --vcf --giraffe --gfa --gbz



# old version, drop
:<<!
mkdir $MYBUCKET
mkdir $MYBUCKET/tmp
PANSR=/lustre/home/acct-clswcc/clswcc-xhz/panpeanut/pan_cactus_8/pansn/chr${i}/Chr${i}.fasta.gz
PANSRlist=~/panpeanut/pan_cactus_8/pansn/chr${i}/chr${i}.list
zcat $PANSR > $MYBUCKET/tmp/Chr${i}.AABB.fa
seqfile=chr${i}.seqfile


while read line;
do
        sample=${line%%#*}
        echo $line > $MYBUCKET/tmp/temp.list
        ~/tool/faSomeRecords $MYBUCKET/tmp/Chr${i}.AABB.fa $MYBUCKET/tmp/temp.list $MYBUCKET/tmp/${sample}.Chr${i}.fa
        echo -e ${sample}"_Chr"${i}".1\t"$MYBUCKET/tmp/${sample}.Chr${i}.fa  
done< $PANSRlist > seqFile
sed "s/NDH108_Chr${i}.1/NDH108_Chr${i}/g" seqFile > $seqfile

cactus-minigraph $MYJOBSTORE $seqfile $MYBUCKET/AABB_Chr${i}.gfa --realTimeLogging --reference NDH108_Chr${i}

cactus-graphmap $MYJOBSTORE $seqfile $MYBUCKET/AABB_Chr${i}.gfa $MYBUCKET/AABB_Chr${i}.paf --outputFasta $MYBUCKET/AABB_Chr${i}.gfa.fa --realTimeLogging --reference NDH108_Chr${i}


cactus-align $MYJOBSTORE $seqfile $MYBUCKET/AABB_Chr${i}.paf $MYBUCKET/AABB_Chr${i}.hal --pangenome --outVG --reference NDH108_Chr${i} --realTimeLogging

cactus-graphmap-join $MYJOBSTORE --vg $MYBUCKET/AABB_Chr${i}.vg --outDir $MYBUCKET --outName AABB_Chr${i}  --reference NDH108_Chr${i} --vcf --giraffe --gfaffix  --wlineSep "#" --realTimeLogging
!