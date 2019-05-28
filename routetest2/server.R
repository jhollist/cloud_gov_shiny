#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$scatterPlot <- renderPlot({

        # filter
        x <- iris[iris$Species %in% input$species,]
        
        # plot scatter plot with selected species
        plot(x$Petal.Length, x$Petal.Width, col = x$Species)

    })

}
