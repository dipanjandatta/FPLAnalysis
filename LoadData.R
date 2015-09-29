library(XML)
library(stringr)

# build the URL
url = "http://m.fantasy.premierleague.com/player-list/"

# read the tables and select the one that has the most rows
tables <- readHTMLTable(url)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
tables[[which.max(n.rows)]]

Test= do.call(rbind, lapply(seq_along(tables), 
                      function(i){
                                  data.frame(Tag=i, tables[[i]])
                                  }
                      )
              )


Test$Cost= as.numeric(gsub("[[:punct:]]", "",Test$Cost))/10

Test$Points= as.numeric(Test$Points)

