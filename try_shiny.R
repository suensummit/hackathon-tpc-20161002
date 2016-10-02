install.packages("shiny")
library(shiny)
?"shiny"
install.packages('rsconnect')
library(rsconnect)

rsconnect::setAccountInfo(name='suensummit', token='7F2E61D2F6F84803F152B16819E2D338', secret='uhmszfu5TsRstnnKVA9wLRm7Z5ZXSuwyskjdHyIC')

setwd("~/Documents/hackathon-tpc-20161002/")
setwd("hackapp/")
shiny::runApp()
deployApp()

library("jsonlite")
usage <- jsonlite::fromJSON("data/usage.json")
usage$geometries[1]

install.packages("geojsonio")
