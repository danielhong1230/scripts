Make the BAM file with subset of genes
===
2019-12-13
Bong-Ki Hong, PhD
---

reference URL is <http://seqanswers.com/forums/showthread.php?t=50390>

```{bash}
samtools view -b -L regions.bed alignments.bam > subset.bam
```
