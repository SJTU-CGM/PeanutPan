for file in *pep
do
	echo $file
	/share/public-software/interproscan-5.55-88.0/interproscan.sh --goterms --pathways -i $file -f tsv -dp

done
