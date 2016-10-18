##  "Sentiment Analysis Project" 
### The purpose of this project is comparing a basic sentiment analysis algorithm against a more elaborated one.
  

####The basic algorithm flow goes as follow:
1. Read positive and negative lexicon - [Hu and Liu's lexicon](https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html)
2. For each review, create a corpus:
  * convert all words to lowercase
  * remove punctuation
  * remove "english" stop words
3. Count how many negative and positive words are found on each corpus
4. Calculate positive - negative sums:
  If sum < 0 then negative
  If sum > 0 then positive
  Otherwise neutral review

####The more sophisticated algorithm goes as follow:
1. Edit the lexicon (removing and adding custom words)
2. Create Corpus (handling expressions also, before removing stop words)
3. Count negative / positive words
4. Check negations before negative/positive words
5. Check negative / positive words in Upper case 

