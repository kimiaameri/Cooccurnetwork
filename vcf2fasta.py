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
        if count !=0:
         outFile.write(f'bgzip {row[0]}.vcf\n')
         outFile.write(f'tabix -p vcf {row[0]}.vcf.gz\n')
        count =count+1
        outFile.write('module load samtools/1.6 \n') 
        outFile.write('sed -i 's/^chr/Chromosome/' genome.fa\n') 
        for row in csv_reader:
            if count !=0:
                outFile.write(f'cat $WORK/coocnet/genome.fa | vcf-consensus  $WORK/coocnet/vcf/{row[0]}.vcf.gz > $WORK/coocnet/fasta/{row[0]}.fa\n')
            count =count+1
            
            
            
            
            
             sed -i 's/^chr/Chromosome/' genome.fa
                 bgzip S*.vcf


            tabix -p vcf Silverman99624D1_S16_q5000_dp250.vcf.gz
            
