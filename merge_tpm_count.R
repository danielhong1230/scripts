tpm.df <- read.csv("../expr_result/TPM.csv", header = TRUE)
e.count.df <- read.csv("../expr_result/expected_count.csv", header = TRUE)

renames_tpm_original <- colnames(tpm.df[2:length(colnames(tpm.df))])
rename_tpm <-paste("tpm", renames_tpm_original, sep = "_")
rename_tpm <- c('gene_id', rename_tpm)
colnames(tpm.df) <- rename_tpm

renames_e.count_original <- colnames(e.count.df[2:length(colnames(e.count.df))])
rename_e.count <-paste("e.count", renames_e.count_original, sep = "_")
rename_e.count <- c('gene_id', rename_e.count)
colnames(e.count.df) <- rename_e.count

df = merge(tpm.df, e.count.df, by.x = 'gene_id', by.y = 'gene_id')
head(df, 10)
