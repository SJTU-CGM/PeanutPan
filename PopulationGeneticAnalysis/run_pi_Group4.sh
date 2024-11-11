module load vcftools
#vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/var2_hypogaea185.txt --out AA_Ahvarhy185.snp.MM05MAF005 --recode; /share/home/user/hzxue/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/bgzip AA_Ahvarhy185.snp.MM05MAF005.recode.vcf; /share/home/user/hzxue/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin/tabix AA_Ahvarhy185.snp.MM05MAF005.recode.vcf.gz

:<<!
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/AA.txt --out AA_AA24.snp.MM05MAF005 --recode
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/monticila.txt --out AA_Am8.snp.MM05MAF005 --recode
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/AABBLandrace.txt --out AA_AhL155.snp.MM05MAF005 --recode
vcftools --gzvcf ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/AABBImproved.txt --out AA_AhI67.snp.MM05MAF005 --recode


vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/BB.txt --out BB_BB8.snp.MM05MAF005 --recode
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/monticila.txt --out BB_Am8.snp.MM05MAF005 --recode
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/AABBLandrace.txt --out BB_AhL155.snp.MM05MAF005 --recode
vcftools --gzvcf ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --keep /share/home/user/hzxue/peanut/WGS/speices/AABBImproved.txt --out BB_AhI67.snp.MM05MAF005 --recode
!

mkdir pi_out
for prefix in AA_AA24 AA_Am8 AA_AhL155 AA_AhI67 BB_BB8 BB_Am8 BB_AhL155 BB_AhI67;
	#AA_Ad3 AA_Am8 AA_Ahvarfa80 AA_Ahvarhy185 BB_Ai4 BB_Am8 BB_Ahvarfa80 BB_Ahvarhy185; #AA_Ah248 AA_Ahfa80 AA_Ahhi9 AA_Ahhy21 AA_Ahpe11 AA_Ahvu32 BB_Ai4 BB_Am8 BB_Ah248 BB_Ahfa80 BB_Ahhi9 BB_Ahhy21 BB_Ahpe11;
do

	echo $prefix
	#/share/public-software/manta-1.6.0/build/libexec/bgzip ${prefix}.snp.MM05MAF005.recode.vcf
	#/share/public-software/manta-1.6.0/build/libexec/tabix ${prefix}.snp.MM05MAF005.recode.vcf.gz
	# Drop
	#vcftools --gzvcf ${prefix}.snp.MM05MAF005.recode.vcf.gz --window-pi 10000 --window-pi-step 1000 --out pi_out/${prefix}_10k1k
	# Use
	#vcftools --gzvcf ${prefix}.snp.MM05MAF005.recode.vcf.gz --window-pi 100000 --window-pi-step 20000 --out pi_out/${prefix}_100k20k
	cat pi_out/${prefix}_100k20k.windowed.pi | awk '{print $5}'| grep -v 'PI' | awk '{ sum += $1 } END { print sum / NR }'
done

python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/AA_AA24_100k20k.windowed.pi pi_out/AA_Am8_100k20k.windowed.pi > pi_out/AA_AA24vsAm8_100k20k.windowed.pi
python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/AA_Am8_100k20k.windowed.pi  pi_out/AA_AhL155_100k20k.windowed.pi > pi_out/AA_Am8vsAhL155_100k20k.windowed.pi
python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/AA_Am8_100k20k.windowed.pi  pi_out/AA_AhI67_100k20k.windowed.pi > pi_out/AA_Am8vsAhI67_100k20k.windowed.pi
python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/AA_AhL155_100k20k.windowed.pi  pi_out/AA_AhI67_100k20k.windowed.pi > pi_out/AA_AhL155vsAhI67_100k20k.windowed.pi

python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/BB_BB8_100k20k.windowed.pi pi_out/BB_Am8_100k20k.windowed.pi > pi_out/BB_BB8vsAm8_100k20k.windowed.pi
python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/BB_Am8_100k20k.windowed.pi  pi_out/BB_AhL155_100k20k.windowed.pi > pi_out/BB_Am8vsAhL155_100k20k.windowed.pi
python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/BB_Am8_100k20k.windowed.pi pi_out/BB_AhI67_100k20k.windowed.pi > pi_out/BB_Am8vsAhI67_100k20k.windowed.pi
python3 ~/tools/vcftoolkit/piAB_merge.py pi_out/BB_AhL155_100k20k.windowed.pi pi_out/BB_AhI67_100k20k.windowed.pi > pi_out/BB_AhL155vsAhI67_100k20k.windowed.pi
