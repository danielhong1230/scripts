# RSEM

* [article link](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-12-323)

* [github](https://github.com/deweylab/RSEM)

2020년 9월 실행 

## Reference file setup
```
```

## Run RSEM after STAR
```
rsem-calculate-expression \
--paired-end --bam --no-bam-output -p 12 \
/media/ubuntu/data_01/project/macrogen/STAR_aligned/sample_Aligned.toTranscriptome.out.bam \
/media/ubuntu/data_01/references/GRCm38_RSEM \
/media/ubuntu/data_01/project/macrogen/STAR_aligned/sample_ \
> /media/ubuntu/data_01/project/macrogen/STAR_aligned/sample_rsem.log
```
