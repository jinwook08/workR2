library(ggplot2)
library(tidyverse)
setwd('C:/Users/ICT01_06/Desktop/시각화 자료')
year <- c(2015,2016,2017,2018)
ck <- read.csv('연령별 창업률2.csv',header=F)
ck2015<- ck[-1,]
ck202015 <- ck2015[1,]
t1<- ck202015[,-1]
ck2016 <- ck[-1,]
ck203016 <- ck2016[2,]
t2<- ck203016[,-1]
ck2017 <- ck[-1,]
ck204017 <- ck2017[3,]
t3<- ck204017[,-1]
ck2018 <- ck[-1,]
ck205018 <- ck2018[4,]
t4<- ck205018[,-1]
ck2019 <- ck[-1,]
ck206019 <- ck2019[5,]
t5<- ck206019[,-1]
year=c(2015,2016,2017,2018)
year
as.matrix(year,t2,t3,t4,t5)
t2

ckto <- data.frame(year,t2,t3,t4,t5)
ckto
View(ckto)
install.packages("viridis")
install.packages("hrbrthemes")
library(ggplot2)
library(viridis)
library(hrbrthemes)
ck
t2
# create a dataset
specie <- c(rep("2015" , 5) , rep("2016" , 5) , rep("2017" , 5) , rep("2018" , 5) )
condition <- rep(c("20대" , "30대" , "40대",'50대','60대이상') , 4)
value <- 
data <- data.frame(specie,condition,value)
data
str(value)
str(ck)

# Graph
ggplot(data, aes(fill=condition, y=value, x=condition)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_fill_viridis(discrete = T, option = "E") +
  ggtitle("Studying 4 species..") +
  facet_wrap(~specie) +
  theme_ipsum() +
  theme(legend.position="none") +
  xlab("")

