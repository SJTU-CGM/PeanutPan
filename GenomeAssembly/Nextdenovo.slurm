#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -J nextdenovo_ont
#SBATCH -p huge
#SBATCH --mail-user=xuehzh95@sjtu.edu.cn
#SBATCH --mail-type=ALL
#SBATCH -N 1
#SBATCH --output=%J.out
#SBATCH --error=%J.err
#SBATCH --exclusive
sample=mH8
th=40
source ~/tool/map.path
proj=nextdenovo #2.4.0



#ont
fqdir=/lustre/home/acct-clswcc/clswcc/data/Peanut/TrimmedLongRead
#fqfile=${fqdir}/${sample}.fq.gz
fqfile=${sample}.fq.gz

# outdir
mkdir ${sample}
cd ${sample}

# copy template 

ls ${fqdir}/${sample}.fq.gz > input.fofn
cp ../template.cfg ./nextdenovo.cfg


nextDenovo nextdenovo.cfg

##### 
## template.cfg
#[General]
#job_type = local
#job_prefix = nextDenovo
#task = all #assemble #correct #all # 'all', 'correct', 'assemble'
#rewrite = yes # yes/no
#deltmp = yes
#rerun = 3
#parallel_jobs = 10
#input_type = raw
#input_fofn = input.fofn
#workdir = rundir
#[correct_option]
#read_cutoff = 1000
#seed_cutoff = 20000 #15000 # 20000
#blocksize = 16g
#pa_correction = 10
#seed_cutfiles = 10
#sort_options = -m 16g -t 4 -k 40
#minimap2_options_raw = -x ava-ont -t 4
#correction_options = -p 10

#[assemble_option]
#random_round = 20
#minimap2_options_cns = -x ava-ont -t 40 -k17 -w17
#nextgraph_options = -a 1