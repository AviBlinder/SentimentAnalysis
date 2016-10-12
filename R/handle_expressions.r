CorpusDescription[[1]]$content <- gsub("go wrong","wrong",
                                       CorpusDescription[[1]]$content)
CorpusDescription[[1]]$content <- gsub("went wrong","wrong",
                                       CorpusDescription[[1]]$content)
CorpusDescription[[1]]$content <- gsub("go down","wrong",
                                       CorpusDescription[[1]]$content)
CorpusDescription[[1]]$content <- gsub("went down","wrong",
                                       CorpusDescription[[1]]$content)

CorpusDescription[[1]]$content <- gsub("good cleaning","bad",
                                       CorpusDescription[[1]]$content)
CorpusDescription[[1]]$content <- gsub("gone way down","bad",
                                       CorpusDescription[[1]]$content)
CorpusDescription[[1]]$content <- gsub("high priced","bad",
                                       CorpusDescription[[1]]$content)


CorpusDescription[[1]]$content <- gsub("come back","good",
                                       CorpusDescription[[1]]$content)
