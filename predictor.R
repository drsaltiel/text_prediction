


t<-grep(phrase, tokens)
candidates <- c()
#for tokens with matching phrase, add next word to candidates
for (i in t){
    candidates <- c(candidates, tail(strsplit(tokens[i+1], split=' ')[[1]],1))
}

if (length(candidates) == 0){
    t<- grep()
}