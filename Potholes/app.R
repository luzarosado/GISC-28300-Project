library(shiny)
library(tmap)
library(sf)
library(lubridate)


potholes <- read.csv("Potholes_Patched.csv")
wards <- read_sf("WARDS_2015.shp")


ui <- fluidPage(
  tmapOutput("mymap")
  
)

server <- function(input, output, session) {
  output$mymap <- renderTmap({
    tm_shape(wards) +
    tm_polygons() +
    tm_shape(potholes)
    tm_dots()
    
  })
}

shinyapp(ui, server)