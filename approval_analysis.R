library(ggplot2)

avg <- read.csv('data/presApprovalAverage.csv')
avg$fname_rate<-avg$f_count/avg$total
avg$lname_rate<-avg$l_count/avg$total

# sample plot
ggplot(avg, aes(x = year, y= Approving, colour = President)) +  geom_line() #+ facet_grid(.~f_name)
