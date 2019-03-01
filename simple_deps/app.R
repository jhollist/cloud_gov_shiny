
# Define the UI
ui <- bootstrapPage(
  textOutput('text')
)


# Define the server code
server <- function(input, output) {
  output$text <- renderText({
    v8_avail <- require(V8)
    units_avail <- require(units)
    rgdal_avail <- require(rgdal)
    paste(" rgdal is available: ", rgdal_avail)
  })
  
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)