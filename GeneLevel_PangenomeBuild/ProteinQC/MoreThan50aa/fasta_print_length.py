# python3 fasta_print_length.py x.fa > l.txt
import sys

nm=''
sl=0
with open(sys.argv[1]) as f:
    for line in f:
        if line.startswith('>'):
            if sl != 0:
                print(nm+'\t'+str(sl))
            sl = 0
            nm = line.rstrip()[1:]
        else:
            sl += len(line.rstrip().rstrip('*'))
    # last one
    if sl != 0:
        print(nm + '\t' + str(sl))