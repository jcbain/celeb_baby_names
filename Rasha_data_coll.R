library(XML)
library(stringr)
library(lubridate)
library(dplyr)
all1=c()

dataDirectory <- "E:/" # put your own folder here
data <- read.csv(paste(dataDirectory, 'Disney_Data.csv', sep=""), header = TRUE)

urls = data$URL
for (x in urls)
 { print(x)
  char =c()
  
  imdb250 = readHTMLTable(x, which = 1, stringsAsFactors = FALSE)
  imdb250 = imdb250[,4:4]
  #head(imdb250, n = 5)
  for (st in imdb250){
  char = rbind(char, strsplit(str_trim(gsub("/","",gsub ("Queen","",gsub("Prince ","",gsub("Princess ","",strsplit(st,"\n")[[1]][1])))))," ")[[1]][1])
  
  
  strsplit("my string is sad"," ")[[1]][1]
  
  
  
 }
  
  
  
  #char = str_extract(imdb250, pattern = "\n.*\n")
  #char = gsub("\n","",imdb250) # find and replace
  #char = gsub("(voice)","",char)
  #char = str_trim(imdb250) # remove leading and trailing spaces
  #char[0:5]
  #df = str_replace_all(char[1:2], "[[:punct:]]", " ")
  #db2 = c(gsub(" \n  \n  \n   voice ","",df))
  
 # all1 = rbind(all1,db2)
  
  all1 = rbind(all1,char[1:2])
}
all1


#all1
#mo = c("Frozen","Maleficent","Into the Woods","Brave")

#years = c(2013,2014,2014,2012)

#url2 = c("http://www.imdb.com/list/ls053518863/?start=1&view=compact&sort=moviemeter:asc&defaults=1")
#moy = readHTMLTable(url2, which = 1, stringsAsFactors = FALSE)
#moy = moy[,1:2]
title1 = data$Title

char_titl = cbind.data.frame(all1,title1)
char_titl_y = cbind(char_titl,data$Year)
#all1 = cbind(all1,years)

char_titl_y 

write.table(char_titl_y, file = "E:/MyData9.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")
