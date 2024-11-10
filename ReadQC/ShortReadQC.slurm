module load fastp # 0.23.2

while read s;
do


inf1=/share/data/PANpeanut/SGSWGS/${s}_1.fq.gz
inf2=/share/data/PANpeanut/SGSWGS/${s}_2.fq.gz

outf1=${s}_1.fq.gz
outf2=${s}_2.fq.gz
echo $s

############# 
# QC with fastp, same with RNA-seq / Whole genome sequencing
fastp -i $inf1 -o $outf1 -I $inf2 -O $outf2 -h ${s}_fastp.html -j ${s}_fastp.json

done < listSA.temp

############# 
# Merge all fastp results with multiqc
# module load miniconda3
# source activate bio
# multiqc --file-list fastpresultlist.txt -f -o batch1_fastp_data