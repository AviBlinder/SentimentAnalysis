rm(list=ls())
Sys.setlocale('LC_ALL','C')
start_time <- Sys.time()
read_nrows <- 10000
debug_flag <- 0

##For local (windows) execution, use local files, otherwise use S3 storaged files
if (grepl("^[C,D]",Sys.getenv()[["HOME"]])){
  scripts_folder <- "D:/Yelp/SentimentAnalysis/R/"
  inputs_folder <- "D:/Yelp/SentimentAnalysis/Hu and Liu's lexicon/"
  output_folder <- "D:/Yelp/SentimentAnalysis/data/"
  output_file  <- "sentiment_score.csv"
  r1 <- read.csv("D:/Yelp/r_datasets/reviews.csv",
                 nrows = read_nrows,stringsAsFactors = FALSE)

}else{
  scripts_folder <- "/home/user1/SentimentAnalysis/R/"
  inputs_folder <- "/home/user1/SentimentAnalysis/Hu and Liu's lexicon/"
  output_folder <- "/home/user1/SentimentAnalysis/"
  output_file  <- "sentiment_score.csv"
  r1 <- read.csv("https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/r_datasets/reviews.csv",
                 nrows = read_nrows,stringsAsFactors = FALSE)

}

i  <- 1
to_idx <- length(r1$text)

source(paste0(scripts_folder,"preparations.r"))

for (i in i:to_idx){
  #1. Create Corpus
  #Remove non UTF-8 character (needed on Linux environment)
  text1 <- gsub("[^[:graph:]]", " ",r1$text[i])
  source(paste0(scripts_folder,"create_corpus.r"))
  source(paste0(scripts_folder,"handle_expressions.r"))
  #Step 2: Count Negative and Positive terms
  source(paste0(scripts_folder,"count_pos_and_neg_words.r"))
  #Step 3. Check negations in positive and negative words and re-calculate sentiment in accordace
  source(paste0(scripts_folder,"negations_check.r"))
  #Step 4 Check for confirmation (of positive/negative) words
  source(paste0(scripts_folder,"confirmations_check.r"))

  #5. Find UPPER CASE words and re-calculate sentiment in accordance
  source(paste0(scripts_folder,"Upper_Case_check.r"))
  #6. Write output to file
  source(paste0(scripts_folder,"write_output.r"))
}

##
end_time <- Sys.time()
end_time - start_time

out_file <- read.csv(file = file_name)
plot(out_file$sentiment_grade,out_file$review_stars,xlab="Review Type",ylab="Ranking given by user")


######
source(paste0(scripts_folder,"post_process_analysis.r"))
raw_data;prop_data

#######################
