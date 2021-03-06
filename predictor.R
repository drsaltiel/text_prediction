
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
    if (phrase==''){return(NULL)}
    #need to change grep phrase to first words of phrase
    #since lists dont store words in order now need to compare
    #to not last word in phrase
    #ie grep(phrase followed by single word)
    t<-grep(phrase, names(tokens))
    candidates <- vector(mode="list")
    
    #for tokens with matching phrase, add next word to candidates
    for (i in t){
        #using bad hack of matching first word means beginning of phrase matches
        #SHOULD BE FIXED
        split_t<-strsplit(names(tokens[i]), split=' ')[[1]]
        if (strsplit(phrase, split=' ')[[1]][1] == split_t[1]){
            if (is.null(candidates[[tail(split_t,1)]])){
                candidates[[tail(split_t,1)]]<-tokens[[i]]
            }
            else{
                candidates[[tail(split_t,1)]]<-
                    candidates[[tail(split_t,1)]]+tokens[[i]]
            }
        }
    }
    if (length(candidates) != 0){
        #top <- sort(table(candidates), decreasing=TRUE)
        suggestion <- names(which.max(candidates))
        num <- candidates[[suggestion]]
        return(c(suggestion, num))
    }
    else{
        return(NULL)
    }
    
}