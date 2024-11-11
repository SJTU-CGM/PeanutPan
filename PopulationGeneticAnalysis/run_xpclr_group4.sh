module load miniconda3
source activate xpclr
export PATH=$PATH:/share/home/user/hzxue/scrnaseq/tool/CellRange-7.1.0/cellranger-7.1.0/external/anaconda/bin

sdir=~/peanut/WGS/speices

:<<!
for chr in Chr10; #Chr01 Chr02 Chr03 Chr04 Chr05 Chr06 Chr07 Chr08 Chr09 Chr10;
do
xpclr --out xpclr_out/AA_AA24_vs_Am8_${chr}_xpclr_100k20k -Sa ${sdir}/AA.txt -Sb ${sdir}/monticila.txt -I ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
xpclr --out xpclr_out/AA_Am8_vs_AhL155_${chr}_xpclr_100k20k -Sa ${sdir}/monticila.txt -Sb ${sdir}/AABBLandrace.txt -I ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
xpclr --out xpclr_out/AA_Am8_vs_AhI67_${chr}_xpclr_100k20k -Sa ${sdir}/monticila.txt -Sb ${sdir}/AABBImproved.txt -I ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
xpclr --out xpclr_out/AA_AhL155_vs_AhI67_${chr}_xpclr_100k20k -Sa ${sdir}/AABBLandrace.txt -Sb ${sdir}/AABBImproved.txt -I ../AA_snp/AA_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
done

!
for chr in Chr20; #Chr12 Chr13 Chr14 Chr15 Chr16 Chr17 Chr18 Chr19 Chr20;
do
xpclr --out xpclr_out/BB_BB8_vs_Am8_${chr}_xpclr_100k20k -Sa ${sdir}/BB.txt -Sb ${sdir}/monticila.txt -I ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
xpclr --out xpclr_out/BB_Am8_vs_AhL155_${chr}_xpclr_100k20k -Sa ${sdir}/monticila.txt -Sb ${sdir}/AABBLandrace.txt -I ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
xpclr --out xpclr_out/BB_Am8_vs_AhI67_${chr}_xpclr_100k20k -Sa ${sdir}/monticila.txt -Sb ${sdir}/AABBImproved.txt -I ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
xpclr --out xpclr_out/BB_AhL155_vs_AhI67_${chr}_xpclr_100k20k -Sa ${sdir}/AABBLandrace.txt -Sb ${sdir}/AABBImproved.txt -I ../BB_snp/BB_merge.snp.MM05MAF005.vcf.gz --chr ${chr} --ld 0.95 --phased --maxsnps 600 --size 100000 --step 20000
done

