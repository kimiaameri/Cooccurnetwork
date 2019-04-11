import csv
import sys

if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file \n')
    sys.exit(0)
    
inputFile = sys.argv[1]
outputFile = "vcf2fasta.sh"
with open(outputFile,'w') as outFile:
    count =0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        outFile.write('module load vcftools/0.1 \n') 
        for row in csv_reader:
            if count !=0:
                outFile.write(f' cat $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa | vcf-consensus  $WORK/SAEVA-outputs/bcfoutput/{row[0]}.vcf.gz > $WORK/coocnet/fasta/{row[0]}.fa\n')
            count =count+1
            
            
            
