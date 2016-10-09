r1 <- out_file
plot(r1$sentiment_grade,r1$review_stars,xlab = "Classification",ylab = "User's rating")
round(prop.table(table(r1$sentiment_grade)),2)
round(prop.table(table(r1$s)),2)

#plot(table(r1$sentiment_grade))

hist(r1$review_stars)

star1 <- subset(r1,r1$review_stars == 1)
prop.table(table(star1$sentiment_grade))

star2 <- subset(r1,r1$review_stars == 2)
prop.table(table(star2$sentiment_grade))

star3 <- subset(r1,r1$review_stars == 3)
prop.table(table(star3$sentiment_grade))

star4 <- subset(r1,r1$review_stars == 4)
prop.table(table(star4$sentiment_grade))

star5 <- subset(r1,r1$review_stars == 5)
prop.table(table(star5$sentiment_grade))
