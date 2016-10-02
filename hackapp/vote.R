url <- "http://51300.umu.tw/ajax/insertAnswer"

library(httr)
library(rvest)
res <- GET(url)
res$headers
res$content

deviceList = c(1:1000)

"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36"

for (i in 1:1000){
  res <- POST(url, set_cookies("User-Agent", deviceList[i]))
  print(res$status_code)
}

res$status_code
session1 <- html_session(url)
html_form(session1)
my_form <- html_form(session1)[[2]]
my_form <- set_values(my_form, "title"="Frozen")
submit_form(session1, my_form)