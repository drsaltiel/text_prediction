library(shiny)


#change the maximum allowed upload (right now 30mB)
options(shiny.maxRequestSize=30*1024^2)

load('processed.RData')


#GIVES WEIRD ERROR, NEED TO FIGURE OUT AND FIX
suggest_from_tokens_freq<-function(phrase, tokens){
    if (phrase==''){return(NULL)}
    #takes last n words for prediction
    
    phrase<- paste(tail(strsplit(phrase, split = ' ')[[1]], 2), collapse = ' ')
    
    t<-grep(phrase, names(tokens))
    candidates <- c()
    
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


shinyServer(
    function(input,output){
        
        
        output$out1<-renderText({input$text})
        
        output$out2<-renderText({suggest_from_tokens_freq(input$text, tokens3)[1]})
        
        output$out3<-renderText({suggest_from_tokens_freq(input$text, tokens3)[2]})

        
})