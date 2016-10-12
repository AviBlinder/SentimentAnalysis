idx_found_pos_words <- which(wordsVector(CorpusDescription) %in% found_pos_words)
idx_found_neg_words <- which(wordsVector(CorpusDescription) %in% found_neg_words)
idx_found_pos_words
idx_found_pos_words_minus1 <- idx_found_pos_words - 1
idx_found_neg_words_minus1 <- idx_found_neg_words - 1
idx_found_pos_words_minus2 <- idx_found_pos_words - 2
idx_found_neg_words_minus2 <- idx_found_neg_words - 2

idx_found_pos_words_minus1[idx_found_pos_words_minus1 <= 0] <- NA
idx_found_pos_words_minus2[idx_found_pos_words_minus2 <= 0] <- NA
idx_found_neg_words_minus1[idx_found_neg_words_minus1 <= 0] <- NA
idx_found_neg_words_minus2[idx_found_neg_words_minus2 <= 0] <- NA
#Strip into vector of words
str1 <- wordsVector(CorpusDescription)
#str1
sum_positives_confirmed <- sum(str1[idx_found_pos_words_minus1] %in% confirmation_words)

sum_positives_confirmed  <- sum_positives_confirmed + sum(str1[idx_found_pos_words_minus2] %in% confirmation_words)

sum_negatives_confirmed <- sum(str1[idx_found_neg_words_minus1] %in% c(confirmation_words))

sum_negatives_confirmed <- sum_negatives_confirmed + sum(str1[idx_found_neg_words_minus2] %in% c(confirmation_words))

sum_positives = sum_positives + sum_positives_confirmed*confirmation_weight
sum_negatives = sum_negatives + sum_negatives_confirmed*confirmation_weight

sentiment <- sum_positives - sum_negatives
#sentiment

