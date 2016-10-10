star1 <- subset(out_file,out_file$review_stars == 1)
cat("stars 1 : ",table(star1$sentiment_grade) , "\n")
cat("stars 1 : ",prop.table(table(star1$sentiment_grade)),"\n")

star2 <- subset(out_file,out_file$review_stars == 2)
prop.table(table(star2$sentiment_grade))

star3 <- subset(out_file,out_file$review_stars == 3)
prop.table(table(star3$sentiment_grade))

star4 <- subset(out_file,out_file$review_stars == 4)
prop.table(table(star4$sentiment_grade))

star5 <- subset(out_file,out_file$review_stars == 5)
prop.table(table(star5$sentiment_grade))


star1_pos <- r1[out_file$review_stars == 1 & out_file$sentiment_grade == "Pos",]
#star1_pos[111,]
#star1_pos_outfile <- out_file[out_file$review_stars == 1 & out_file$sentiment_grade == "Pos",]
#star1_pos_outfile[15,]
#star1_pos$text[108]
