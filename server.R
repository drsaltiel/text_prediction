library(shiny)


#change the maximum allowed upload (right now 30mB)
options(shiny.maxRequestSize=30*1024^2)

load('processed.RData')

suggest_from_tokens_freq<-function(phrase, tokens){
    if (phrase==''){return(NULL)}
    #takes last n words for prediction
    phrase<- paste(tail(strsplit(phrase, split = ' ')[[1]], 3), collapse = ' ')
    
    t<-grep(phrase, names(tokens))
    candidates <- c()
    
    #for tokens with matching phrase, add next word to candidates
    for (i in t){
        #adds next word after match to candidates
        candidates <- c(candidates, tail(strsplit(names(tokens[i+1]), split=' ')[[1]],1))
    }
    if (length(candidates) != 0){
        #finds top match and returns ('match word', # of times this word follows)
        top <- sort(table(candidates), decreasing=TRUE)
        suggestion <- names(top[1])
        num <- max(top)
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