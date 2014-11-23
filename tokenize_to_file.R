#script takes text files input, tokenizes, then writes tokenization to file

library(tm)
library(RWeka)

options(mc.cores=1)
paths = c('~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt')
paths <- c(blogs, news, twitter)

path <- 'all' #for naming file if only one specific source
n_grams = 3
fraction = 0.01

#need this to write tokens as a list
#token, appearances
for (path in paths){
    con <- file(path, "r") 
    tokens <- vector(mode="list")
    line <- readLines(con, 1)
    while (LINE IS NOT LAST LINE){
        if (runif(1)<fraction){
            line <- strsplit(line[1], split = '[.!?]')
            for (sent in line){
                #here i need to check if gram is already there
                #if it is append by one, if not create new element in list
                gram<-tolower(NGramTokenizer(sent, Weka_control(min = n_grams, max = n_grams)))
            }
        }
        line<-readLines(con,1)
    }
    
    tokens<-lapply(tokens,remove_sparse)
    
    #remove NA elements
    tokens <- tokens[!is.na(tokens)]
    
    filename<-paste('path','tokens',n_grams,'.txt',sep='')
    write(tokens,file=filename)
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