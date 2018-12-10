
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
library(DT)
#library(leaflet)

################################################################################
#Maps Tab UI
################################################################################
#map_tab <- sidebarLayout(
#  sidebarPanel(selectInput('map_param', 'Variable to map:',
#                          c("Chlorophyll","Phycocyanin"),
#                          selected = c("Chlorophyll"))),
#  mainPanel(leafletOutput("map"))
#)

################################################################################
#Analysis Tab UI
################################################################################
analysis_tab <- sidebarLayout(
  sidebarPanel(selectInput('categ', 'Boxplot x-axis:',
                           c("State","Filtered","Frozen"),
                           selected = c("State"))),
  mainPanel(
    plotOutput("chlaPlot"),
    plotOutput("phycoPlot")
  )
)

################################################################################
#Data Tab UI
################################################################################
data_tab <- sidebarLayout(
  sidebarPanel(
    uiOutput("checkbox"),
    downloadButton('downloadData', 'Download Data')
  ),

  # Show a plot of the generated distribution
  mainPanel(
    dataTableOutput("cyanoData")
  )
)

################################################################################
#Combined UI
################################################################################

shinyUI(fluidPage(

  # Application title
  titlePanel("New England Regional Cyanobacteria Monitoring Group Data Explorer"),

  # Sidebar with a slider input for number of bins
  tabsetPanel(
    #tabPanel("Maps", map_tab),
    tabPanel("Analysis", analysis_tab),
    tabPanel("Data", data_tab)
    )
  )
)

