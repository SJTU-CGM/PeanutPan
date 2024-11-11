filein=AABB_merge.snp.vcf #AABB_merge.snp.vcf
Chr=Chr09
fileout=AABB_merge.snp.${Chr}.vcf #AABB_merge.snp.${Chr}.vcf

cat $filein | grep '#'> ${fileout}.header.temp
cat $filein | grep -v '#'| awk '{if ($1=="'$Chr'") print $0}' | grep -E '1/1|0/1' > ${fileout}.body.temp
cat ${fileout}.header.temp ${fileout}.body.temp > ${fileout}
~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/bgzip ${fileout}
~/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/tabix ${fileout}.gz

rm -rf ${fileout}.header.temp
rm -rf ${fileout}.body.temp
