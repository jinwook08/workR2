##
##연령별 제주도 이동건수
##
library(ggmap)
library(ggplot2)
library(tidyverse)


setwd('C:/Users/ICT01_22/Desktop/새 폴더 (3)')

jj<- read.csv('1.연령별 이동건수 .csv ')

jed<- subset(jj, 행정구역별 == '제주특별자치도')
jed
jed2 <- subset(jed, 항목 == '총전출')
sj<- jed2[6:8,-1]
s2015<- sum(sj$X2015.년)
s2016<- sum(sj$X2016.년)
s2017<- sum(sj$X2017.년)
s2018<- sum(sj$X2018.년)
year <- 2015:2018
ds <- c(s2015,s2016+s2015,s2017+s2015+s2016,s2018+s2015+s2016+s2017)
ds
df <- data.frame(year,ds)
df
ggplot(df,aes(x=year,y=ds))+
  geom_line(col='red',lwd=2)+
  geom_point(col='blue',lwd=3)+
  geom_bar(stat = 'identity',width = 0.7,fill='blue')+
  labs(x='년도',y='제주청년 총 전출 (누적)')+
  ggtitle('제주 청년 전출 그래프 (누적)')
##  year    ds
# 1 2015 14823
# 2 2016 30242
# 3 2017 46883
# 4 2018 64549
   ###막대 그래프 연도별(누적) 청년 전출숫자


jc<- read.csv('5.전출지전입지시도 별 이동자.csv')
jc2<- subset(jc,전출지별=='제주특별자치도')
jc3<- jc2[2:9,]
jc4<- jc3[1,]
seoul<- jc4[,c(3,5,7,9)]
seoul
seoul <- c( 6351 , 6634 , 7209 , 7720)
seoul
jc4<- jc3[2,]
pusan<- jc4[,c(3,5,7,9)]
pusan
pusan <- c(1773 , 1853 , 2029 , 1980)
jc4<- jc3[3,]
jc4
daegoo<- jc4[,c(3,5,7,9)]
daegoo <- c(734,823,1003,1032)
jc4<- jc3[4,]
jc4
incheon<- jc4[,c(3,5,7,9)]
incheon
incheon <- c(1287 , 1414 , 1552 , 1738)
jc4<- jc3[5,]
jc4
gwangju<- jc4[,c(3,5,7,9)]
gwangju
gwangju <- c(793,741,898,926)
jc4<- jc3[6,]
jc4
daejeon<- jc4[,c(3,5,7,9)]
daejeon
daejeon <- c(603 ,  631  , 688  , 689)
jc4<- jc3[7,]
jc4
ulsan<- jc4[,c(3,5,7,9)]
ulsan 
ulsan <- c(441,430,403,470)
jc4<- jc3[8,]
jc4
sejo <-  jc4[,c(3,5,7,9)]
sejo
sejo <- c(188,210  , 255  , 333)

year
total<- data.frame(year,sejo,ulsan,daejeon,gwangju,incheon,daegoo,pusan,seoul)
total
plot(year,sejo,main='제주에서 전출자 이동지역 ',
     type='b',lty=1,col='red',xlab='년도',ylab='이동자수'
     ,ylim=c(1,8000),lwd=3)
lines(year,ulsan,type = 'b',lty=1,col='blue',lwd=3)
lines(year,daejeon,type = 'b',lty=1,col='gainsboro',lwd=3)
lines(year,gwangju,type = 'b',lty=1,col='coral',lwd=3)
lines(year,incheon,type = 'b',lty=1,col='saddle brown',lwd=3)
lines(year,daegoo,type = 'b',lty=1,col='darkgreen',lwd=3)
lines(year,pusan,type = 'b',lty=1,col='deep pink',lwd=3)
lines(year,seoul,type = 'b',lty=1,col='dodger blue',lwd=3)

##########
bj<- read.csv('5.3  시도별 비정규직근로자_비율.csv',header=T)
bb<- bj[2:9,-6]
bb1<- bb[1,]
bb1[,c(2:5)]
seoul1 <- c(31.7,32.3,33.9,33.5)
seoul1  
bb1<- bb[2,]
bb1
bb1[,c(2:5)]
pusan1 <- c(32.1,32.5,33.2,31.3)
pusan1
bb1<- bb[3,]
bb1
bb1[,c(2:5)]
Incheon <- c(31.9,32.9,32.1,30.8)
Incheon

total1 <- data.frame(서울=seoul1, 부산=pusan1, 인천=Incheon)
total1
barplot(as.matrix(total1),main='비정규직 근로자 비율',beside=T,col=rainbow(nrow(total1)),ylim=c(0,60))
legend(0,60,c('2015','2016','2017','2018'),cex=0.8,fill=rainbow(nrow(total1)))

