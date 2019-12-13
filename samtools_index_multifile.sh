for i in `seq 3 6`;
do
    samtools index SRR36431${i}Aligned.sortedByCoord.out.bam
done;
