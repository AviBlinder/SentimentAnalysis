r1 <- Review


r1$negatives <- rep(NA,nrow(r1))
r1$positives <- rep(NA,nrow(r1))
#r1$negative_words <- as.data.frame(rep(NA,nrow(r1)))
#r1$positives_words <- as.data.frame(rep(NA,nrow(r1)))

for (i in 1:nrow(r1)){
  result1 <- pos_neg_count(r1$text[i])
  r1$negatives[i] <- as.integer(result1[[1]])
  r1$positives[i] <- as.integer(result1[[2]])
  if (i %% 100 == 0){
    cat("i = ", i , "\n")
  }


}

r1[i-1,]

#r1$negative_words[i] <- result1[[3]]
#r1$positive_words[[i]] <- as.data.frame(t(unlist(result1[[4]])))

