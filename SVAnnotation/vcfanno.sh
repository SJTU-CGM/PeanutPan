
for sample in Adu Amon H16-5 K30076 mH8 Shitouqi Tifrunner ZP06;
do 
	mkdir subsample/${sample}; 
	echo $sample; 
	~/tools/vcfanno_linux64_v0.3.3 -p 1 -ends merge.conf.toml ${sample}.vcf > ${sample}.anno.vcf;
done


