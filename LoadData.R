library(XML)
library(stringr)

# build the URL
url <- paste("http://sports.yahoo.com/nfl/stats/byposition?pos=QB",
             "&conference=NFL&year=season_2009",
             "&timeframe=Week1", sep="")

# read the tables and select the one that has the most rows
tables <- readHTMLTable(url)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
tables[[which.max(n.rows)]]

# select the table we need - read as a dataframe
my.table <- tables[[7]]
