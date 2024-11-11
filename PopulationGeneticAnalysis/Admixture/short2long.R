a=read.table('tmp.txt',header=FALSE)
b=reshape2::melt(a,id.vars=c('V2','V1'))
colnames(b)[1]='Sample'
write.table(b,file='count.tsv',sep='\t',col.names=TRUE,row.names=FALSE,quote=FALSE)



