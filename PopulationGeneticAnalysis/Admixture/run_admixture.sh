
module load plink
#vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/AABB_snp/AABB_merge.snp.MM05MAF005.vcf.gz
#outfile=AABBplink
#vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/AA_snp/AA_merge.snp.MM05MAF005.vcf.gz
#outfile=AAplink
#vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/BB_snp/BB_merge.snp.MM05MAF005.vcf.gz
#outfile=BBplink
vcffile=/share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/AABB_addAA_BB_snp/AABB_addAA_BB_Others.snp.MM05MAF005.vcf.gz
outfile=AABBaddA_ABBplink

:<<!
!
plink --vcf ${vcffile} \
--const-fid \
--allow-extra-chr --maf 0.05 \
--out ${outfile}  \
--geno 0.2 \
--ld-window 999999 \
--ld-window-kb 10 \
--ld-window-r2 0.2  --r2

awk 'BEGIN{OFS="\t"}{print $1,$2,$3,$4,$5,$6,$7,$2-$5}'  ${outfile}.ld  > ${outfile}.ld.xls


plink --vcf ${vcffile} \
--const-fid --allow-extra-chr --indep-pairwise 50 10 0.2 \
--out ${outfile}_ld_flited1

plink --allow-extra-chr --extract ${outfile}_ld_flited1.prune.in \
--const-fid --make-bed --out ${outfile}_ld_filted2 \
--recode vcf-iid --vcf ${vcffile}


module load bcftools
bcftools norm --multiallelics -both --output ${outfile}_one_per_line.vcf ${outfile}_ld_filted2.vcf


cat ${outfile}_one_per_line.vcf | sed 's/Chr0//g' | sed 's/Chr//g' > ${outfile}_change_chr.vcf


plink --vcf ${outfile}_change_chr.vcf --const-fid --recode 12 --out ${outfile}_plink_out


plink --const-fid --noweb --file ${outfile}_plink_out --hwe 0.0001 --make-bed --out ${outfile}_QC



for K in `seq 1 15`
do
~/tools/admixture-1.3.0/dist/admixture_linux-1.3.0/admixture --cv ${outfile}_QC.bed $K -j8 |tee ${outfile}_log${K}.out
done

grep -h CV ${outfile}_log*.out |sort -nk4  -t ' ' > ${outfile}_cross-validation_error.txt

rm -rf ${outfile}_QC.merge.Q.tab; for K in `seq 1 15`;do cat ${outfile}_QC.${K}.Q.tab | awk '{print "'$K'""\t"$0}'> tmp.txt ;Rscript short2long.R; cat count.tsv >>${outfile}_QC.merge.Q.tab;done;rm -rf tmp.txt; rm -rf count.tsv;


#grep -h CV ${outfile}_log*.out |sort -nk4  -t ' ' |tail -n +2 |perl -p -e 's/.*K=(.+?)\):.*/$1/g' |xargs -i rm ${outfile}_QC.{}.Q ${outfile}_QC.{}.P ${outfile}_log{}.out

num=`grep -h CV ${outfile}_log*.out |sort -nk4  -t ' ' |head -n 1 |perl -p -e 's/.*K=(.+?)\):.*/$1/g' `
paste <(cut -f 2 -d ' ' ${outfile}_QC.fam  ) <(cat ${outfile}_QC.${num}.Q|tr ' ' '\t')  > ${outfile}_QC.${num}.Q.tab

