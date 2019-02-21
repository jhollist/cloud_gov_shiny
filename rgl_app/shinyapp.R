library(rgl)
#library(car)
library(shiny)

cars$time <- cars$dist/cars$speed

ui <- fluidPage(
  hr("how do we get the plot inside this app window rather than in a popup?"),
  
  rglwidgetOutput("plot",  width = 800, height = 600)
)

server <- (function(input, output) {
  
  output$plot <- renderRglwidget({
    rgl.open(useNULL=T)
    scatter3d(x=cars$speed, y=cars$dist, z=cars$time, surface=FALSE, ellipsoid = TRUE)
    rglwidget()
  })
})   
shinyApp(ui = ui, server = server)