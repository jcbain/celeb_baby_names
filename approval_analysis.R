library(ggplot2)

###########################
## MIN-MAX NORMALIZATION ##
###########################
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

#######################
## DATA MANIPULATION ##
#######################
avg <- read.csv('data/presApprovalAverage.csv')
avg$fname_rate<-avg$f_count/avg$total
avg$lname_rate<-avg$l_count/avg$total
avg$norm_appr<-ave( avg$Approving, avg$President, FUN = normalize )
avg$norm_fname<-ave( avg$fname_rate, avg$President, FUN = normalize )
avg$norm_lname<-ave( avg$lname_rate, avg$President, FUN = normalize )

## subsets for better graphs ##
pre1981<- subset(avg, year < 1981) # Roosevelt to Carter
post1980<-subset(avg,year>1980) # Reagan to Obama

##############
## ANALYSIS ##
##############
lm(norm_fname~norm_appr+President, data=avg)


###########
## PLOTS ##
###########

## appoval vs. first name
ggplot(pre1981,aes(x=norm_appr, y =norm_fname))+geom_line(aes(colour=President)) +
  geom_point(aes(colour = President)) + facet_wrap(~President)

ggplot(post1980,aes(x=norm_appr, y =norm_fname))+geom_line(aes(colour=President)) +
  geom_point(aes(colour = President)) + facet_wrap(~President)

## approval and first name
ggplot(pre1981, aes(year)) + 
  geom_line(aes(y = norm_appr, colour = President),alpha =.5) + 
  geom_line(aes(y = norm_fname, colour = President),linetype = 2)# +
 # facet_wrap(~President)

ggplot(post1980, aes(year)) + 
  geom_line(aes(y = norm_appr, colour = President),alpha =.5) + 
  geom_line(aes(y = norm_fname, colour = President),linetype = 2)# +
# facet_wrap(~President)