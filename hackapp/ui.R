## ui.R

library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel(img(src="https://upload.wikimedia.org/wikipedia/zh/thumb/1/17/Taiwan_Power_Company.svg/1280px-Taiwan_Power_Company.svg.png", height=30),
             "六都節電視覺化"
             ),
  
  sidebarLayout(
    sidebarPanel(
      h2("六都節電視覺化"),
      selectInput("color", "顏色：",
                  c("城市" = "city",
                    "區域" = "area",
                    "用電" = "gen")
                  )
      ),
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("mapPlot")
    )
  )
))