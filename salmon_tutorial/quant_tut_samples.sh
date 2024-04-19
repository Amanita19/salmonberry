# #!/bin/bash
# for fn in data/DRR0161{25..40};
# do
# samp=`basename ${fn}`
# echo "Processing sample ${samp}"
# salmon quant -i athal_index -l A \
#          -1 ${fn}/${samp}_1.fastq.gz \
#          -2 ${fn}/${samp}_2.fastq.gz \
#          -p 8 --validateMappings -o quants/${samp}_quant
         
# done 

#!/bin/bash
for fn in data/DRR0161{25..25}; do
    samp=`basename ${fn}`
    echo "Processing sample ${samp} with EM"
    salmon quant -i athal_index -l A \
                 -1 ${fn}/${samp}_1.fastq.gz \
                 -2 ${fn}/${samp}_2.fastq.gz \
                 -p 8 --validateMappings \
                 -o quants/${samp}_quant_EM \
                 --useEM
    echo "Processing sample ${samp} with VBEM"
    for prior in 10 1 0.1 0.01 0.001 0.0001; do
        salmon quant -i athal_index -l A \
                     -1 ${fn}/${samp}_1.fastq.gz \
                     -2 ${fn}/${samp}_2.fastq.gz \
                     -p 8 --validateMappings \
                     -o quants/${samp}_quant_VBEM_${prior} \
                     --useVBOpt --vbPrior ${prior}
    done
done
