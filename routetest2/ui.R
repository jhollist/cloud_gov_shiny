#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Two file test app for shiny.epa.gov"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("species",
                        "Which Species To Display",
                        choices = unique(iris$Species),
                        multiple = TRUE, 
                        selected = c("setosa", "versicolor", "virginica")  
                        )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("scatterPlot")
        )
    )
)
