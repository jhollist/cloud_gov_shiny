library(shiny)
runApp(appDir = ".", host="0.0.0.0", port=strtoi(Sys.getenv("PORT")))
