#!/bin/bash
#SBATCH --job-name=RNSspades
#SBATCH --cpus-per-task=27
#SBATCH --mem=48G
#SBATCH --time=12:00:00
#SBATCH --output=logs/spades_%j.out
#SBATCH --error=logs/spades_%j.err

module purge 
module load conda
source /home/opt/miniforge3/etc/profile.d/conda.sh
conda activate bio2_rnaseq

cd /home/cmaldonado/bio2/MartinP/rnaspades
rnaspades.py \
  -1 /home/cmaldonado/bio2/MartinP/data.trim/GSM_1_trim.fastq \
  -2 /home/cmaldonado/bio2/MartinP/data.trim/GSM_2_trim.fastq \
  -t "$SLURM_CPUS_PER_TASK" \
  -m 40 \
  -o /home/cmaldonado/bio2/MartinP/rnaspades
