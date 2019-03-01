
# Global variables can go here
n <- 200


# Define the UI
ui <- bootstrapPage(
  numericInput('n', 'Number of obs', n),
  plotOutput('plot'),
  textOutput('text')
)


# Define the server code
server <- function(input, output) {
  output$plot <- renderPlot({
    hist(runif(input$n))
  })
  
  output$text <- renderText({
    v8_avail <- require(V8)
    units_avail <- require(units)
    paste(" V8 is available:", v8_avail, "units is available: ", units_avail)
  })
  
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)