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
sum_positives_negated <- sum(str1[idx_found_pos_words_minus1] %in% c(negs_short,negs_long))*negations_weigth

sum_positives_negated  <- sum_positives_negated + sum(str1[idx_found_pos_words_minus2] %in% c(negs_short,negs_long))*negations_weigth
sum_positives_negated
sum_negatives_negated <- sum(str1[idx_found_neg_words_minus1] %in% c(negs_short,negs_long))*negations_weigth

sum_negatives_negated <- sum_negatives_negated + sum(str1[idx_found_neg_words_minus2] %in% c(negs_short,negs_long))*negations_weigth
sum_negatives_negated

sum_positives = sum_positives + sum_negatives_negated - sum_positives_negated
sum_negatives = sum_negatives + sum_positives_negated - sum_negatives_negated

sentiment <- sum_positives - sum_negatives
#sentiment

