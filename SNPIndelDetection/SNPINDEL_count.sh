echo "#Sample SNP_count INDEL_count"
for file in ../snp/*gz;
do
        name=${file##*/}
        sample=${name%%.*}
        snpn=`zcat $file | grep -v "#" | wc -l`;
        indeln=`zcat ../indel/${sample}.indel.filtered.vcf.gz | grep -v "#" | wc -l`;
        echo $sample" "$snpn" "$indeln;
done