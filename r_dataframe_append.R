Reference URL is <https://stackoverflow.com/questions/29402528/append-data-frames-together-in-a-for-loop/29419402>

```{r}
path <- readline(prompt = "Enter the path of working directory: ")
filelist <- list.file(path)

datalist = list()

for (i in 1:length()) {
    filename <- filelist[i]
    df <- read.delim(paste0(path, "/", filename), header = TRUE)
    df$filename <- filename
    datalist[[i]] <- df
}

df = do.call(rbind, datalist)
```
