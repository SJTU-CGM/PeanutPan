#while read line
#do
genomefile=genome/Amon.chrA.fa #GCA_003063285.2_ASM306328v2_genomic.fna #${line}.fa
outdir=output/Amon_Asubgenome


#docker run -u $(id -u) \
#-v $(pwd):/busco_wd \
#ezlabgva/busco:v5.3.2_cv1 \
singularity exec busco_v5.3.2_cv1.sif \
busco -i $genomefile \
-l embryophyta_odb10 \
--offline \
-o $outdir \
-m genome \
-c 8 \
-f

#done < sample.list
