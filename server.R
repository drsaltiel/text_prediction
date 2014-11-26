library(shiny)

#change the maximum allowed upload (right now 30mB)
options(shiny.maxRequestSize=30*1024^2)

load('processed.RData')
unlink('processed.RData')

predict<-function(input_text){
    return('the')
}


shinyServer(
    function(input,output){
        
        
        output$out1<-renderPrint({input$text})
        output$out2<-renderPrint({predict(input$text)})
        
#         output$plot1<-renderPlot({
#             input$goButton
#             Whiskeys<- findWhiskeys(input$body, input$notes)
#             if (length(Whiskeys[,1])>=1){ 
#                 random<- sample(1:length(Whiskeys[,1]), 1)
#                 whiskey<-Whiskeys[random,]
#                 dist<-as.character(whiskey$Distillery)
#                 barchart(as.numeric(whiskey[3:14])~colnames(whiskey)[3:14],
#                      scales=list(x=list(rot=45)),
#                      xlab = 'Body and Notes', ylab = 'Prevalence',
#                      ylim=c(0,4.5),
#                      main = dist)
#             }
#             else (
#                 plot(c(0, 1), c(0, 1), ann = T, 
#                      bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n',
#                      xlab = '', ylab = '',
#                      main = 'No Whiskeys Found to Match Your Criteria')
#                 )
        
#    })
})