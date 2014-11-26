library(shiny)
library(lattice)
library(markdown)


shinyUI(navbarPage("Navigation",
    tabPanel("Text Prediction",
        headerPanel("Text Prediction"),
        sidebarLayout(
            sidebarPanel(
                h3('Enter text:'),
                textInput('text', 'Input Text', value="")
                #numericInput('id1', 'Numeric input, labeled id1', 0, min=0, max=10, step = 1),
#                 sliderInput('body', 'I like my body:', value = 2, min = 0, max = 4, step = 1),
#                 checkboxGroupInput('notes', 'I need these notes:',
#                         c('Sweetness'= 'Sweetness',
#                         'Smokey' = 'Smoky',
#                         'Medicinal' = 'Medicinal',
#                         'Tobacco' = 'Tobacco',
#                         'Honey' = 'Honey',
#                         'Spicy' = 'Spicy',
#                         'Winey' = 'Winey',
#                         'Nutty' = 'Nutty',
#                         'Malty' = 'Malty',
#                         'Fruity' = 'Fruity',
#                         'Floral' = 'Floral')),
                actionButton('goButton', 'Predict Next Word')
                #submitButton('Find Me Distilleries')
                ),

        mainPanel(
                h3('For'),
                verbatimTextOutput('out1'),
                h3('We Predict:'),
                verbatimTextOutput('out2'),
            ))
    ),
    tabPanel("About",
           fluidRow(
               column(6,
                  includeMarkdown("shiny_about.md")
                   )
               
        ))
))


