star1 <- subset(out_file,out_file$review_stars == 1)
cat("stars 1 : ",table(star1$sentiment_grade) , "\n")
cat("stars 1 : ",prop.table(table(star1$sentiment_grade)),"\n")

star2 <- subset(out_file,out_file$review_stars == 2)
cat("stars 2 : ",table(star2$sentiment_grade) , "\n")
cat("stars 2 : ",prop.table(table(star2$sentiment_grade)) , "\n")

star3 <- subset(out_file,out_file$review_stars == 3)
cat("stars 3 : ",table(star3$sentiment_grade) , "\n")
cat("stars 3 : ",prop.table(table(star3$sentiment_grade)) , "\n")

star4 <- subset(out_file,out_file$review_stars == 4)
cat("stars 4 : ",table(star4$sentiment_grade) , "\n")
cat("stars 4 : ",prop.table(table(star4$sentiment_grade)) , "\n")

star5 <- subset(out_file,out_file$review_stars == 5)
cat("stars 5 : ", table(star5$sentiment_grade) , "\n")
cat("stars 5 : ",prop.table(table(star5$sentiment_grade)) , "\n")

s1_raw <- table(star1$sentiment_grade)
s1_prop<- prop.table(table(star1$sentiment_grade))

s2_raw <- table(star2$sentiment_grade)
s2_prop<- prop.table(table(star2$sentiment_grade))

s3_raw <- table(star3$sentiment_grade)
s3_prop<- prop.table(table(star3$sentiment_grade))

s4_raw <- table(star4$sentiment_grade)
s4_prop<- prop.table(table(star4$sentiment_grade))

s5_raw <- table(star5$sentiment_grade)
s5_prop<- prop.table(table(star5$sentiment_grade))

raw_data <- rbind(s1_raw,s2_raw,s3_raw,s4_raw,s5_raw)
prop_data <- rbind(s1_prop,s2_prop,s3_prop,s4_prop,s5_prop)

row.names(raw_data) <- c("1 star","2 stars","3 stars","4 stars","5 stars")
row.names(prop_data) <- c("1 star","2 stars","3 stars","4 stars","5 stars")
raw_data;prop_data


####################################################################################
star1_pos <- r1[out_file$review_stars == 1 & out_file$sentiment_grade == "Pos",]
#star1_pos[111,]
#star1_pos_outfile <- out_file[out_file$review_stars == 1 & out_file$sentiment_grade == "Pos",]
#star1_pos_outfile[15,]
#star1_pos$text[108]



