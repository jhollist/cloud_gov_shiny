
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(rfoaas)

shinyServer(function(input, output) {

  

  ##############################################################################
  #Map Tab
  ##############################################################################
  output$mapselect <- renderUI({
    selectInput()})

  output$map <- renderText({require(rfoaas)})

})

