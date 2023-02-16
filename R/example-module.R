
library(leaflet)
library(shiny)
exampleModuleUI <- function(id, label = "Counter") {
  # All uses of Shiny input/output IDs in the UI must be namespaced,
  # as in ns("x").
#  ns <- NS(id)
  tagList(
    selectizeInput(NS(id,"o"),"o",choices=unique(data$species)),
     leafletOutput(NS(id,"l"))
  
  )
}

exampleModuleServer <- function(id) {
  # moduleServer() wraps a function to create the server component of a
  # module.
  moduleServer(
    id,
    function(input, output, session) {
      
      output$l<-renderLeaflet({
        
        filte<-reactive({
          
          data%>% filter(.data[["species"]]==.env$input$o)
          
          
          
          
        })
        
        leaflet(filte())%>%addTiles()%>%addMarkers(group=" pointer",lat=~latitude,lng=~longitude,clusterOptions = markerClusterOptions())%>%
          addCircleMarkers(group="po",lat=~latitude,lng=~longitude)%>%#,radius = ~individualCount)%>% 
          addLayersControl(baseGroups  = c("pointer","po"))
        
        
      })
      
    }
  )
}
