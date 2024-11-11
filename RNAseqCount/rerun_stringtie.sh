
rm -rf NDH108ref_gene_FPKM_rep_long.tsv
#rm -rf Count_sample_list.txt
th=2
for file in `ls ../NDH108bam/*-*.bam`;
do
	name=${file##*/}
	unzipname=${name%.*}
	echo $unzipname
	~/tool/stringtie-1.3.5/stringtie -b ballgown_out_dir -A ${unzipname}.gene_abund.out -p $th -G ~/panpeanut/ref/NDH108.gff3 -e -o ${unzipname}.gtf $file
	gzip -c ${unzipname}.gene_abund.out > ${unzipname}.gene_abund.out.gz
	zcat ${unzipname}.gene_abund.out.gz | awk -F '\t' -v s=${unzipname} '{print s"\t"$1"\t"$8}'|grep -v 'Gene_id' >> NDH108ref_gene_FPKM_rep_long.tsv
done

Rscript long2short.R
rm -rf NDH108ref_gene_FPKM_rep_long.tsv
cat NDH108ref_gene_FPKM_rep.tsv |grep -v 'FPKM' > temp.tsv
mv temp.tsv NDH108ref_gene_FPKM_rep.tsv



