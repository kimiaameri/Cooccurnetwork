#!/bin/sh
#SBATCH --time=80:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=60250     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=coocnet
#SBATCH --error=coocnet.%J.err
#SBATCH --output=coocnet.%J.out
######## VCF2Fasta #########
export MINICONDA_HOME="~/miniconda3/bin/"
export GITHUB_DIR=`pwd`
export SAMTools='$WORK/SAEVA-softwares/samtools-1.5/'
export PICARD='$WORK/SAEVA-softwares/picard/'
export FREEBAYES='$WORK/SAEVA-softwares/freebayes/bin/'
export BCFTools='$WORK/SAEVA-softwares/bcftools-1.8/'
####################################
cd $WORK
mkdir coocnet
cd coocnet
## make fastafile directory
mkdir fasta
mkdir vcf
cd vcf
cp $WORK/SAEVA-outputs/bcfoutput/* ./
cp $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa ../
cd $WORK/GITHUB_DIR
python3 vcf2fasta.py ../InputFiles.csv 

sh vcf2fasta.sh 
