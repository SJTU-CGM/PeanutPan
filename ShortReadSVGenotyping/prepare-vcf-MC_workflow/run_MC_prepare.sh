module load miniconda3
source activate snakemake

for i in `seq -w 01 20`;do
        echo "#Chr"${i}
        cat config_template.yaml | sed "s/chr01/chr${i}/g" | sed "s/Chr01/Chr${i}/g" > config.yaml
        zcat /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/pan_cactus27_8/AABB_chr${i}/AABB_Chr${i}.gfa.gz > /lustre/home/acct-clswcc/clswcc-xhz/panpeanut/pan_cactus27_8/AABB_chr${i}/AABB_Chr${i}.gfa
        rm -rf results/vcf/cactus/cactus*
        snakemake -j 4 --unlock
        snakemake -j 4
        ii=`expr $i`
        if [ $ii -lt 11 ];then
                echo "A"$ii
                 cat results/vcf/cactus/cactus_filtered_ids.vcf | sed "s/_Chr${i}//g" | sed "s/A${i}/Chr${i}/g" > AABB_Chr${i}.pangenie-ready.vcf0
        else
                if [ $ii -lt 20 ];then
                        bii="0"`expr $ii - 10`
                else
                        bii=`expr $ii - 10`
                fi
                echo "B"$bii
                cat results/vcf/cactus/cactus_filtered_ids.vcf | sed "s/_Chr${i}//g" | sed "s/B${bii}/Chr${i}/g" > AABB_Chr${i}.pangenie-ready.vcf0
        fi

        python3 ~/tool/vcftoolkit/vcf_diploid.py AABB_Chr${i}.pangenie-ready.vcf0 > AABB_Chr${i}.pangenie-ready.vcf
        if [ $ii -eq 2 ] || [ $ii -eq 4 ] || [ $ii -eq 9 ];then
                echo "Add omit sample"
                python3 ~/tool/vcftoolkit/vcf_add_colsample.py AABB_Chr${i}.pangenie-ready.vcf Adu > temp.vcf
                cat temp.vcf | grep -v 'CHROM' | grep '#' > temp.header
                cat temp.vcf | grep 'CHROM' > temp.header1
                cat temp.vcf | grep -v '#' > temp.body
                cat  temp.body | awk -F '\t' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$15"\t"$10"\t"$11"\t"$12"\t"$13"\t"$14}' > temp.body_
                cat  temp.header1 | awk -F '\t' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$15"\t"$10"\t"$11"\t"$12"\t"$13"\t"$14}' > temp.header1_
                cat temp.header temp.header1_ temp.body_ > AABB_Chr${i}.pangenie-ready.vcf
                rm -rf temp*
        fi
        rm -rf *vcf0
        bgzip AABB_Chr${i}.pangenie-ready.vcf
        tabix AABB_Chr${i}.pangenie-ready.vcf.gz
done