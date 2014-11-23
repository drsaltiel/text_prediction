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
    if (runif(1)<fraction){
        
        write(tokens,file="tokens.txt",append=TRUE)
    }
    
    
    close(con)
}



remove_sparse<-function(data, min_n = 2){
    for (token in data){
        if (data[[token]]<min_n){
            data[[token]]<-NULL
        }
    }
    #remove NULL elements
    data=data[-(which(sapply(data,is.null),arr.ind=TRUE))]
    return(data)
}