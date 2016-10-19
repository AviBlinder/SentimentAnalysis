rm(list=ls())
Sys.setlocale('LC_ALL','C')
start_time <- Sys.time()
read_nrows <- 800000
debug_flag <- 0

#Algorithm
#    0. One-time preparations
#    1. Create Corpus
#    2. Count negative / positive words

if (grepl("^[C,D]",Sys.getenv()[["HOME"]])){
  scripts_folder <- "D:/Yelp/SentimentAnalysis/R/"
  inputs_folder <- "D:/Yelp/SentimentAnalysis/Hu and Liu's lexicon/"
  output_folder <- "D:/Yelp/SentimentAnalysis/data/"
  output_file  <- "sentiment_score_simple.csv"
  r1 <- read.csv("D:/Yelp/r_datasets/reviews.csv",
                 nrows = read_nrows,stringsAsFactors = FALSE)

}else{
  scripts_folder <- "/home/user1/SentimentAnalysis/R/"
  inputs_folder <- "/home/user1/SentimentAnalysis/Hu and Liu's lexicon/"
  output_folder <- "/home/user1/SentimentAnalysis/"
  r1 <- read.csv("https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/r_datasets/reviews.csv",
                 nrows = read_nro11ws,stringsAsFactors = FALSE)

}

i  <- 1
to_idx <- length(r1$text)

source(paste0(scripts_folder,"preparations_simple.r"))

for (i in i:to_idx){
  text1 <- gsub("[^[:graph:]]", " ",r1$text[i])
  source(paste0(scripts_folder,"create_corpus_simple.r"))
  source(paste0(scripts_folder,"count_pos_and_neg_words.r"))

  source(paste0(scripts_folder,"write_output_simple.r"))
}

##
end_time <- Sys.time()
end_time - start_time

out_file <- read.csv(file = file_name)
plot(out_file$sentiment_grade,out_file$review_stars,xlab="Review Type",ylab="Ranking given by user")


######
file_name
source(paste0(scripts_folder,"post_process_analysis.r"))
raw_data;prop_data

#######################
