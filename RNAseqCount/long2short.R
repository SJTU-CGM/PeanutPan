a=read.table('NDH108ref_gene_FPKM_rep_long.tsv',header=FALSE,sep='\t')
b=reshape2::dcast(a,V2~V1)
colnames(b)[1]='Gene'
write.table(b,file='NDH108ref_gene_FPKM_rep.tsv',sep='\t',col.names=TRUE,row.names=FALSE,quote=FALSE)


