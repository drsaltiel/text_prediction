library(shiny)

library(markdown)


shinyUI(navbarPage("Navigation",
    tabPanel("Text Prediction",
        headerPanel("Text Prediction"),
        sidebarLayout(
            sidebarPanel(
                h3('Enter text:'),
                textInput('text', 'Input Text', value="")
                #actionButton('goButton', 'Predict Next Word')
                ),

        mainPanel(
                h3('For'),
                verbatimTextOutput('out1'),
                h3('We Predict:'),
                verbatimTextOutput('out2'),
                h4('Match Percent:'),
                verbatimTextOutput('out3'),
                h4('For N-Gram:'),
                verbatimTextOutput('out4')
            ))
    ),
    tabPanel("About",
           fluidRow(
               column(6,
                  includeMarkdown("shiny_about.md")
                   )
               
        ))
))


