#read reviews that are wrongly classified as positive but received 1 star
r1_misclassified <- r1[star1_pos_outfile$review_seq_id,]

corpus = Corpus(VectorSource(c(r1_misclassified$text)),
                readerControl = list(blank.lines.skip=TRUE))
#CorpusDescription[[1]]$content

#some preprocessing
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument, language="english")
#creating term matrix with TF-IDF weighting
terms <-DocumentTermMatrix(corpus,
                           control = list(weighting = function(x) weightTfIdf(x, normalize = FALSE)))
terms[[3]]
#or compute cosine distance among documents
dissimilarity(tdm, method = "cosine")
