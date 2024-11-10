# ptpg.py is from EUPAN3 project, https://github.com/zhixue/EUPAN3
# get the longest protein (CDS) transcript as the representative from each gene
# it can remove the effect of several proteins of one gene when comparing with other samples (such as the sample with only one transcript in each gene)
python3 ~/tools/EUPAN3/lib/ptpg.py -i x.gtf/x.gff3 -r cds -o x_pTpG.gtf/x_pTpG.gff