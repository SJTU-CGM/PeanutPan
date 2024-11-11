module load bcftools
for file in `ls ~/peanut/WGS/bwabam/*.vcf.gz`;
        # `ls ../raw/AllSite/*.vcf.gz`;
do


        name=${file##*/}
        sample=${name%%.*}
        if [ -f snpindel/${sample}.filtered.vcf.gz ];then
                continue
        fi
        echo $sample
        # all
        # bcftools filter -e "QUAL<30" -Oz -o snpindel/${sample}.filtered.vcf.gz $file
        bcftools filter -g3 -G10 -e "QUAL<30 || INFO/DP<5 || INFO/MQ<20" -Oz -o snpindel/${sample}.filtered.vcf.gz $file
        ~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/tabix snpindel/${sample}.filtered.vcf.gz
:<<!
        # snp
        zcat snpindel/${sample}.filtered.vcf.gz | grep '#' > ${sample}.temp.header
        zcat snpindel/${sample}.filtered.vcf.gz | grep -v '#' | grep -v 'INDEL' > ${sample}.temp.body
        cat ${sample}.temp.header ${sample}.temp.body > snp/${sample}.snp.filtered.vcf
        ~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/bgzip snp/${sample}.snp.filtered.vcf
        ~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/tabix indel/${sample}.snp.filtered.vcf.gz
        rm -rf ${sample}.temp.*

        # indel
        zcat snpindel/${sample}.filtered.vcf.gz | grep '#' > ${sample}.temp.header
        zcat snpindel/${sample}.filtered.vcf.gz | grep -v '#' | grep 'INDEL' > ${sample}.temp.body
        cat ${sample}.temp.header ${sample}.temp.body > indel/${sample}.indel.filtered.vcf
        ~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/bgzip indel/${sample}.indel.filtered.vcf
        ~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/tabix indel/${sample}.indel.filtered.vcf.gz
        rm -rf ${sample}.temp.*
!

done