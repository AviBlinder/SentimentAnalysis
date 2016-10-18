UPPER <- find_upper_case_words(r1$text[i])
#UPPER
CorpusDescriptionUpper = Corpus(VectorSource(c(UPPER)))
CorpusDescriptionUpper[[1]]$content
CorpusDescriptionUpper = tm_map(CorpusDescriptionUpper, removePunctuation, lazy=TRUE)
CorpusDescriptionUpper[[1]]$content
CorpusDescriptionUpper = tm_map(CorpusDescriptionUpper, content_transformer(tolower),
                                lazy=TRUE)
CorpusDescriptionUpper[[1]]$content

CorpusDescriptionUpper = tm_map(CorpusDescriptionUpper, removeWords,
                                tuned_stopWords, lazy=TRUE)
CorpusDescriptionUpper[[1]]$content

review_t1 <- CorpusDescriptionUpper[[1]]$content
review_t2 <- strsplit(review_t1," {1,}")
review_t3 <- unlist(review_t2[[1]])

sum_positives <- sum_positives + sum(review_t3 %in% positive_words)*upperCase_weight
found_pos_words_upper <- review_t3[which(review_t3 %in% positive_words)]


sum_negatives <- sum_negatives + sum(review_t3 %in% negative_words)*upperCase_weight
found_neg_words_upper <- review_t3[which(review_t3 %in% negative_words)]

sentiment <- sum_positives - sum_negatives
#sentiment
