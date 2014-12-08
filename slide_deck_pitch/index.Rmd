---
title       : Word Prediction
subtitle    : An Algorithm for Predicting the Next Word in a Given Text
author      : 
job         : 
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
### It's simple:
1. Enter your text
3. Recieve a prediction for your next word
3. Look at what level that word came from and how confident we are

#### What's going on
* The program takes your words and cross references them with an established reference corpus
* From this corpus, the algorithm determines possible next words and relative likelyhoods, displaying for the user the word most likely to follow

---

## Example
* Let's say I want to the predict the word after 'I want to':
1. Enter text ('I want to') into input box on the right
2. Recieve predicted next word for input text ('be')
3. Below this word is a percent (21% in this case). The higher the percent, the more confident we are in the predicted word.  A low percent means there were many other words that were also likely.
4. You are also told what level n-gram the prediction comes from (4-gram, the entire phrase was matched). The higher the n-gram, the more of the input text has been matched and the better the prediction.

---

## How it Works
The algorithm used is a simple "back off" algorithm: first looks for largest n-gram matches then, if none are found, 'back's off' to smaller n-grams. The largest n-grams we check against are 4-grams, so only the final three words of the input text are used for the prediction. If multiple matches are found, it picks the most common next word. To get an idea of confidence, the percent of matches for the predicted word out of total matches (for the largest n-gram level matched) is displayed (along with which n-gram this is).

In order to speed up the prediction, the data was preprocessed:

1. Subset of data was randomly sampled (different subset for each n-gram level, with replacement - ie bootstrapping)
1. Subset was tokenized to n-gram level
1. Tokens were saved as list: name = token, value = number of appearances
1. Tokens with only one appearance were considered noise and were discarded

---

## Future Directions:
In order to upload this algorthm to the shinyapps platform and have it run quickly, a simple algorithm and limited dataset was used.

The main improvement to this algorithm would be to optimize it for speed and expand the training set, as well as check for matches in higher level n-grams.  Some other possible improvements to explore involving furthur complicating the algorithm would be:

* Actively learn - remember user-specific past entries and learn how the user talks / their common phrases
* Utalize language structure - learn verbs and nouns and utalize punctuation to determine what part of speech the prediction should be
* Recognize incomplete N-grams - if the first and third word match in a 4-gram, there's a good chance the 4th word would be correct as well.
