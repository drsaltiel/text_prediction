library(shiny)


#change the maximum allowed upload (right now 30mB)
options(shiny.maxRequestSize=30*1024^2)

load('processed.RData')

suggest_from_tokens_freq<-function(phrase, tokens){
    #tokens_list<-c(tokens3, tokens2)
    
    t<-grep(phrase, names(tokens))
    candidates <- c()
    
    #for tokens with matching phrase, add next word to candidates
    for (i in t){
        candidates <- c(candidates, tail(strsplit(names(tokens[i+1]), split=' ')[[1]],1))
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


shinyServer(
    function(input,output){
        
        
        output$out1<-renderPrint({input$text})
        input_text<- paste(tail(strsplit(phrase, split = ' ')[[1]], 3), collapse = ' ')
        output$out2<-renderPrint({suggest_from_tokens_freq(input$text, tokens)})

        
})