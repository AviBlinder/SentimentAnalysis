head(out_file)
head(r1)
plot(out_file$sentiment_grade,out_file$review_stars,xlab = "Classification",ylab = "User's rating")
round(prop.table(table(out_file$sentiment_grade)),2)
round(prop.table(table(out_file$s)),2)

#plot(table(out_file$sentiment_grade))

hist(out_file$review_stars)

star1 <- subset(out_file,out_file$review_stars == 1)
table(star1$sentiment_grade)
prop.table(table(star1$sentiment_grade))

star2 <- subset(out_file,out_file$review_stars == 2)
prop.table(table(star2$sentiment_grade))

star3 <- subset(out_file,out_file$review_stars == 3)
prop.table(table(star3$sentiment_grade))

star4 <- subset(out_file,out_file$review_stars == 4)
prop.table(table(star4$sentiment_grade))

star5 <- subset(out_file,out_file$review_stars == 5)
prop.table(table(star5$sentiment_grade))


star1_pos <- r1[out_file$review_stars == 1 & out_file$sentiment_grade == "Pos",]
star1_pos[111,]
star1_pos_outfile <- out_file[out_file$review_stars == 1 & out_file$sentiment_grade == "Pos",]
star1_pos_outfile[15,]
star1_pos$text[108]
