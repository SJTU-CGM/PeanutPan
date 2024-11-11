module load vcftools

cd /share/home/user/hzxue/peanut/WGS/SNPINDEL/filter/snpmerge/population_out
sdir=~/peanut/WGS/speices

#AA
mkdir fst_out

vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/AA.txt --weir-fst-pop ${sdir}/monticila.txt  --out fst_out/AA_AA24_vs_Am8_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/AA.txt --weir-fst-pop ${sdir}/AABBLandrace.txt --out fst_out/AA_AA24_vs_AhL155_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/AA.txt --weir-fst-pop ${sdir}/AABBImproved.txt --out fst_out/AA_AA24_vs_AhI67_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/monticila.txt --weir-fst-pop ${sdir}/AABBLandrace.txt  --out fst_out/AA_Am8_vs_AhL155_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/monticila.txt --weir-fst-pop ${sdir}/AABBImproved.txt --out fst_out/AA_Am8_vs_AhI67_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/AABBLandrace.txt --weir-fst-pop ${sdir}/AABBImproved.txt --out fst_out/AA_AhL155_vs_AhI67_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000


#BB
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/BB.txt --weir-fst-pop ${sdir}/monticila.txt --out fst_out/BB_BB8_vs_Am8_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/BB.txt --weir-fst-pop ${sdir}/AABBLandrace.txt --out fst_out/BB_BB8_vs_AhL155_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/BB.txt --weir-fst-pop ${sdir}/AABBImproved.txt --out fst_out/BB_BB8_vs_AhI67_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/monticila.txt --weir-fst-pop ${sdir}/AABBLandrace.txt  --out fst_out/BB_Am8_vs_AhL155_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/monticila.txt --weir-fst-pop ${sdir}/AABBImproved.txt --out fst_out/BB_Am8_vs_AhI67_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ${sdir}/AABBLandrace.txt --weir-fst-pop ${sdir}/AABBImproved.txt --out fst_out/BB_AhL155_vs_AhI67_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --out fst_out/AA_Ad3_vs_Am8_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var2_hypogaea185.txt  --out fst_out/AA_Ad3_vs_Ahvarhy185_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var2_fastigiata80.txt --out fst_out/AA_Ad3_vs_Ahvarfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var2_hypogaea185.txt  --out fst_out/AA_Am8_vs_Ahvarhy185_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var2_fastigiata80.txt --out fst_out/AA_Am8_vs_Ahvarfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var2_hypogaea185.txt --weir-fst-pop ~/peanut/WGS/speices/var2_fastigiata80.txt --out fst_out/AA_Ahvarhy185vs_Ahvarfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --out fst_out/BB_Ai4_vs_Am8_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var2_hypogaea185.txt  --out fst_out/BB_Ai4_vs_Ahvarhy185_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var2_fastigiata80.txt --out fst_out/BB_Ai4_vs_Ahvarfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var2_hypogaea185.txt  --out fst_out/BB_Am8_vs_Ahvarhy185_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var2_fastigiata80.txt --out fst_out/BB_Am8_vs_Ahvarfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var2_hypogaea185.txt --weir-fst-pop ~/peanut/WGS/speices/var2_fastigiata80.txt --out fst_out/BB_Ahvarhy185vs_Ahvarfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/hypogaea_clean.txt --out fst_out/AA_Am8_vs_Ah248_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/hypogaea_clean.txt --out fst_out/AA_Ad3_vs_Ah248_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/AA_Ad3_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/AA_Ad3_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/AA_Ad3_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --out fst_out/AA_Ad3_vs_Ahpe11_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/duranensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt --out fst_out/AA_Ad3_vs_Ahvu32_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/AA_Am8_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/AA_Am8_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/AA_Am8_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --out fst_out/AA_Am8_vs_Ahpe11_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt --out fst_out/AA_Am8_vs_Ahvu32_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt --out fst_out/AA_Ahpe11_vs_Ahvu32_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/AA_Ahpe11_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/AA_Ahpe11_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/AA_Ahpe11_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop  ~/peanut/WGS/speices/var_vulgaris.txt --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/AA_Ahvu32_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop  ~/peanut/WGS/speices/var_vulgaris.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt  --out fst_out/AA_Ahvu32_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop  ~/peanut/WGS/speices/var_vulgaris.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/AA_Ahvu32_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop  ~/peanut/WGS/speices/var_fastigiata.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/AA_Ahfa80_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop  ~/peanut/WGS/speices/var_fastigiata.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/AA_Ahfa80_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt  --out fst_out/AA_Ahhi9_vs_Ahhy21Fst_100k20k --fst-window-size 100000 --fst-window-step 20000




#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --out fst_out/BB_Ai4_vs_Am8_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt --weir-fst-pop ~/peanut/WGS/speices/hypogaea_clean.txt --out fst_out/BB_Am8_vs_Ah248_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/hypogaea_clean.txt --out fst_out/BB_Ai4_vs_Ah248_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/BB_Ai4_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/BB_Ai4_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/BB_Ai4_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --out fst_out/BB_Ai4_vs_Ahpe11_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/ipaensis.txt --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt --out fst_out/BB_Ai4_vs_Ahvu32_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/BB_Am8_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/BB_Am8_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/BB_Am8_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --out fst_out/BB_Am8_vs_Ahpe11_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/monticila.txt  --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt --out fst_out/BB_Am8_vs_Ahvu32_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop  ~/peanut/WGS/speices/var_vulgaris.txt --out fst_out/BB_Ahpe11_vs_Ahvu32_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/BB_Ahpe11_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/BB_Ahpe11_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_peruriana.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/BB_Ahpe11_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt  --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt --out fst_out/BB_Ahvu32_vs_Ahfa80_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt  --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/BB_Ahvu32_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_vulgaris.txt  --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/BB_Ahvu32_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt  --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --out fst_out/BB_Ahfa80_vs_Ahhi9_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000
#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_fastigiata.txt  --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/BB_Ahfa80_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000

#vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --weir-fst-pop ~/peanut/WGS/speices/var_hirsuta.txt --weir-fst-pop ~/peanut/WGS/speices/var_hypogaea.txt --out fst_out/BB_Ahhi9_vs_Ahhy21_Fst_100k20k --fst-window-size 100000 --fst-window-step 20000


