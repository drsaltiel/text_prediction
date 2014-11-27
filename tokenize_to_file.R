#script takes text files input, tokenizes, then writes tokenization to file

n_grams = 3
fraction = 0.001
p <- 'all' #for naming file if only one specific source

library(tm)
library(RWeka)

options(mc.cores=1)
paths = c('~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt')

#paths<-c('~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt')


tokens <- vector(mode="list")
#write tokens as a list
#token, appearances
for (path in paths){
    con <- file(path, "r") 
    line <- readLines(con, 1)
    while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0){
        if (runif(1)<=fraction){
            line <- strsplit(line[1], split = '[.!?]')
            for (sent in line){
                #check if gram is already there
                #if it is append by one, if not create new element in list
                #SHOULD I CHANGE TO FIT PUNCTUATION, ETC????
                #???????????????????????????????????
                grams<-tolower(NGramTokenizer(sent, Weka_control(min = n_grams, max = n_grams)))
                for(gram in grams){
                    if (gram %in% names(tokens)) {
                        tokens[[gram]]<-tokens[[gram]]+1
                    }
                    else{
                        tokens[[gram]]<-1
                    }
                }
            }
        }
        line<-readLines(con,1)
    }
    
    close(con)
}

tokens<-lapply(tokens,remove_sparse)
#remove NA elements
tokens <- tokens[!is.na(tokens)]

filename<-paste('~/coursera/data_science_coursera/capstone/final/', p,'tokens',n_grams,'.txt',sep='')

output_list(tokens) #prints to file .txt
save(tokens, file="processed.RData") # saves to RData




remove_sparse<-function(data, min_n = 2){
    #to be used with the apply function
    if (data[[1]]<min_n){
        data[[1]]<-NA
    }
    return(data)
}

output_list <- function(x){ 
    #prints to file
    nams=names(x) 
    for (i in seq_along(x) ) cat(nams[i],  x[[i]], "\n", file=filename, append=TRUE)
}