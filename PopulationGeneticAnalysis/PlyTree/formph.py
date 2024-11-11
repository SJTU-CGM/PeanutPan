#cat formph.py
import re,argparse

parser = argparse.ArgumentParser(description='This script was used to download genbank file')
parser.add_argument('-i','--input_name',help='Please input  out_put directory path;default cwd',required=True)
args = parser.parse_args()
names = set()
with open(args.input_name) as f:
    line_lst=f.readlines()
    print(line_lst[0].strip("\n"))
    for line in line_lst[1:]:
        name,seq=[k for k in line.strip("\n").split(" ") if k!=""]
        #name="_".join(name.split("_")[1:])
        seq=seq.strip("\n")
        if len(name)>=10:
            name = name.replace('F605_','').replace('C322_','')
            if len(name)>=10:
                name = name[:10]
            if name in names:
                print(name)
                print('error')
                exit()
            names.add(name)
            
        seq_lst=re.findall('.{10}',seq)
        seq_lst.append(seq[-(len(seq)%10):])
        print("{}{}".format(name," "*(10-len(name)))," ".join(seq_lst))
        #else:
            #print("your name is too long!")
