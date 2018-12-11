
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(sf)
library(USAboundaries)

# Get map of lower 48 states
usa_l48 <- us_boundaries() 
usa_l48 <- usa_l48[usa_l48$state_abbr != "HI" & 
                     usa_l48$state_abbr != "AK" &
                     usa_l48$state_abbr != "PR",]


shinyServer(function(input, output) {

  

  ##############################################################################
  #Map Tab
  ##############################################################################
  output$mapselect <- renderUI({
    selectInput()})

  output$map <- renderPlot({plot(st_geometry(usa_l48))})

})

