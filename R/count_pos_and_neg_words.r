review_t1 <- CorpusDescription[[1]]$content
review_t2 <- strsplit(review_t1," {1,}")
review_t3 <- unlist(review_t2[[1]])
#review_t3

sum_positives <- sum(review_t3 %in% positive_words)
found_pos_words <- review_t3[which(review_t3 %in% positive_words)]
#sum_positives;found_pos_words

sum_negatives <- sum(review_t3 %in% negative_words)
found_neg_words <- review_t3[which(review_t3 %in% negative_words)]
sentiment <- sum_positives - sum_negatives
#sum_negatives;found_neg_words
#sentiment
