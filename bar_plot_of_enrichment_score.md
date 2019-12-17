Drawing the bar plot of enrichment score from DAVID result
===

*2019-12-16*

*Bong-Ki Hong*

## Importing the dataset files (DAVID results)

```{r}
path <- "david_res"
filelist <- list.files(path)
gobp.terms <- c()
```

## Merge the datasets

```{r}
datalist <- list()
for (i in 1:length(filelist)) {
  file <- filelist[i]
  df <- read.delim(paste0(path, "/", file), header = TRUE)
  df$filename <-file
  df$ES <- -log10((df$FDR)/100)
  datalist[[i]] <0 <- df
}

df <- do.call(rbind, datalist)
```

```{r}
library(dplyr)
res.df.list <- list()
for (i in 1:length(gobp.terms)) {
  gobp_term <- gobp.terms[i]
  term.df <- df %>%
    filter(Term == term.df)
  res.df.list[[i]] <- term.df
}

res.df <- do.call(rbind, res.df.list)
```


## Drawing the bar graph

```{r}
library(stringr)
a <- res.df$Term
b <- str_split_fixed(res.df$Term, "~", 2)
xlabels <- as.character(b[, 2])

library(ggplot2)
p <- ggplot(data = res.df, aes(x = reorder(Term, ES), y = ES, fill = filename)) + 
  geom_bar(stat = "identify", position = position_dodge(), width = 0.7) + 
  theme_minimal() + 
  scale_x_discrete(breaks = a, labels = xlagels) + 
  scale_fill_manual(breaks = filelist, values = color.mat[, 1]) +     # `color.mat` must be defined.
  ggtitle("Enrichment Score") + 
  xlab("GO Terms") + 
  ylab(expression("Enrichment Score (-log"[10]*"FDR)")) + 
  theme(plot.title = element_text(color = "#3759a1", size = 16, face = "bold.italic"), 
    axis.title.x = element_text(color = "black", size = 11, face = "bold"),
    axis.title.y = element_text(color = "black", size = 11, face = "bold")
  )

p + coord_flip()
```



## References
<https://stackoverflow.com/questions/15624656/label-points-in-geom-point>

<http://www.sthda.com/english/wiki/ggplot2-colors-how-to-change-colors-automatically-and-manually>

<https://stackoverflow.com/questions/4350440/split-data-frame-string-column-into-multiple-columns>

<https://stackoverflow.com/questions/22288450/tick-labels-in-ggplot2-bar-graph>

<https://sebastiansauer.github.io/ordering-bars/>

<https://www.sessions.edu/color-calculator/>
