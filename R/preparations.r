# One time preparations
if (!require("tm")) install.packages("tm")

library(tm)


file_name <- paste0(output_folder,output_file)
if(file.exists(file_name)) file.remove(file_name)
header <- cbind("review_stars" ,"sentiment_score" ,"sentiment_grade","business_id" ,
                "user_id" ,"Maincity","corpus_text")
header
write.table(header,file=file_name,sep=",",row.names = FALSE,col.names = FALSE)

negations_weigth <- 1
upperCase_weight <- 2
confirmation_weight <- 2

#Reading positive_words and negative_words
positive_words <- read.csv(paste0(inputs_folder,"positive-words-list.txt"),
                           header = FALSE)
positive_words <- positive_words$V1
negative_words <- read.csv(paste0(inputs_folder,"negative-words-list.txt"),
                           header = FALSE)
negative_words <- as.character(negative_words$V1)
added_negative_words <- c("roach")
negative_words <- c(negative_words,added_negative_words)
negative_words <- as.factor(negative_words)

##Editing negation words
negs <- grep("([a-z]{1,})'t",stopwords('english'),value=T)
negs_long <- gsub("([a-z]{1,})(n't)", "\\1 not"  ,negs)
negs_short <- gsub("([a-z]{1,})(n't)", "\\1nt"  ,negs)


##
negs_long <- c(negs_long,"ever")

#Editing of stop words
idx = which(stopwords('english') %in% c("no","not","very","down","improve","better"))
tuned_stopWords = stopwords('english')[-idx];


##Create vector of confirmation words
confirmation_words <- c("really","soo","too","completely","truly")


#Find Upper case words' function
find_upper_case_words <- function(x){
    text_vector <- strsplit(x," {1,}")
    text_vector <- unlist(text_vector)
    upper_words <- text_vector[grep("[A-Z]{2,}",text_vector)]

    #Concatenane the Upper Case words into a character object of length 1
    UPPER <- c()
    for (i in 1:length(upper_words)){
        UPPER <- paste(UPPER,upper_words[i],collapse=" ")
    }
    return(UPPER)
}

#vector of words (split a "character of length 1" input variable).
#   Input = corpus object
wordsVector <- function(x) {
    vect_part1 <- x[[1]]$content
    vect_part2 <- strsplit(vect_part1," {1,}")
    vect_part3 <- unlist(vect_part2[[1]])
    return(vect_part3)

}

