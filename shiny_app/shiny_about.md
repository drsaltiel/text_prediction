---
title: "about.md"
output: html_document
---
This is a text prediction shiny app created for the capstone project of the Coursera Data Science specialization from Johns Hopkins University (project in partnership with swiftkey).

The algorthim deployed is a simple 'back off' algorithm: the algorthm searches through a preprocessed data set of n-gram tokens of various lengths (2-4).  First the algorthim looks for a full 4-gram match (ie the final three words of the text input perfectly match the first three words of the token), if none is found than it checks 3-grams, then 2-grams. If multiple matches are found within the highest level n-gram, it takes the word with the highest frequency match. If no 2-gram matches are found the algorithm returns 'the', chosen as it is the most common word in the English language.  Displayed with the predicted next word are the n-gram level that word was found on along with a percent that indicates, on that level, the percent of tokens (or multiple appearances of the same token) that end with that word.  This percent is a rough indicator of confidence in our predicted recommendation.

The preprocessed data set was created by randomly sampling the test data (a restricted data set had to be used for space and speed considerations).  These randomly sampled lines (~1% of the total test data) were tokenized and put into a list where the name is the token and the value is the number of appearances the token made.  Tokens with only one appearance were considered noise and were discarded.  A different random sampling was used for each n-gram data set.

This simple algorithm and limited data set were chosen for both size and speed considerations.