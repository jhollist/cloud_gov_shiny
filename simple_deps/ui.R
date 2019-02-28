
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

################################################################################
#Maps Tab UI
################################################################################
map_tab <- sidebarLayout(
  sidebarPanel(),
  mainPanel(
    h2("The dependency is there:"),
    h2(textOutput("map"))
  )
)


################################################################################
#Combined UI
################################################################################

shinyUI(fluidPage(

  # Application title
  titlePanel("Testing a simple dependency"),

  # Sidebar with a slider input for number of bins
  tabsetPanel(
    tabPanel("Maps", map_tab)
    )
  )
)

