#this function takes in a text file and returns a tokenized version
#it breaks each line into individual sentences before tokenizing
#it makes everything lowercase
#it only makes tokens of two or three words


library(RWeka)

tokenize_line <- function(line){
    line <- strsplit(line[1], split = '[.!?]')
    tokens <- vector()
    for (sent in line){
        tokens <- c(tokens, tolower(NGramTokenizer(sent, Weka_control(min = 2, max = 3))))
    }
    return(tokens)
}
    
tokenize_vector<- function(vector){
    tokens <- lapply(vector, FUN = tokenize_line)
}
    
