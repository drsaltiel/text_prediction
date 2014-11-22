#script takes text files input, tokenizes, then writes tokenization to file

library(tm)
library(RWeka)

options(mc.cores=1)
paths = c('~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt')
paths <- c(blogs, news, twitter)


fraction = 0.01

for (path in paths){
    con <- file(path, "r") 
    line <- readLines(con, 1)
    if (runif(1)<fraction){
        
        write(tokens,file="tokens.txt",append=TRUE)
    }
    
    
    close(con)
}