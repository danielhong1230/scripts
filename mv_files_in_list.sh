mkdir -p length_75/{fastq,fastqc}
mkdir -p length_80/{fastq,fastqc}

for f in `cat length_75.txt`;
do
	mv fastq/${f} length_75/fastq/
done;

for f in `cat length_80.txt`;
do
	mv fastq/${f} length_80/fastq/
done;
