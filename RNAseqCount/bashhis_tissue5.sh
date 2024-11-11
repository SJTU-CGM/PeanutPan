#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -J fastp
#SBATCH -p cpu
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -n 16
#SBATCH --output=%J.out
#SBATCH --error=%J.err

#while read line
#do
#sample=$line
#for sample in 
	#H107_0h_1 H107_0h_2 H107_0h_3 H107_12h_1 H107_12h_2 H107_12h_3 H107_24h_1 H107_24h_2 H107_24h_3 H108_0h_1 H108_0h_2 H108_0h_3 H108_12h_1 H108_12h_2 H108_12h_3 H108_24h_1 H108_24h_2 H108_24h_3;
	#=H107_0h_1
#do
fqdir=~/temp/Peanut5Tissue_rep3/raw_data/MGI/RNA
th=16
sample=H16-5-flower_1
in1=${fqdir}/H16-5-flower/10.39G/E200017256_L01_93_1.fq.gz #/lustre/home/acct-clswcc/clswcc-xhz/temp/Peanut2024DataNDH108/1.filter-rawdata/${sample}_1.fq.gz #~/temp/CleanData20240226/${sample}/${sample}_Clean_Data1.fq.gz
in2=${fqdir}/H16-5-flower/10.39G/E200017256_L01_93_2.fq.gz #/lustre/home/acct-clswcc/clswcc-xhz/temp/Peanut2024DataNDH108/1.filter-rawdata/${sample}_2.fq.gz #~/temp/CleanData20240226/${sample}/${sample}_Clean_Data2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz

#/share/public-software/fastp.0.23.1 
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-flower_2
in1=${fqdir}/H16-5-flower/9.46G/E200017256_L01_95_1.fq.gz
in2=${fqdir}/H16-5-flower/9.46G/E200017256_L01_95_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-flower_3
in1=${fqdir}/H16-5-flower/9.81G/E200017256_L01_94_1.fq.gz
in2=${fqdir}/H16-5-flower/9.81G/E200017256_L01_94_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-fruit_1
in1=${fqdir}/H16-5-fruit/10.07G/E200017256_L01_90_1.fq.gz
in2=${fqdir}/H16-5-fruit/10.07G/E200017256_L01_90_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-fruit_2
in1=${fqdir}/H16-5-fruit/10.32G/E200017256_L01_91_1.fq.gz
in2=${fqdir}/H16-5-fruit/10.32G/E200017256_L01_91_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-fruit_3
in1=${fqdir}/H16-5-fruit/9.86G/E200017256_L01_92_1.fq.gz
in2=${fqdir}/H16-5-fruit/9.86G/E200017256_L01_92_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-leaf_1
in1=${fqdir}/H16-5-L/10.1G/E200017197_L01_146_1.fq.gz
in2=${fqdir}/H16-5-L/10.1G/E200017197_L01_146_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-leaf_2
in1=${fqdir}/H16-5-L/10.33G/E200017197_L01_145_1.fq.gz
in2=${fqdir}/H16-5-L/10.33G/E200017197_L01_145_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=H16-5-leaf_3
in1=${fqdir}/H16-5-L/12.82G/E200017197_L01_144_1.fq.gz
in2=${fqdir}/H16-5-L/12.82G/E200017197_L01_144_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-flower_1
in1=${fqdir}/mH8-flower/11.1G/E200017197_L01_133_1.fq.gz
in2=${fqdir}/mH8-flower/11.1G/E200017197_L01_133_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-flower_2
in1=${fqdir}/mH8-flower/11.59G/E200017197_L01_134_1.fq.gz
in2=${fqdir}/mH8-flower/11.59G/E200017197_L01_134_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-flower_3
in1=${fqdir}/mH8-flower/9.8G/E200017197_L01_132_1.fq.gz
in2=${fqdir}/mH8-flower/9.8G/E200017197_L01_132_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-fruit_1
in1=${fqdir}/mH8-friut/10.35G/E200017197_L01_130_1.fq.gz
in2=${fqdir}/mH8-friut/10.35G/E200017197_L01_130_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-fruit_2
in1=${fqdir}/mH8-friut/11.23G/E200017197_L01_129_1.fq.gz
in2=${fqdir}/mH8-friut/11.23G/E200017197_L01_129_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-fruit_3
in1=${fqdir}/mH8-friut/11.48G/E200017197_L01_131_1.fq.gz
in2=${fqdir}/mH8-friut/11.48G/E200017197_L01_131_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-leaf_1
in1=${fqdir}/mH8-L/10.87G/E200017197_L01_139_1.fq.gz
in2=${fqdir}/mH8-L/10.87G/E200017197_L01_139_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-leaf_2
in1=${fqdir}/mH8-L/11.93G/E200017197_L01_140_1.fq.gz
in2=${fqdir}/mH8-L/11.93G/E200017197_L01_140_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-leaf_3
in1=${fqdir}/mH8-L/12.7G/E200017197_L01_138_1.fq.gz
in2=${fqdir}/mH8-L/12.7G/E200017197_L01_138_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-root_1
in1=${fqdir}/mH8-R/10.15G/E200017197_L01_143_1.fq.gz
in2=${fqdir}/mH8-R/10.15G/E200017197_L01_143_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-root_2
in1=${fqdir}/mH8-R/10.46G/E200017197_L01_142_1.fq.gz
in2=${fqdir}/mH8-R/10.46G/E200017197_L01_142_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-root_3
in1=${fqdir}/mH8-R/11.49G/E200017197_L01_141_1.fq.gz
in2=${fqdir}/mH8-R/11.49G/E200017197_L01_141_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-stem_1
in1=${fqdir}/mH8-S/8.65G/E200017256_L01_113_1.fq.gz
in2=${fqdir}/mH8-S/8.65G/E200017256_L01_113_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-stem_2
in1=${fqdir}/mH8-S/9.12G/E200017256_L01_112_1.fq.gz
in2=${fqdir}/mH8-S/9.12G/E200017256_L01_112_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=mH8-stem_3
in1=${fqdir}/mH8-S/9.76G/E200017256_L01_114_1.fq.gz
in2=${fqdir}/mH8-S/9.76G/E200017256_L01_114_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-flower_1
in1=${fqdir}/NDH108-flower/10.12G/E200017256_L01_110_1.fq.gz
in2=${fqdir}/NDH108-flower/10.12G/E200017256_L01_110_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-flower_2
in1=${fqdir}/NDH108-flower/9.16G/E200017256_L01_111_1.fq.gz
in2=${fqdir}/NDH108-flower/9.16G/E200017256_L01_111_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-flower_3
in1=${fqdir}/NDH108-flower/9.89G/E200017256_L01_109_1.fq.gz
in2=${fqdir}/NDH108-flower/9.89G/E200017256_L01_109_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-fruit_1
in1=${fqdir}/NDH108-fruit/11.09G/E200017256_L01_108_1.fq.gz
in2=${fqdir}/NDH108-fruit/11.09G/E200017256_L01_108_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-fruit_2
in1=${fqdir}/NDH108-fruit/9.03G/E200017256_L01_106_1.fq.gz
in2=${fqdir}/NDH108-fruit/9.03G/E200017256_L01_106_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-fruit_3
in1=${fqdir}/NDH108-fruit/9.37G/E200017256_L01_107_1.fq.gz
in2=${fqdir}/NDH108-fruit/9.37G/E200017256_L01_107_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-leaf_1
in1=${fqdir}/NDH108-L/11.13G/E200017197_L01_148_1.fq.gz
in2=${fqdir}/NDH108-L/11.13G/E200017197_L01_148_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-leaf_2
in1=${fqdir}/NDH108-L/11.39G/E200017197_L01_147_1.fq.gz
in2=${fqdir}/NDH108-L/11.39G/E200017197_L01_147_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-leaf_3
in1=${fqdir}/NDH108-L/11.54G/E200017197_L01_149_1.fq.gz
in2=${fqdir}/NDH108-L/11.54G/E200017197_L01_149_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-stem_1
in1=${fqdir}/NDH108-S/10.18G/E200017256_L01_119_1.fq.gz
in2=${fqdir}/NDH108-S/10.18G/E200017256_L01_119_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-stem_2
in1=${fqdir}/NDH108-S/9.2G/E200017256_L01_118_1.fq.gz
in2=${fqdir}/NDH108-S/9.2G/E200017256_L01_118_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=NDH108-stem_3
cat ${fqdir}/NDH108-S/7.38G/E200017256_L01_120_1.fq.gz ${fqdir}/NDH108-S/7.38G/E200017256_L01_120_1.fq.gz > ~/temp/NDH108_stem_3.R1.fq.gz
cat ${fqdir}/NDH108-S/7.38G/E200017256_L01_120_2.fq.gz ${fqdir}/NDH108-S/7.38G/E200017256_L01_120_2.fq.gz > ~/temp/NDH108_stem_3.R2.fq.gz
in1=~/temp/NDH108_stem_3.R1.fq.gz
in2=~/temp/NDH108_stem_3.R2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}
rm -rf ~/temp/NDH108_stem_3.R1.fq.gz
rm -rf ~/temp/NDH108_stem_3.R2.fq.gz

sample=ZP06-flower_1
in1=${fqdir}/ZP06-flower/11.17G/E200017197_L01_135_1.fq.gz
in2=${fqdir}/ZP06-flower/11.17G/E200017197_L01_135_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-flower_2
in1=${fqdir}/ZP06-flower/12.25G/E200017197_L01_137_1.fq.gz
in2=${fqdir}/ZP06-flower/12.25G/E200017197_L01_137_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-flower_3
in1=${fqdir}/ZP06-flower/14.21G/E200017197_L01_136_1.fq.gz
in2=${fqdir}/ZP06-flower/14.21G/E200017197_L01_136_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-fruit_1
in1=${fqdir}/ZP06-fruit/8.29G/E200017256_L01_105_1.fq.gz
in2=${fqdir}/ZP06-fruit/8.29G/E200017256_L01_105_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-fruit_2
in1=${fqdir}/ZP06-fruit/8.71G/E200017256_L01_104_1.fq.gz
in2=${fqdir}/ZP06-fruit/8.71G/E200017256_L01_104_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-fruit_3
in1=${fqdir}/ZP06-fruit/8.95G/E200017256_L01_96_1.fq.gz
in2=${fqdir}/ZP06-fruit/8.95G/E200017256_L01_96_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-stem_1
in1=${fqdir}/ZP06-S/10.27G/E200017256_L01_117_1.fq.gz
in2=${fqdir}/ZP06-S/10.27G/E200017256_L01_117_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-stem_2
in1=${fqdir}/ZP06-S/8.81G/E200017256_L01_115_1.fq.gz
in2=${fqdir}/ZP06-S/8.81G/E200017256_L01_115_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}

sample=ZP06-stem_3
in1=${fqdir}/ZP06-S/9.93G/E200017256_L01_116_1.fq.gz
in2=${fqdir}/ZP06-S/9.93G/E200017256_L01_116_2.fq.gz
ot1=${sample}.R1.fq.gz
ot2=${sample}.R2.fq.gz
~/tool/fastp.0.23.1 -i $in1 -o $ot1 -I $in2 -O $ot2 -h ${sample}_fastp.html -j ${sample}_fastp.json -w ${th}


#done < /lustre/home/acct-clswcc/clswcc-xhz/temp/Peanut2024DataNDH108/1.filter-rawdata/sample_list.txt

#/share/public-software/fastp.0.23.1 -i ~/temp/download/WHXWZKY-202105134B-01/raw_data/raw_data/MGI/RNA/NDH814-S/10.7G/R2106151A_raw_1.fq.gz -o ${sample}.R1.fq.gz -I ~/temp/download/WHXWZKY-202105134B-01/raw_data/raw_data/MGI/RNA/NDH814-S/10.7G/R2106151A_raw_2.fq.gz -O ${sample}.R2.fq.gz -w 16; mv fastp.html ${sample}_fastp.html; mv fastp.json ${sample}_fastp.json;
#i=I
#/share/public-software/fastp.0.23.1 -i ~/temp/RNASeq/raw/H8107-seed/H8107_${i}_1.fq.gz -o H8107_seed_${i}.R1.fq.gz -I ~/temp/RNASeq/raw/H8107-seed/H8107_${i}_2.fq.gz -O H8107_seed_${i}.R2.fq.gz -w 8; mv fastp.html H8107_seed_${i}_fastp.html; mv fastp.json H8107_seed_${i}_fastp.json;

#/share/public-software/fastp.0.23.1 -i ~/temp/RNASeq/raw/NDH108-fruit/R2114150A_raw_1.fq.gz -o NDH108_fruit.R1.fq.gz -I ~/temp/RNASeq/raw/NDH108-fruit/R2114150A_raw_2.fq.gz -O NDH108_fruit.R2.fq.gz


