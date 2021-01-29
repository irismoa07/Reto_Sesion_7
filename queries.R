install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")
install.packages("ggplot2")

library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

library(dplyr)
consulta <-  DataDB %>% filter(Language == "Spanish") 

library(ggplot2)

ggplot(consulta,aes(x=CountryCode,y=Percentage))+geom_bin2d()
