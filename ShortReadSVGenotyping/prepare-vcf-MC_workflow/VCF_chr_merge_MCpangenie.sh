module load miniconda3
source activate bio
export PERL5LIB=/lustre/home/acct-clswcc/clswcc-xhz/tool/vcftools-0.1.16/src/perl/

# not work 
#python3 ~/tool/vcftoolkit/vcf_merge_chr.py  
#~/tool/vcftools-0.1.16/release/bin/vcf-concat VCFsplitChr/AABB_Chr01.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr02.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr03.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr04.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr05.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr06.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr07.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr08.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr09.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr10.pangenie-ready.vcf.gz > AABB.A.vcf
#~/tool/vcftools-0.1.16/release/bin/vcf-concat VCFsplitChr/AABB_Chr11.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr12.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr13.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr14.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr15.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr16.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr17.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr18.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr19.pangenie-ready.vcf.gz VCFsplitChr/AABB_Chr20.pangenie-ready.vcf.gz > AABB.B.vcf
#~/tool/vcftools-0.1.16/release/bin/vcf-concat AABB.A.vcf AABB.B.vcf > AABB.vcf

# work
module load bcftools

bcftools concat AABB_Chr01.pangenie-ready.vcf.gz AABB_Chr02.pangenie-ready.vcf.gz AABB_Chr03.pangenie-ready.vcf.gz AABB_Chr04.pangenie-ready.vcf.gz AABB_Chr05.pangenie-ready.vcf.gz AABB_Chr06.pangenie-ready.vcf.gz AABB_Chr07.pangenie-ready.vcf.gz AABB_Chr08.pangenie-ready.vcf.gz AABB_Chr09.pangenie-ready.vcf.gz AABB_Chr10.pangenie-ready.vcf.gz -o AABB.A.vcf
bcftools concat AABB_Chr11.pangenie-ready.vcf.gz AABB_Chr12.pangenie-ready.vcf.gz AABB_Chr13.pangenie-ready.vcf.gz AABB_Chr14.pangenie-ready.vcf.gz AABB_Chr15.pangenie-ready.vcf.gz AABB_Chr16.pangenie-ready.vcf.gz AABB_Chr17.pangenie-ready.vcf.gz AABB_Chr18.pangenie-ready.vcf.gz AABB_Chr19.pangenie-ready.vcf.gz AABB_Chr20.pangenie-ready.vcf.gz -o AABB.B.vcf

python3 ~/tool/vcftoolkit/vcf_add_colsample.py AABB.A.vcf K30076 > temp.vcf
                cat temp.vcf | grep -v 'CHROM' | grep '#' > temp.header
                cat temp.vcf | grep 'CHROM' > temp.header1
                cat temp.vcf | grep -v '#' > temp.body
                cat  temp.body | awk -F '\t' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$16"\t"$11"\t"$12"\t"$15"\t"$13"\t"$14}' > temp.body_
                cat  temp.header1 | awk -F '\t' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$16"\t"$11"\t"$12"\t"$15"\t"$13"\t"$14}' > temp.header1_
                cat temp.header temp.header1_ temp.body_ > AABB.A.addK30076.vcf
                rm -rf temp*

python3 ~/tool/vcftoolkit/vcf_add_colsample.py AABB.B.vcf Adu > temp.vcf
                cat temp.vcf | grep -v 'CHROM' | grep '#' > temp.header
                cat temp.vcf | grep 'CHROM' > temp.header1
                cat temp.vcf | grep -v '#' > temp.body
                cat  temp.body | awk -F '\t' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$16"\t"$12"\t"$10"\t"$11"\t"$15"\t"$13"\t"$14}' > temp.body_
                cat  temp.header1 | awk -F '\t' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$16"\t"$12"\t"$10"\t"$11"\t"$15"\t"$13"\t"$14}' > temp.header1_
                cat temp.header temp.header1_ temp.body_ > AABB.B.addAdu.vcf
                rm -rf temp*

bcftools concat AABB.A.addK30076.vcf AABB.B.addAdu.vcf > AABB.vcf