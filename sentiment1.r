pos_neg_count <- function(review_text){

  text1 <-as.character(review_text)
#  cat(text1,"\n")
  library(tm)
  CorpusDescription = Corpus(VectorSource(c(text1)))

  CorpusDescription = tm_map(CorpusDescription, content_transformer(tolower), lazy=TRUE)

  CorpusDescription = tm_map(CorpusDescription, PlainTextDocument, lazy=TRUE)

  CorpusDescription = tm_map(CorpusDescription, removePunctuation, lazy=TRUE)

  CorpusDescription = tm_map(CorpusDescription, removeWords, stopwords("english"), lazy=TRUE)

#dtm = DocumentTermMatrix(CorpusDescription)

  t1 <- CorpusDescription[[1]][1]$content
  t2 <- strsplit(t1," {1,}")
  t3 <- unlist(t2[[1]])

  total_sum_negatives <- 0
  value <- c()
  neg_values <- c()
  total_sum_negatives2 <- 0

  for (i in negatives$V1){
    # sum1 <- sum(grepl(i,t3,fixed = TRUE))
    # if(sum1 > 0){
    #   value <- c(value,i)
    # }
    #  total_sum_negatives <- total_sum_negatives + sum1
    m1 <- match(i,t3)
    if(!is.na(m1))
    {
      neg_values <- c(neg_values,i)
      total_sum_negatives2 <- total_sum_negatives2 + 1
    }
#    return(total_sum_negatives2)
  }
#  cat("total negatives = " , total_sum_negatives2, "\n")
#  cat("negative values = " , neg_values,"\n")

  total_sum_positives <- 0
  value <- c()
  pos_values <- c()
  total_sum_positives2 <- 0

  for (i in positives$V1){
    # sum1 <- sum(grepl(i,t3,fixed = TRUE))
    # if(sum1 > 0){
    #   value <- c(value,i)
    # }
    # total_sum_positives <- total_sum_positives + sum1
    m1 <- match(i,t3)
    if(!is.na(m1))
    {
      pos_values <- c(pos_values,i)
      total_sum_positives2 <- total_sum_positives2 + 1
    }
  }

#  cat("total positives = " , total_sum_positives2, "\n")
#  cat("positive values = " , pos_values,"\n")

  ret1 <- c(total_sum_negatives2,total_sum_positives2,list(neg_values),list(pos_values))

  return(ret1)

}
