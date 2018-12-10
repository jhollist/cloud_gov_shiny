
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
library(DT)
#library(leaflet)

dat<-read.csv("Data2014.csv",stringsAsFactors = FALSE)%>%
  filter(SampleLocation != "Other" ||
           SampleLocation != "Calibration" ||
           SampleLocation != "Blank") %>%
  filter(!Flag) %>%
  filter(Fluorometer == "Beagle")%>%
  filter(Units=="ug/l")%>%
  filter(!is.na(Longitude))%>%
  filter(!is.na(Latitude))

#Need to figure out how to get this down to mean Value per location
locs <- data.frame(LocID = dat$LocID, Longitude = dat$Longitude, Latitude = dat$Latitude,
                   Parameter = dat$Parameter, Value = dat$Value) %>%
  group_by(LocID,Longitude,Latitude, Parameter) %>%
  summarize(Value = mean(Value))%>%
  data.frame()


shinyServer(function(input, output) {

  ##############################################################################
  #Data Tab
  ##############################################################################
  output$checkbox <- renderUI({
    checkboxGroupInput("check_cols", "Columns", names(dat),
                       selected = c("State","Parameter","Value","Units"),
                       inline = TRUE)
  })

  output$cyanoData <- DT::renderDataTable({dat[, input$check_cols, drop=FALSE]},
                                          filter = "top",
                                          server = TRUE)

  output$downloadData <-
    downloadHandler("data.csv",
                    content = function(file) {
                    rows <- input$cyanoData_rows_all
                    cols <- input$check_cols
                    write.csv(dat[rows,cols], file)
                    })

  ##############################################################################
  #Map Tab
  ##############################################################################
  #output$mapselect <- renderUI({
  #  selectInput('map_param', 'Variable to map:',
  #            c("Chlorophyll","Phycocyanin"),
  #            selected = c("Chlorophyll"))})

  #filtered_locs <- reactive({
  #  locs<-locs[locs$Parameter == input$map_param,]
  #  locs[order(locs$Value),]
  #  })
  #colrmp <- colorRampPalette(c("black", "white"))
  #rmp <- colrmp(195)
  #output$map <- renderLeaflet({
  #  leaflet(data = filtered_locs()) %>%
  #    addTiles() %>%
  #    addCircleMarkers(~Longitude,~Latitude,color = rmp)

  #})

  ##############################################################################
  #Analysis Tab
  ##############################################################################
  chla_dat <- dat[dat$Parameter == "Chlorophyll",]
  phyco_dat <- dat[dat$Parameter == "Phycocyanin",]

  formulaText <- reactive ({
    paste("log1p(Value) ~", input$categ)
  })

  output$chlaPlot <- renderPlot({
    boxplot(as.formula(formulaText()),data=chla_dat, main = "Chlorophyll a")
  })

  output$phycoPlot <- renderPlot({
    boxplot(as.formula(formulaText()),data=phyco_dat, main = "Phycocyanin")})
})

