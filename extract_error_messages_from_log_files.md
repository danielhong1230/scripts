# Extracting the error messages from the log files

*2019-12-13

*Bong-Ki Hong, PhD

### Make a list of files with failed to STAR alignment

In this analysis, the BAM files with failed have 0 kbs size.
Reference URL is <https://mycyberuniverse.com/linux/find-and-delete-the-zero-size-files-and-empty-directories.html>.
```{bash}
find ./ -type f -size 0 > list_failed.txt
```

Then, I m modified the `list_failed.txt` to conatin the exact filenames of log files.

### shell script

```{bash}
for i in `cat list_failed.txt`;
do
	echo "file is " ${i}
	tail -6 length_75/result/STAR_aligned/${i}
done;
```
