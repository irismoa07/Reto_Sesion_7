install.packages("rvest")
install.packages("xml2")
library(rvest)

link <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

file <- read_html(link)

tablas <- html_nodes(file, "table")

tabla  <- html_table ( tablas[1], fill  =  TRUE )

tabla2 <- na.omit(as.data.frame(tabla))

str(tabla2)

modi <- gsub("MXN","",tabla2$Sueldo)
modi <- gsub("[^[:alnum:][:blank:]?]", "", modi)
modi <- gsub("mes", "", modi)
modi <- as.numeric(modi)

tabla2$Sueldo <- modi

modi2<- gsub("Sueldos para Data Scientist en ", "", tabla2$Cargo)
tabla2$Cargo <-modi2

maxi <- which.max(tabla2$Sueldo)
tabla2[maxi,]

mini <- which.min(tabla2$Sueldo)
tabla2[mini,]
