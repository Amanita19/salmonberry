#!/bin/bash

#SBATCH --job-name=test
#SBATCH --output=test.out.%j
#SBATCH --error=test.err.%j
#SBATCH --time=01-00:00:00
#SBATCH --account=cbcb
#SBATCH --qos=huge-long
#SBATCH --nodes=24
#SBATCH --ntasks=24
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10000
#SBATCH --partition=cbcb

for fn in simulated_data/out_{1..12};
do
samp=`basename ${fn}`

srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=1000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp}\"; ./bin/salmon quant -i transcriptome/human_index -l A -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 8 --validateMappings -o quants/${samp}_01_quant"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=1000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp}\"; ./bin/salmon quant -i transcriptome/human_index -l A -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 8 --validateMappings -o quants/${samp}_02_quant"&

done

wait
