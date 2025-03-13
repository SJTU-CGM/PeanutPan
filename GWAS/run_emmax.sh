# GWAS with Plink and Emmax
emmaxkin="~/tool/emmax-beta-07Mar2010/emmax-kin"
emmax="~/tool/emmax-beta-07Mar2010/emmax"

pheno=SeedWeight      #SeedLength
pheloc=~/panpeanut/phe/WGS/WGSAABBc221_Seed_info.tsv
name=SVAssRead_${pheno} ## SNP_${pheno}, MC_${pheno}

### prepare phenotype using Plink
~/tool/download/plink --vcf ${name}.vcf --recode 12 transpose --out ${name} --autosome-num 20 --allow-extra-chr --double-id
python3 ~/tool/emmax-beta-07Mar2010/add_phenotype.py -p $pheloc -f ${name}.tfam -o ${name}.tfam -s " " -m "NA" -t $pheno
awk '{print $1"\t"$2"\t"$6}' < ${name}.tfam > ${name}.fam


### GWAS with variants using GWAS
$emmaxkin -v -h -d 10 ${name}
$emmax -v -d 10 -t ${name} -p ${name}.fam -k ${name}.hBN.kinf -o ${name}_emmax
######### XXXXX_emmax.ps output: SNP ID,SE(beta),p-value.