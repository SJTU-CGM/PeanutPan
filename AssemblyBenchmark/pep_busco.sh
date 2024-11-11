pepfile=pep/NDH108_uPASAst.pep #NDH108_maker.pep #NDH108_uPASA.pep #STTD.fixed.sorted.pep #miniprot.fixed.sorted.pep #H1314.pep
outdir=output/NDH108_uPASAst #STTD_fixed_sorted #miniprot_fixed_sorted #H1314_pep


docker run -u $(id -u) \
-v $(pwd):/busco_wd \
ezlabgva/busco:v5.3.2_cv1 \
busco -i $pepfile \
-l embryophyta_odb10 \
--offline \
-o $outdir \
-m proteins \
-c 16 \
-f

