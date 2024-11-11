
source activate biom

python3 ~/tools/vcf2phylip/vcf2phylip.py -i convertsnp.MAF005.MISS05.rename.vcf
# convertsnp.MAF005.MISS05.rename.min4.phy
python3 ~/peanut/plytree/formph.py -i convertsnp.MAF005.MISS05.rename.min4.phy > convertsnp.MAF005.MISS05.rename.min4.processed.phy
#
#seqboot<seqboot.par &&mv outfile seqboot.out &&dnadist<dnadist.par &&  mv outfile dnadist.out && neighbor<neighbor.par && mv  outfile nei.out && mv outtree nei.tree  && consense<consense.par && mv outfile cons.out && mv outtree constree  
