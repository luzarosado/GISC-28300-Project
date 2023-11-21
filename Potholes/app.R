library(shiny)
library(tmap)
library(sf)

cook <- st_read("data/cook.shp")

ui <- fluidPage(
  titlePanel("Sidebar layout"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "Select variable:", selected = "POV_RATE", choices = c("POV_RATE", "PCT_BACH_H", "UNEMP_RATE"))
    ),
    mainPanel(
      tmapOutput("map")
    )
  )
)

server <- function(input, output) {
  output$map <- renderTmap({    
    tm_shape(cook) +
      tm_polygons(input$x, palette = "BuGn") + 
      tm_style("classic")
  })
}

shinyApp(ui, server)