library(shiny)
runApp(host="0.0.0.0", port=strtoi(Sys.getenv("PORT")))

# maybe ideas about x11 here https://github.com/MarcialRosales/r-pcf-workshop
# https://stackoverflow.com/questions/37521259/using-rgl-with-headless-display
# https://www.r-bloggers.com/graphical-tools-rgl-on-a-headless-shiny-server/