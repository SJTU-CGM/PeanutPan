module load miniconda3
source activate HiC-Pro_v3.1.0
export PATH=$PATH:/share/home/user/hzxue/tools/HiC-Pro_3.1.0/HiC-Pro_3.1.0/bin
#/share/home/user/hzxue/tools/HiC-Pro/bin/

#mkdir Hicdata_tmp
#mkdir Hicdata_tmp/NDH108
#zcat /share/data/PANpeanut/SGSWGS/fastq/HiC/NDH108-G2/*/*_1.fq.gz > Hicdata_tmp/ND
FULL_PATH_TO_DATA_FOLDER=/share/home/user/hzxue/peanut/HiC/HiCPro/Hicdata_tmp #/share/data/PANpeanut/SGSWGS/fastq/HiC/
FULL_PATH_TO_OUTPUTS=/share/home/user/hzxue/peanut/HiC/HiCPro/hicpro_out
MY_LOCAL_CONFIG_FILE=/share/home/user/hzxue/peanut/HiC/HiCPro/config-hicpro.txt


HiC-Pro -i $FULL_PATH_TO_DATA_FOLDER -o $FULL_PATH_TO_OUTPUTS -c $MY_LOCAL_CONFIG_FILE


