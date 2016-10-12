CorpusDescription = Corpus(VectorSource(c(text1)))
CorpusDescription[[1]]$content
#2. tolower
CorpusDescription = tm_map(CorpusDescription, content_transformer(tolower), lazy=TRUE)
#CorpusDescription[[1]]$content
#3. remove punctuation
CorpusDescription = tm_map(CorpusDescription, removePunctuation, lazy=TRUE)
#CorpusDescription[[1]]$content
#4. myCorpus = tm_map(myCorpus, removeNumbers) --> Not needed for current sentiment analysis
#handle dual meaning of "like" and other expressions (before supressing stop words)

#4. remove stop words
CorpusDescription = tm_map(CorpusDescription, removeWords, tuned_stopWords, lazy=TRUE)
#CorpusDescription[[1]]$content
