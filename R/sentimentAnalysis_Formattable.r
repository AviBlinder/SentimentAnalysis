#install.packages("formattable")
library(formattable)
rm(list=ls())

DF_basic_raw <- data.frame(Ranking=c("1 Star", "2 Stars", "3 Stars", "4 Stars", "5 Stars"),
                           Negative=c(53221, 	18471, 	9942 , 	6851 , 	6908),
                           Neutral=c(14595,8985, 8491 ,9049, 10757),
                           Positive=c(31214 , 39537, 77612 , 186587, 317780)
)

s1 <- as.vector(DF_basic_raw[1,2:4])
s2 <- as.vector(DF_basic_raw[2,2:4])
s3 <- as.vector(DF_basic_raw[3,2:4])
s4 <- as.vector(DF_basic_raw[4,2:4])
s5 <- as.vector(DF_basic_raw[5,2:4])

s1_per <- round(prop.table(s1),3)
s2_per <- round(prop.table(s2),3)
s3_per <- round(prop.table(s3),3)
s4_per <- round(prop.table(s4),3)
s5_per <- round(prop.table(s5),3)
df_basic_per <- rbind(s1_per,s2_per,s3_per,s4_per,s5_per)
DF_basic_raw;df_basic_per
#
df_basic_per_formatted <- data.frame("Ranking" = DF_basic_raw$Ranking,
                                     "Negative"=percent(df_basic_per$Negative),
                                     "Neutral"=percent(df_basic_per$Neutral),
                                     "Positive"=percent(df_basic_per$Positive))
df_basic_per_formatted

####
DF_advanced_raw <- data.frame(Ranking=c("1 Star", "2 Stars", "3 Stars", "4 Stars", "5 Stars"),
                              Negative=c(57536 , 22492, 13784, 10012 , 9916),
                              Neutral=c(12357, 7750, 7875, 8635, 10455),
                              Positive=c(29137, 36751, 74386, 183840, 315074))

s1_adv <- as.vector(DF_advanced_raw[1,2:4])
s2_adv <- as.vector(DF_advanced_raw[2,2:4])
s3_adv <- as.vector(DF_advanced_raw[3,2:4])
s4_adv <- as.vector(DF_advanced_raw[4,2:4])
s5_adv <- as.vector(DF_advanced_raw[5,2:4])

s1_per_adv <- round(prop.table(s1_adv),3)
s2_per_adv <- round(prop.table(s2_adv),3)
s3_per_adv <- round(prop.table(s3_adv),3)
s4_per_adv <- round(prop.table(s4_adv),3)
s5_per_adv <- round(prop.table(s5_adv),3)
df_adv_per <- rbind(s1_per_adv,s2_per_adv,s3_per_adv,s4_per_adv,s5_per_adv)

DF_advanced_raw;df_adv_per

df_advanced_per_formatted <- data.frame("Ranking" = DF_advanced_raw$Ranking,
                                        "Negative"=percent(df_adv_per$Negative),
                                     "Neutral"=percent(df_adv_per$Neutral),
                                     "Positive"=percent(df_adv_per$Positive))

#####formattables:
formattable(DF_basic_raw, list(
    Negative=color_tile("yellow", "green"),
    Neutral = color_tile("yellow", "green"),
    Positive = color_tile("yellow", "green")
))


formattable(df_basic_per_formatted, list(
    Negative=color_tile("yellow", "green"),
    Neutral = color_tile("yellow", "green"),
    Positive = color_tile("yellow", "green")
))

formattable(DF_advanced_raw, list(
    Negative=color_tile("yellow", "green"),
    Neutral = color_tile("yellow", "green"),
    Positive = color_tile("yellow", "green")
))



formattable(df_advanced_per_formatted, list(
    Negative=color_tile("yellow", "green"),
    Neutral = color_tile("yellow", "green"),
    Positive = color_tile("yellow", "green")
))
