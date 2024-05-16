#!/bin/bash

mkdir transcriptome
cd transcriptome
curl https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_28/GRCh37_mapping/gencode.v28lift37.transcripts.fa.gz -o human.fa.gz
cd ../
./bin/salmon index -t transcriptome/human.fa.gz -i transcriptome/human_index
