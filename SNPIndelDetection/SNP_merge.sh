module load bcftools

#bcftools merge -m snps --threads 16 --file-list Chr1_20_sample_list.txt --regions-file NDH108.Chr.region -O z -o AABB_merge.snp.vcf.gz

bcftools merge -m snps --threads 1 --file-list Chr1_10_sample_list.txt --regions-file NDH108.ChrA.region -O v -o AA_merge.snp.vcf

bcftools merge -m snps --threads 16 --file-list Chr11_20_sample_list.txt --regions-file NDH108.ChrB.region -O v -o BB_merge.snp.vcf


#for file in ../snp/*gz;
#do
#       /share/home/user/hzxue/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/tabix $file
#done
#bcftools merge ../snp/*gz -O z -o P315.snp.vcf.gz

#ls /share/droplet/www/html/panhap/jb2/ndh108/wgsbam/*/*bam > bams.list
#gunzip -c P315.snp.vcf.gz > P315.snp.vcf

#java -jar ~/tools/jvarkit-2021.10.13/dist/fixvcfmissinggenotypes.jar -B bams.list < P315.snp.vcf > P315.snp.filled.vcf