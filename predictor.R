
suggest_from_tokens<-function(phrase, tokens){
    #tokens_list<-c(tokens3, tokens2)

    t<-grep(phrase, tokens)
    candidates <- c()
    
    #for tokens with matching phrase, add next word to candidates
    for (i in t){
        candidates <- c(candidates, tail(strsplit(tokens[i+1], split=' ')[[1]],1))
    }
    if (length(candidates) != 0){
        top <- sort(table(candidates), decreasing=TRUE)
        suggestion <- names(top[1])
        #num <- max(top)
        return(suggestion)
    }
    else{
        return(NULL)
    }

}