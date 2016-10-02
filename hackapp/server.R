## server.R

library(shiny)
library(dplyr)
library(ggplot2)
library(ggmap)
library(mapproj)
sixcity <- read.csv("data/105_sixcity_all_cord.csv")
dt_sixcity <- sixcity

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    ggplot(dt_sixcity) + 
      geom_jitter(data = dt_sixcity, aes(x = X/1000, y = Y, size = as.numeric(gen)/1000, color = gen))
  })
  
  output$mapPlot <- renderPlot({
    map <- get_map(location = 'Taiwan', zoom = 8)
    ggmap(map)
  })
  
})