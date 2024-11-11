module load bcftools

for sample in `ls *bam | awk -F '.' '{print $1}'`;
do
        if [ -f ${sample}.small.vcf.gz ];then
                 continue
        fi
        echo $sample
        bcftools mpileup -Ou -f ~/peanut/ref/NDH108.Chr.fa ${sample}.bam | bcftools call -m -Oz -o ${sample}.small.vcf.gz
done