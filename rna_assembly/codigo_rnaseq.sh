#los datos fueron obtenidos desde un training-data en galaxy.

#el QC y trimming será local.

conda activate bio2_rnaseq

mkdir align annot assembly logs qc quant trim

fastqc -t 4 data/raw/*.fastq -o qc/ #QC de la raw data.
multiqc qc/ -o qc/
#el reporte del QC nos da que la muestra 80_2 tiene menor calidad.
#existe un pequeño % de duplicaciones.

fastp -i data/raw/GSM461177_1_subsampled.fastq -I data/raw/GSM461177_2_subsampled.fastq \
-o trim/GSM461177_1_subsampled.trim.fastq -O trim/GSM461177_2_subsampled.trim.fastq \
 --dedup --n_base_limit 5 --length_required 25 --cut_tail 25

fastqc /trim/*.fastqc -o /trim











