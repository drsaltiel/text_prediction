#script takes text files input, tokenizes, then writes tokenization to file

library(tm)
library(RWeka)

options(mc.cores=1)
paths = c('~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt')
paths <- c(blogs, news, twitter)


fraction = 0.01

#need this to write tokens as a list
#token, appearances
for (path in paths){
    con <- file(path, "r") 
    line <- readLines(con, 1)
    tokens <- vector(mode="list")
    if (runif(1)<fraction){
        #here i need to check if line is already there
        #if it is append by one, if not create new element in list
    }
    
    tokens<-lapply(tokens,remove_sparse)
    
    #remove NA elements
    tokens <- tokens[!is.na(tokens)]
    
    write(tokens,file="tokens.txt",append=TRUE)
    close(con)
}





remove_sparse<-function(data, min_n = 2){
    #to be used with the apply function
    token<-names(data)
    if (data[[token]]<min_n){
        data[[token]]<-NA
    }
    return(data)
}