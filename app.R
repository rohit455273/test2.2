#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjqui)
library(slickR)
library(stringr)
library(leafpop)
library(slickR)
library(shinyWidgets)
library(leaflet)
library(dplyr)
library(ggplot2)
library(plotly)

data=readRDS("WWW/sf.RDS")%>%mutate_at(vars(species),~na_if(.,"Tree(s) ::"))%>%na.omit()

#datai =data%>%mutate_at(vars(species),~str_replace_all(.,"::","-"))


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  tags$script(src="ss.js"),
  
  tags$link(href="ii.css",rel="stylesheet"), 
  
  tags$div(class ='head',tags$p("Biodiversity App",tags$br() ," Data comes from the ",tags$a(href="https://www.gbif.org/occurrence/search?dataset_key=8a863029-f435-446a-821e-275f4f641165","Global Biodiversity Information Facility."))),
  
  tags$br(),tags$br(),materialSwitch("ml","show sidebar",status = "success"),
  
  navlistPanel( id="np" , widths = c(3,8),
                "home",tabPanel(icon = icon("location"),
                                
                                "map", fluidRow(
                                  column(
                                    7,offset = 4,jqui_draggable(selectizeInput("o","o",choices=unique(data$species))
                                    )
                                  )
                                ),
                                
                                
                                leafletOutput("l"), tags$p("the  species are observed  between"), 
                                fluidRow(
                                  #column(4,dateInput("t","")),
                                   #column(4,tags$p("")),
                                  #column(4,jqui_draggable(dateInput("tt",""))
                                  #)
                                )  
                                
                                ,plotlyOutput("p")),
                
                
                "image",tabPanel("l",slickR::slickROutput("sl"))),
  
  
  
  
  
  
  tags$div( tags$br(),tags$hr(),
            "Follow on ©", 
            tags$a(href="https://github.com/rohit455273/rst",tags$image(src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/2048px-Octicons-mark-github.svg.png",height=30,width=40 )),tags$a(href="https://www.linkedin.com/in/rohit-wankhede-33a20b157/" 
                                                                                                                                                                                                                                  ,tags$img( height=40,width=40,src="https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw")), tags$hr(),class="foot")
  
  
)

# Define server logic required to draw a histogram
server <- function(input, output,session) {
  
  
  
  
  #observeEvent(input$o,{ updateDateInput(session ,"t",value = min(in))})
  
  filte<-reactive({
    
    data%>% filter(.data[["species"]]==.env$input$o)
    
    
    
    
  })
  
  
  observe({if (input$ml==T){
    
    jqui_hide("body > div.container-fluid > div.row > div.col-sm-3.well","fade")
    
  }
    else{
      jqui_show("body > div.container-fluid > div.row > div.col-sm-3.well","fade")
      
    }
    
  })
  
  #observe({
  
  #if(input$ml==T){
  
  # updateNavlistPanel(session,inputId =  "np", tabPanel("l",icon = icon("house","sms")))
  #}
  
  # else{}
  #})
  
  
 # observeEvent(input$o,{ 
  #  updateDateInput(session ,"t",value = min(filte()$date),min =  min(filte()$date),max =min(filte()$date))
    
  #  updateDateInput(session ,"tt",value = max(filte()$date),min = max(filte()$date),max= max(filte()$date))
    
  #})
  
  
  output$p<-renderPlotly({ 
    #x=ggplot(filte(),aes(date,,size=dbh,color=caretaker))+geom_point()+
    
    # theme(panel.grid.major.x = element_blank(),plot.background = element_rect(fill = "#a1d9ef"),
    #     panel.background = element_rect(fill = "#a1d9ef"),axis.text = element_text(size = 9))
    #  ggplotly(x)
    
  })
  
  
  output$l<-renderLeaflet({
    
    leaflet(filte())%>%addTiles()%>%addMarkers(group=" pointer",lat=~latitude,lng=~longitude,clusterOptions = markerClusterOptions())%>%
      addCircleMarkers(group="po",lat=~latitude,lng=~longitude)%>%#,radius = ~individualCount)%>% 
      addLayersControl(baseGroups  = c("pointer","po"))
    
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
