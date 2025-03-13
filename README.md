# PeanutPan
PeanutPAN: Pan-genome for peanut genomics study

The codes in the project

-----------

## Directory introduction

### ReadQC
Raw sequencing data (Read) quality control, including long reads (Whole genome sequencing, WGS)/ short reads (WGS, RNA-seq).

### SNPIndelDetection 
SNP and Indel calling and filtering using short reads based on the reference genome

### PopulationGeneticAnalysis 
Population genetic analysis based on filtered SNPs such as phylogenetic tree, PCA, PI, Fst, XP-CLR and Population structure inferring

### GenomeAssembly 
High-quality genome assembly using long reads, short reads and Hi-C

### AssemblyBenchmark 
BUSCO, QUAST, LAI benchmark of genome assembly

### RepeatAnnotation 
Repeat element annotation with genome

### GeneAnnotation (Preparing)
Gene annotation with genome

### GeneLevel_PangenomeBuild
Gene-level pangenome build using orthofinder

### SequenceLevel_PangenomeBuild
Sequence-level pangenome build using minigraph-cactus

### SVDetection
SV detection with assemblies, long reads using cutesv-asm, svim-asm, cutesv

### SVAnnotation
SV annotation with gene regions using Vcfanno

### ShortReadGenotyping
Genotyping with short reads using EVG

### GWAS
GWAS with variants (SNPs or SVs) using Plink and  Emmax

### RNAseqCount 
Count gene expression level using Stringtie




If you have any questions, please contact with xuehzh95@sjtu.edu.cn.
