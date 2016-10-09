rm(list=ls())
Sys.setlocale('LC_ALL','C')
start_time <- Sys.time()
read_nrows <- 10000


#Algorithm
#    0. One-time preparations
#    1. Create Corpus
#    2. Count negative / positive words
#    3. Check negations before negative/positive words
#    4. Check negative / positive words in Upper case

if (Sys.getenv()[["OS"]] == "Windows_NT"){
  scripts_folder <- "D:/Yelp/SentimentAnalysis/R/"
  inputs_folder <- "D:/Yelp/SentimentAnalysis/Hu and Liu's lexicon/"
  output_folder <- "D:/Yelp/SentimentAnalysis/"
  r1 <- read.csv("D:/Yelp/r_datasets/reviews.csv",
                 nrows = read_nrows,stringsAsFactors = FALSE)

  }else{
  scripts_folder <- "/home/user1/SentimentAnalysis/R/"
  inputs_folder <- "/home/user1/SentimentAnalysis/Hu and Liu's lexicon/"
  output_folder <- "/home/user1/SentimentAnalysis/"
  r1 <- read.csv("https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/csv_datasets/reviews.csv",
                 nrows = read_nrows,stringsAsFactors = FALSE)

  }

i  <- 1
to_idx <- length(r1$text)

source(paste0(scripts_folder,"preparations.r"))

for (i in i:to_idx){
#1. Create Corpus
    #Remove non UTF-8 character
    text1 <- gsub("[^[:graph:]]", " ",r1$text[i])
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
end_time <- Sys.time()
end_time - start_time

out_file <- read.csv(file = file_name)
plot(out_file$sentiment_grade,out_file$review_stars)

#write.csv(r1,file=paste0(output_folder,"business_sample.csv"))
