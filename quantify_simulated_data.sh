#!/bin/bash

#SBATCH --job-name=test
#SBATCH --output=test.out.%j
#SBATCH --error=test.err.%j
#SBATCH --time=01-00:00:00
#SBATCH --account=cbcb
#SBATCH --qos=huge-long
#SBATCH --nodes=32
#SBATCH --ntasks=32
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5000
#SBATCH --partition=cbcb

for fn in simulated_data/out_{1..12};
do
samp=`basename ${fn}`

srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 1e-5\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-5 --validateMappings -o quants/${samp}_01_quant_VBEM_10^-5"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 1e-5\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-5 --validateMappings -o quants/${samp}_02_quant_VBEM_10^-5"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 1e-4\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-4  --validateMappings -o quants/${samp}_01_quant_VBEM_10^-4"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 1e-4\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-4 --validateMappings -o quants/${samp}_02_quant_VBEM_10^-4"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 1e-3\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-3 --validateMappings -o quants/${samp}_01_quant_VBEM_10^-3"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 1e-3\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-3 --validateMappings -o quants/${samp}_02_quant_VBEM_10^-3"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 1e-2\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-2 --validateMappings -o quants/${samp}_01_quant_VBEM_10^-2"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 1e-2\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-2 --validateMappings -o quants/${samp}_02_quant_VBEM_10^-2"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 1e-1\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-1 --validateMappings -o quants/${samp}_01_quant_VBEM_10^-1"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 1e-1\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1e-1 --validateMappings -o quants/${samp}_02_quant_VBEM_10^-1"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 1\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1 --validateMappings -o quants/${samp}_01_quant_VBEM_10^0"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 1\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 1 --validateMappings -o quants/${samp}_02_quant_VBEM_10^0"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with VBEM prior 10\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 10 --validateMappings -o quants/${samp}_01_quant_VBEM_10^1"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with VBEM prior 10\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --vbPrior 10 --validateMappings -o quants/${samp}_02_quant_VBEM_10^1"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with EM\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --useEM --validateMappings -o quants/${samp}_01_quant_EM"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with EM\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --useEM --validateMappings -o quants/${samp}_02_quant_EM"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 1 of 2 in ${samp} with both\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_01_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_01_2_shuffled.fa.gz -p 6 --gcBias --useBoth --vbPrior 1e-5 --validateMappings -o quants/${samp}_01_quant_both_10^-5"&
srun --time=01-00:00:00 --account=cbcb --qos=huge-long --nodes=1 --ntasks=1 --partition=cbcb --mem=5000 bash -c "hostname; echo \"Processing sample 2 of 2 in ${samp} with both\"; ./bin/salmon quant -i transcriptome/human_index -l IU -1 ${fn}/${samp}/sample_02_1_shuffled.fa.gz -2 ${fn}/${samp}/sample_02_2_shuffled.fa.gz -p 6 --gcBias --useBoth --vbPrior 1e-5 --validateMappings -o quants/${samp}_02_quant_both_10^-5"&

done

wait
