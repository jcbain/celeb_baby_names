library(XML)
library(stringr)
library(lubridate)
library(dplyr)
all1=c()

dataDirectory <- "E:/" 
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
  
  
 
  
  all1 = rbind(all1,char[1:2])
}
all1

title1 = data$Title

char_titl = cbind.data.frame(all1,title1)
char_titl_y = cbind(char_titl,data$Year)
#all1 = cbind(all1,years)

char_titl_y 

write.table(char_titl_y, file = "E:/Rasha_Data.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")
