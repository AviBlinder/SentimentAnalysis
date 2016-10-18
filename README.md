##  Sentiment Analysis Project


#### The purpose of this project is comparing a basic sentiment analysis algorithm against a more elaborated one.


In order to test the algorithms, I used the *reviews* from the *business* JSON dataset that **Yelp** released in the second half of 2016.


####The basic algorithm's flow goes as follow:

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
  
The classification done by the algorithm is compared against the ranking that each users gave, together with the review.  
  
After running a sample of 800000 reviews, the basic algorithm's results are as follow:

|                | Negative   | Neutral    | Positive  |
| :------------- |:----------:|:----------:|:---------:| 
|**User's Ranking**|            |            |           |
| 1 star         | 0.53736242 | 0.14741997 | 0.3152176 |
| 2 stars        | 0.27561088 | 0.13425283 | 0.5901363 |
| 3 stars        | 0.10339945 | 0.08847936 | 0.8081212 |
| 4 stars        | 0.03375525 | 0.04471398 | 0.9215308 |
| 5 stars        | 0.02058162 | 0.03210362 | 0.9473148|


