a <- Sys.time()
rm(list=ls())
read_nrows <- 1000

r1 <- read.csv("https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/csv_datasets/reviews.csv",
               nrows = read_nrows,stringsAsFactors = FALSE)

#text1 <- "This is not a lovely place at all myself. I don't like it. It wasn't PLEASENT at all and won't be!"
#Algorithm
#    0. One-time preparations
#    1. Create Corpus
#    2. Count negative / positive words
#    3. Check negations before negative/positive words
#    4. Check negative / positive words in Upper case

i  <- 1
to_idx <- length(r1$text)

scripts_folder <- "D:/Yelp/SentimentAnalysis/R/"
inputs_folder <- "D:/Yelp/SentimentAnalysis/Hu and Liu's lexicon/"
output_folder <- "D:/Yelp/SentimentAnalysis/"

source(paste0(scripts_folder,"preparations.r"))

for (i in i:to_idx){
#1. Create Corpus
    text1 <- r1$text[i]
    source(paste0(scripts_folder,"create_corpus.r"))
    source(paste0(scripts_folder,"handle_expressions.r"))
#Step 2: Count Negative and Positive terms
    source(paste0(scripts_folder,"count_pos_and_neg_words.r"))
#Step 3. Check negations in positive and negative words and re-calculate in accordace
    source(paste0(scripts_folder,"negations_check.r"))
#4. Find UPPER CASE words
    source(paste0(scripts_folder,"Upper_Case_check.r"))
#5. Write output to file
    source(paste0(scripts_folder,"write_output.r"))
}

##
b <- Sys.time()
b - a
a1 <- read.csv(file = file_name)
plot(a1$sentiment_grade,a1$business_stars)
