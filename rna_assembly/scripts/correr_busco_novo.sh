#!/bin/bash
#SBATCH --job-name=busco_rnaseq_novo
#SBATCH --cpus-per-task=27
#SBATCH --mem=48G
#SBATCH --time=12:00:00
#SBATCH --output=logs/busco_%j.out
#SBATCH --error=logs/busco_%j.err

module load busco

busco \
  -i /home/cmaldonado/bio2/MartinP/trinity/trinity.Trinity.fasta \
  -m transcriptome \
  -l /home/cmaldonado/bio2/practico_rna/busco_downloads/lineages/diptera_odb10 \
  -o busco_novo --out_path /home/cmaldonado/bio2/MartinP/busco_novo \
  -c 27 \
  --offline
