# clean data
rm(list=ls())

site = readLines("https://fantasy.premierleague.com/player-list/")

try = grep("<td>",site,value=TRUE)

try = gsub("<td>|</td>","",try)

dF = data.frame(matrix(try,ncol=4,byrow=TRUE))

names(dF) = c('Name','Club','Points','Cost')

dF$Cost= gsub("[[:punct:]]", "",dF$Cost))/10

dF$Points= as.numeric(dF$Points)
