#!/bin/bash

mkdir transcriptome
cd transcriptome
curl https://ftp.ensembl.org/pub/release-111/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz -o human.fa.gz
cd ../
./bin/salmon index -t transcriptome/human.fa.gz -i transcriptome/human_index
