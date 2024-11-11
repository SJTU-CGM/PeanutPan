#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    @Author: Hongzhang Xue
    @Modified: 2020/12/28 2:50 PM
    @Usage: python3 pTpG.py -i x.gtf/x.gff3 -r cds -o x_pTpG.gtf/x_pTpG.gff
"""

import os
import argparse


def string2dict(long_string, sep=';', eq='=', rm_quote=False):
    if rm_quote:
        long_string = long_string.replace('"', '').replace("'", '')
    long_string = long_string.replace('; ', ';')
    out_dict = dict()
    tmp = long_string.rstrip(sep).split(sep)
    for i in tmp:
        key, value = i.split(eq)
        out_dict[key] = value
    return out_dict


class Genomic_element(object):
    # type only support: gene, mRNA/transcript, exon, CDS, five_prime_UTR, three_prime_UTR, start_codon, end_codon
    def __init__(self, line_string):
        self.string = line_string  # including '\n'
        self.chr, self.source, self.type, self.start, self.end, \
        self.score, self.strand, self.phase, self.attributes = line_string.rstrip().split('\t')
        self.details = string2dict(self.attributes)

    def find_parentid(self):
        if 'Parent' in self.details:
            parent_id = self.details['Parent']
        else:
            parent_id = ''
        return parent_id

    def get_id(self):
        return self.details["ID"]

    def get_length(self):
        return abs(int(self.end) - int(self.start)) + 1


class Transcript(Genomic_element):
    def __init__(self, transcript_line):
        Genomic_element.__init__(self, transcript_line)
        self.CDSs = dict()
        self.exons = dict()
        self.UTR5s = dict()
        self.UTR3s = dict()
        self.start_codons = dict()
        self.end_codons = dict()

    def add_exon(self, exon_obj):
        exon_id = exon_obj.details['ID']
        self.exons[exon_id] = exon_obj

    def add_CDS(self, cds_obj):
        cds_id = cds_obj.details['ID']
        self.CDSs[cds_id] = cds_obj

    def add_UTR5(self, utr5_obj):
        utr5_id = utr5_obj.details['ID']
        self.UTR5s[utr5_id] = utr5_obj

    def add_UTR3(self, utr3_obj):
        utr3_id = utr3_obj.details['ID']
        self.UTR3s[utr3_id] = utr3_obj

    def add_start_codon(self, start_codon_obj):
        start_codon_id = start_codon_obj.details['ID']
        self.start_codons[start_codon_id] = start_codon_obj

    def add_end_codon(self, end_codon_obj):
        end_codon_id = end_codon_obj.details['ID']
        self.end_codons[end_codon_id] = end_codon_obj

    def get_key_length(self, key='CDS'):
        sum_len = 0
        if key == 'CDS':
            for cds_ele in self.CDSs:
                sum_len += cds_ele.get_length()
            return sum_len
        elif key == 'exon':
            for exon_ele in self.exons:
                sum_len += exon_ele.get_length()
            return sum_len
        else:
            # transcript length
            return self.get_length()


class Gene(Genomic_element):
    def __init__(self, gene_line):
        Genomic_element.__init__(self, gene_line)
        self.transcripts = dict()

    def add_transcript(self, transcript_obj):
        transcript_id = transcript_obj.details['ID']
        self.transcripts[transcript_id] = transcript_obj

    def delete_short_transcripts(self, key='CDS'):
        longest_transcript = None
        max_length = 0
        for transcript_id, transcript_obj in self.transcripts:
            temp_length = transcript_obj.get_key_length(key=key)
            if temp_length > max_length:
                longest_transcript = transcript_obj
                max_length = temp_length
        self.transcripts = {longest_transcript.details['ID']: longest_transcript}


def pTpG_gtf(ingtf, region, outgtf):


    current_gene = ''
    block_string = dict()
    block_length = dict()

    with open(ingtf) as f:
        with open(outgtf, 'w') as fout:
            for line in f:
                temp = line.rstrip().split('\t')
                # like transcript_id "LOC_Os01g01010.1"; gene_id "LOC_Os01g01010";
                attr = string2dict(temp[8], eq=' ', rm_quote=True)
                trans_id = attr['transcript_id']
                gene_id = attr['gene_id']
                if current_gene != gene_id and current_gene != '':
                    # check
                    max_len = 0
                    max_len_trans = ''
                    if block_length:
                        for trans in block_length:
                            if block_length[trans] > max_len:
                                max_len = block_length[trans]
                                max_len_trans = trans
                        fout.write(block_string[max_len_trans])
                    # init
                    block_string = dict()
                    block_length = dict()

                current_gene = gene_id

                if not trans_id in block_string:
                    block_string[trans_id] = line
                else:
                    block_string[trans_id] += line

                if temp[2] == region or temp[2] == 'stop_codon':
                    start = int(temp[3])
                    end = int(temp[4])
                    if trans_id not in block_length:
                        block_length[trans_id] = end - start + 1
                    else:
                        block_length[trans_id] += end - start + 1

            # last one
            if current_gene != '':
                # check
                max_len = 0
                max_len_trans = ''
                for trans in block_length:
                    if block_length[trans] > max_len:
                        max_len = block_length[trans]
                        max_len_trans = trans
                fout.write(block_string[max_len_trans])


def pTpG_gff(ingff, region, outgff):
    gene_length_dict = dict()  # {'gene1':{'mRNA1':200,'mRNA2':120}}
    transcripts_dict = dict()  # {'mRNA1':{'key1':(120,200),'key2',(202,209)},'mRNA2':{'key1':(120,200)}}

    with open(ingff) as f:
        for line in f:
            # pass comment and blank
            if line.startswith('#'):
                continue
            if len(line.rstrip()) == 0:
                continue

            temp = line.rstrip().split('\t')
            line_type = temp[2]

            lineid = string2dict(temp[-1])['ID']
            if line_type == 'gene':
                gene_length_dict[lineid] = dict()
            elif line_type in ('transcript', 'mRNA'):
                geneid = string2dict(temp[-1])['Parent']
                transcriptid = lineid
                gene_length_dict[geneid][transcriptid] = 0
                transcripts_dict[transcriptid] = dict()
            elif line_type == region:
                transcriptid = string2dict(temp[-1])['Parent']
                elementid = lineid
                transcripts_dict[transcriptid][elementid] = tuple((int(temp[3]), int(temp[4])))
    # sum cds
    for gene in gene_length_dict:
        for transcript in gene_length_dict[gene]:
            sumlen = 0
            for key in transcripts_dict[transcript]:
                e_start = transcripts_dict[transcript][key][0]
                e_end = transcripts_dict[transcript][key][1]
                sumlen += e_end - e_start + 1
            gene_length_dict[gene][transcript] = sumlen
    # get max
    for gene in gene_length_dict:
        maxtranscript = ''
        maxlen = 0
        for transcript in gene_length_dict[gene]:
            if gene_length_dict[gene][transcript] > maxlen:
                maxtranscript = transcript
                maxlen = gene_length_dict[gene][transcript]
        gene_length_dict[gene] = {maxtranscript: maxlen}

    # write
    with open(ingff) as f:
        with open(outgff, 'w') as fout:
            for line in f:
                # pass comment and blank
                if line.startswith('#'):
                    continue
                if len(line.rstrip()) == 0:
                    continue

                temp = line.rstrip().split('\t')
                line_type = temp[2]
                lineid = string2dict(temp[-1])['ID']
                if line_type == 'gene':
                    fout.write(line)
                elif line_type in ('transcript', 'mRNA'):
                    geneid = string2dict(temp[-1])['Parent']
                    transcriptid = lineid
                    if transcriptid in gene_length_dict[geneid]:
                        fout.write(line)
                else:
                    transcriptid = string2dict(temp[-1])['Parent']
                    if transcriptid in gene_length_dict[geneid]:
                        fout.write(line)

    '''
    current_gene = ''
    current_transcript = ''
    gene_dict = dict()
    gene_order = dict()
    order = 0

    with open(ingtf) as f:
        with open(outgtf, 'w') as fout:
            for line in f:
                # pass comment
                if line.startswith('#'):
                    continue

                temp = line.rstrip().split('\t')
                line_type = temp[2]
                if line_type == 'gene':
                    temp_gene = Gene(line)
                    order += 1
                    current_gene = temp_gene.get_id()
                    gene_dict[current_gene] = temp_gene
                    # init
                    current_transcript = ''
                elif line_type in ('transcript','mRNA'):
                    temp_transcript = Transcript(line)
                    # current_gene = temp_transcript.find_parentid()
                    gene_dict[current_gene].add_transcript(temp_transcript)
                    current_transcript = temp_transcript.get_id()
                else:
                    temp_ele = Genomic_element(line)
                    if temp_ele.type == 'CDS':

                    elif temp_ele.type == 'exon':

                    elif temp_ele.type == 'five_prime_UTR, three_prime_UTR, start_codon, end_codon'
    '''


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='''Extract the longest transcript elements' records for each gene, according to CDS or exon length''')
    parser.add_argument('-i', '--input', metavar='<input.gff/gtf>', help='Path of input gff/gtf', type=str, required=True)
    parser.add_argument('-r', '--region', metavar='<str>', help='CDS or exon (default: CDS)', type=str, choices=['CDS', 'exon'], default='CDS', required=True)
    parser.add_argument('-o', '--output', metavar='<output.gff/gtf>', help='Path of output gff/gtf', type=str, required=True)

    args = vars(parser.parse_args())
    input_path = os.path.abspath(args['input'])
    output_path = os.path.abspath(args['output'])
    region = args['region']

    # error check
    if input_path == output_path:
        print('# Error: input is same as output gff!')
        exit(1)

    if input_path.endswith('gtf'):
        pTpG_gtf(input_path, region, output_path)
    elif input_path.endswith('gff') or input_path.endswith('gff3'):
        pTpG_gff(input_path, region, output_path)

