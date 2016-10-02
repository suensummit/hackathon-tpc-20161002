setwd("~/Documents/hackathon-tpc-20161002/")
dir()
# install.packages("tidyr")
# remove.packages("data.table")
# install.packages("data.table", type = "source",
#                  repos = "http://Rdatatable.github.io/data.table")
# install.packages("ggmap")
# install.packages("mapproj")
# install.packages("maptools")
library(data.table)
library(ggplot2)
library(tidyr)

try1 <- fread("105上半年新北市各地非營業用戶售電量.csv")
summary(try1)

try2 <- fread("NEWTAIPEI_capacity.csv")
summary(try2)
head(try2)

try3 <- fread("105_sixcity_all.csv")
head(try3)
dt_sixcity <- data.table(try3)

dist <- fread("class_one_dist.csv")

#dt_dist <- dt_sixcity %>% setkey(code1) %>% .[dist[,.("CODE1","X","Y")], nomatch = 0]
dt_dist <- dt_sixcity %>% setkey(code1) %>% .[dist, nomatch = 0]
ggplot(dt_dist) + geom_jitter(aes(x = X, y = Y, color = gen))

head(dt_dist)
fwrite(dt_dist, "105_sixcity_all_dist.csv")

dcast(dt_dist, city + area + code1 ~ Ym, value.var = "gen")

library(ggmap)
library(mapproj)
library(maptools)
map <- get_map(location = 'Taiwan', zoom = 8)
ggmap(map) + geom_point(data = dt_dist, aes(x = X, y = Y, size = gen))
sixcity.shp <- readShapeSpatial("data/sixcity.shp")
