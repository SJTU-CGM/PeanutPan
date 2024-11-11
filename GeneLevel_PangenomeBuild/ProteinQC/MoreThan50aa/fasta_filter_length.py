#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    @Author: Hongzhang Xue
    @Modified: 2022/5/26 6:14 PM
    @Usage:
"""

# python3 fasta_print_length.py x.fa length > x.length.fa
import sys

nm = ''
sl = 0
seq = ''
with open(sys.argv[1]) as f:
    for line in f:
        if line.startswith('>'):
            sl = len(seq) - seq.count('\n') - seq.count(' ')
            if sl >= int(sys.argv[2]):
                print('>'+nm+'\n'+seq, end='')
            sl = 0
            nm = line.rstrip()[1:]
            seq = ''
        else:
            seq += line
    # last one
    sl = len(seq) - seq.count('\n') - seq.count(' ')
    if sl >= int(sys.argv[2]):
        print('>' + nm + '\n' + seq, end='')
