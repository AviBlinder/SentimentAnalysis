# One time preparations
if (!require("tm")) install.packages("tm")

library(tm)

number_of_processors <- detectCores()
number_of_processors


file_name <- paste0(output_folder,output_file)
if(file.exists(file_name)) file.remove(file_name)
header <- cbind("review_stars" ,"sentiment_score" ,"sentiment_grade","business_id" ,
                "user_id" ,"Maincity","corpus_text")

write.table(header,file=file_name,sep=",",row.names = FALSE,col.names = FALSE)

#Reading positive_words and negative_words
positive_words <- read.csv(paste0(inputs_folder,"positive-words-list.txt"),
                           header = FALSE)
positive_words <- positive_words$V1
negative_words <- read.csv(paste0(inputs_folder,"negative-words-list.txt"),
                           header = FALSE)
negative_words <- negative_words$V1
