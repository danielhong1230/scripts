title: "STAR aligner"
---
author: "Bong-Ki Hong"
date: '2020 3 17 '

# Installation
reference: https://github.com/alexdobin/STAR

```{bash}
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install g++
sudo apt-get install make

# Get latest STAR source from releases
wget https://github.com/alexdobin/STAR/archive/2.7.3a.tar.gz
tar -xzf 2.7.3a.tar.gz
cd STAR-2.7.3a/source

# Compile
make STAR
```


# UCSC

https://genome.ucsc.edu/goldenPath/help/ftp.html
http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/

[username: anonymous, password: danielhong@catholic.ac.kr]
```{bash}
mkdir reference
cd reference
rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/ ./
```

# STAR aligner reference genome index

https://www.biostars.org/p/221781/
https://github.com/alexdobin/STAR/issues/504
```{bash}
STAR --runThreadN 4 --runMode genomeGenerate --genomeDir /home/danielhong/work/reference/test/ --genomeFastaFiles /home/danielhong/work/reference/hg38/ucsc/hg38.fa --sjdbGTFfile /home/danielhong/work/reference/hg38/ucsc/hg38.ensGene.gtf --sjdbOverhang 100

```



```{bash}
mkdir reference
cd reference
wget ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_mouse/release_M11/gencode.vM11.primary_assembly.annotation.gtf.gz
wget ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_mouse/release_M11/GRCm38.primary_assembly.genome.fa.gz
gunzip gencode.vM11.primary_assembly.annotation.gtf.gz
gunzip GRCm38.primary_assembly.genome.fa.gz
cd ..
STAR --runThreadN 4 --runMode genomeGenerate --genomeDir reference --genomeFastaFiles GRCm38.primary_assembly.genome.fa --sjdbGTFfile gencode.vM11.primary_assembly.annotation.gtf --sjdbOverhang 100
```

