module load plink
#vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/AABB_snp/AABB_merge.snp.MM05MAF005.vcf.gz
#outfile=AABBplink
#chr_num=20

#vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/AA_snp/AA_merge.snp.MM05MAF005.vcf.gz
#outfile=AAplink
#chr_num=10

vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/BB_snp/BB_merge.snp.MM05MAF005.vcf.gz
outfile=BBplink
chr_num=20

plink --const-fid --vcf ${vcffile} --make-bed --chr-set ${chr_num} no-xy --out ${outfile}
plink --bfile ${outfile} --pca --chr-set ${chr_num} no-xy --out ${outfile}



