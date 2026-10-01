#!/bin/bash
#SBATCH --job-name=trinity_mpp
#SBATCH --cpus-per-task=27
#SBATCH --mem=50G
#SBATCH --time=12:00:00
#SBATCH --output=logs/trinity_%j.out
#SBATCH --error=logs/trinity_%j.err

module load conda
source /home/opt/miniforge3/etc/profile.d/conda.sh
conda activate trinity_env
module load salmon


Trinity --seqType fq --max_memory 50G --CPU 27 \
--left /home/cmaldonado/bio2/MartinP/data.trim/GSM461177_1_subsampled.trim.fastq,/home/cmaldonado/bio2/MartinP/data.trim/GSM461180_1_subsampled.trim.fastq \
--right /home/cmaldonado/bio2/MartinP/data.trim/GSM461177_2_subsampled.trim.fastq,/home/cmaldonado/bio2/MartinP/data.trim/GSM461180_2_subsampled.trim.fastq \
--output /home/cmaldonado/bio2/MartinP/trinity --no_version_check
