
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(sf)
library(USAboundaries)


################################################################################
#Maps Tab UI
################################################################################
map_tab <- sidebarLayout(
  sidebarPanel(),
  mainPanel(plotOutput("map"))
)


################################################################################
#Combined UI
################################################################################

shinyUI(fluidPage(

  # Application title
  titlePanel("Testing spatial deps"),

  # Sidebar with a slider input for number of bins
  tabsetPanel(
    tabPanel("Maps", map_tab)
    )
  )
)

