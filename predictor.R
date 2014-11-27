
one_less_gram<-function(phrase, tokens4, tokens3, tokens2){
    suggestion <- suggest_from_tokens_freq(phrase, tokens4)
    if(!is.null(suggestion)){ return(suggestion)}
    phrase = paste(tail(strsplit(phrase, split = ' ')[[1]], 3), collapse = ' ')
    suggestion <- suggest_from_tokens_freq(phrase, tokens3)
    if(!is.null(suggestion)){ return(suggestion)}
    phrase = paste(tail(strsplit(phrase, split = ' ')[[1]], 2), collapse = ' ')
    suggestion <- suggest_from_tokens_freq(phrase, tokens2)
    if(!is.null(suggestion)){ return(suggestion)}
    else{return(NULL)}
}

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

suggest_from_tokens_freq<-function(phrase, tokens){
    #need to change phrase to first to words of phrase
    #since lists dont store words in order now need to compare
    #to not last word in phrase
    #ie grep(first n-1 words of phrase)
    t<-grep(phrase, names(tokens))
    candidates <- vector(mode="list")
    
    #for tokens with matching phrase, add next word to candidates
    for (i in t){
        candidates[[tail(strsplit(names(tokens[i]), split=' ')[[1]],1)]]<-
            candidates[[tail(strsplit(names(tokens[1]), split=' ')[[1]],1)]]+tokens[[1]]
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