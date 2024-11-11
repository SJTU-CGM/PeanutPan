#python3 gffstats.py x.gff chrprefix protein_cut
import sys

def string2dict(long_string, sep=';', eq='=', rm_quote=False):
    if rm_quote:
        long_string = long_string.replace('"', '').replace("'", '')
    long_string = long_string.replace('; ', ';')
    out_dict = dict()
    tmp = long_string.rstrip(sep).split(sep)
    for i in tmp:
        if len(i.split(eq)) == 2:
            key, value = i.split(eq)
        else:
            key = i.split(eq)[0]
            value = eq.join(i.split(eq)[1:])
        out_dict[key] = value
    return out_dict


chrprefix = sys.argv[2].split(',')
protein_cut = int(sys.argv[3])




gene_dict = dict() # {'gene1':{'chr':1, 'protein':{'p1':231/3}}}
mRNA2gene = dict()

current_gene = ''
with open(sys.argv[1]) as f:
	for line in f:
		if line.startswith('#'):
			continue
		temp = line.rstrip().split('\t')
		if temp[2] == 'gene':
			current_gene = string2dict(temp[-1])['ID']
			gene_dict[current_gene] = {'chr':0, 'protein':{}}
			for prefix in chrprefix:
				if temp[0].startswith(prefix):
					gene_dict[current_gene]['chr'] = 1

		if temp[2] == 'mRNA':
			mrna = string2dict(temp[-1])['ID']
			mRNA2gene[mrna] = string2dict(temp[-1])['Parent']
			gene_dict[mRNA2gene[mrna]]['protein'][mrna] = 0


		if temp[2] == 'CDS':
			mrna = string2dict(temp[-1])['Parent']
			gene_dict[mRNA2gene[mrna]]['protein'][mrna] += int(temp[4]) - int(temp[3]) + 1

n_list = [0,0,0,0,0,0,0,0] 
''' [chr_gene_n, nonchr_gene_n, 
chr_coding_gene_n, nonchr_coding_gene_n,
chr_protein_n, nonchr_protein_n,
chr_protein_large_than_cut_n, nonchr_protein_large_than_cut_n]'''



for gene in gene_dict:
	if gene_dict[gene]['chr'] != 1:
		shift = 1
	else:
		shift = 0
	n_list[0+shift] += 1

	protein_coding_flag = 0
	for protein in gene_dict[gene]['protein']:
		if gene_dict[gene]['protein'][protein] >= protein_cut * 3:
			n_list[6+shift] += 1
		if gene_dict[gene]['protein'][protein] > 0:
			protein_coding_flag = 1
			n_list[4+shift] += 1
	if protein_coding_flag:
		n_list[2+shift] += 1


print(n_list)






