library(ggplot2)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

avg <- read.csv('data/presApprovalAverage.csv')
avg$fname_rate<-avg$f_count/avg$total
avg$lname_rate<-avg$l_count/avg$total
avg$norm_appr<-ave( avg$Approving, avg$President, FUN = normalize )
avg$norm_fname<-ave( avg$fname_rate, avg$President, FUN = normalize )
# sample plot
ggplot(avg, aes(x = year, y= norm_appr, colour = President)) +  geom_line() #+ facet_grid(.~f_name)
ggplot(avg, aes(x = year, y= norm_fname, colour = President)) +  geom_line()
