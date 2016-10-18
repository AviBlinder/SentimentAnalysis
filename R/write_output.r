#Write output to file
sentiment_grade <- ifelse(sentiment > 0,"Pos","Neg")
if(sentiment == 0) sentiment_grade <- "Neu"



record <- cbind(r1$review_seq_id[i],r1$stars[i], sentiment, sentiment_grade,r1$business_id[i],
                r1$user_id[i],r1$Maincity[i],CorpusDescription[[1]]$content)

if (debug_flag & r1$stars[i] == 1 & sentiment_grade == "Pos" ) {
  pos_w <- paste(found_pos_words,collapse=" ")
  neg_w <- paste(found_neg_words,collapse=" ")
  record <- cbind(record,pos_w,neg_w)
}


write.table(record,file=file_name,append = TRUE,sep=",",row.names = FALSE,col.names = FALSE)
