#! /bin/bash

#SBATCH --time=04-00:00:00
#SBATCH --partition=bigmemq
#SBATCH --mem=192GB
#SBATCH --mail-user=myemail@houstonmethodist.org
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --ntasks-per-node=64
#SBATCH --nodes=1
#SBATCH --job-name=abx
#SBATCH --comment=abx

module load mamba
module load java/corretto/17.0.8.8.1
module load apptainer
mamba activate nfcore

nextflow run nf-core/ampliseq -r 2.8.0 --input Samplesheet.tsv --metadata PAN_Metadata.tsv --outdir PAN_ampliseq -profile singularity --picrust --metadata_category Genotype,Sex,Injury,Treatment,Timepoint --FW_primer AGAGTTTGATYMTGGCTCAG --RV_primer ATTACCGCGGCKGCTGG --trunclenf 275 --trunclenr 265 --skip_cutadapt --max_cpus 12