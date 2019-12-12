##
##연령별 제주도 이동건수
##
library(ggmap)
library(ggplot2)
library(tidyverse)


setwd('C:/Users/qlswl/Desktop/새 폴더 (3)')

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
    geom_bar(stat = 'identity',width = 0.7,fill='darkgreen')+
  labs(x='년도',y='제주청년 총 전출 (누적,명)')+
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
     type='b',lty=1,col='red',xlab='년도',ylab='이동자수(명)'
     ,ylim=c(1,20000),lwd=3)
lines(year,ulsan,type = 'b',lty=1,col='blue',lwd=3)
lines(year,daejeon,type = 'b',lty=1,col='gainsboro',lwd=3)
lines(year,gwangju,type = 'b',lty=1,col='coral',lwd=3)
lines(year,incheon,type = 'b',lty=1,col='saddle brown',lwd=3)
lines(year,daegoo,type = 'b',lty=1,col='darkgreen',lwd=3)
lines(year,pusan,type = 'b',lty=1,col='deep pink',lwd=3)
lines(year,seoul,type = 'b',lty=1,col='dodger blue',lwd=3)

##########
bj<- read.csv('5.3  시도별 비정규직근로자_비율.csv',header=T)
jeju <- bj[18,]
jeju <- c(40.2,39.3,39.1,39.1)
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

total1 <- data.frame(서울=seoul1, 부산=pusan1, 인천=Incheon, 제주=jeju)
total1
barplot(as.matrix(total1),main='비정규직 근로자 비율',beside=T,col=rainbow(nrow(total1)),ylim=c(0,60))
legend(0,60,c('2015','2016','2017','2018'),cex=0.8,fill=rainbow(nrow(total1)))



##
##
##교육 환경.
##서울 부산 인천 광역시와 비교
##비형식 평생교육기관은 평생 교육법에 따라 인가 등록 싱고된 시설 법인 또는 단체로 일반적으로 학원과 같은 경우로 보면 쉽게 이해할 수 있다. 이안에 고용 노동부와 연계하는 HRD등을 하는 평생교육기관도 포함되어 있다. 
##준형삭 평생교육기관은 초 중 고등교육 형태의 평생교육기관으로 직접 해당 학력을 인정하고 학위를 부여할 수 있다. 공교육이라고 생각하면 쉽다. 
ist<- read.csv('6.  지역별 평생교육기관 현황11.csv')
ist
View(ist)
View(ist[,4:12])  ##2015년도 추출
tes<- ist[,4:12]
tes
seoist <- c(1865)
seoist2 <- c(1557)
puist <- c(287)
puist2 <- c(215)
daegist <- c(208)
daegist2 <- c(170)
incist <- c(172)
incist2 <- c(148)
gwist <- c(178)
gwist2 <- c(144)
daejist <- c(172)
daejist2 <-c(116) 
ulist <- c(70)
ulist2 <- c(62)
sejist <- c(14)
sejist2 <- c(9)
jejuist <- c(41)
jejjuist2 <- c(32)
##
tes2 <- ist[,13:22]
tes2
View(tes2)
seoist <- c(1865,1878)
seoist2 <- c(1557,1565)
puist <- c(287,307)
puist2 <- c(215,233)
daegist <- c(208,188)
daegist2 <- c(170,153)
incist <- c(172,185)
incist2 <- c(148,160)
gwist <- c(178,184)
gwist2 <- c(144,149)
daejist <- c(172,164)
daejist2 <-c(116,110) 
ulist <- c(70,67)
ulist2 <- c(62,58)
sejist <- c(14,13)
sejist2 <- c(9,8)
jejuist <- c(41,43)
jejjuist2 <- c(32,32)
##
tes3 <- ist[,23:32]
tes3
View(tes3)
seoist <- c(1865,1878,1864)
seoist2 <- c(1557,1565,1549)
puist <- c(287,307,312)
puist2 <- c(215,233,237)
daegist <- c(208,188,187)
daegist2 <- c(170,153,152)
incist <- c(172,185,168)
incist2 <- c(148,160,145)
gwist <- c(178,184,170)
gwist2 <- c(144,149,134)
daejist <- c(172,164,161)
daejist2 <-c(116,110,108) 
ulist <- c(70,67,54)
ulist2 <- c(62,58,44)
sejist <- c(14,13,16)
sejist2 <- c(9,8,11)
jejuist <- c(41,43,40)
jejjuist2 <- c(32,32,29)
##
tes4 <- ist[,33:42]
tes4
View(tes4)
seoist <- c(1865,1878,1864,1958)
seoist2 <- c(1557,1565,1549,1640)
puist <- c(287,307,312,310)
puist2 <- c(215,233,237,237)
daegist <- c(208,188,187,196)
daegist2 <- c(170,153,152,152)
incist <- c(172,185,168,168)
incist2 <- c(148,160,145,145)
gwist <- c(178,184,170,177)
gwist2 <- c(144,149,134,141)
daejist <- c(172,164,161,154)
daejist2 <-c(116,110,108,101) 
ulist <- c(70,67,54,51)
ulist2 <- c(62,58,44,42)
sejist <- c(14,13,16,15)
sejist2 <- c(9,8,11,10)
jejuist <- c(41,43,40,40)
jejjuist2 <- c(32,32,29,28)

##
year <- c(2015,2016,2017,2018)


 
plot(year,seoist,main='준형식평생교육기관 ',
     type='b',lty=1,col='red',xlab='년도',
     ylab='기관수 (개)'
     ,ylim=c(1,4000),lwd=3)
lines(year,puist,type = 'b',lty=1,col='blue',lwd=3)
lines(year,daegist,type = 'b',lty=1,col='gainsboro',lwd=3)
lines(year,incist,type = 'b',lty=1,col='coral',lwd=3)
lines(year,gwist,type = 'b',lty=1,col='saddle brown',lwd=3)
lines(year,daejist,type = 'b',lty=1,col='darkgreen',lwd=3)
lines(year,ulist,type = 'b',lty=1,col='deep pink',lwd=3)
lines(year,sejist,type = 'b',lty=1,col='dodger blue',lwd=3)
lines(year,jejuist,type = 'b',lty=1,col='dodger blue',lwd=3)


plot(year,seoist2,main='비형식평생교육기관 ',
     type='b',lty=1,col='red',xlab='년도',
     ylab='기관수 (개)'
     ,ylim=c(1,4000),lwd=3)
lines(year,puist2,type = 'b',lty=1,col='blue',lwd=3)
lines(year,daegist2,type = 'b',lty=1,col='gainsboro',lwd=3)
lines(year,incist2,type = 'b',lty=1,col='coral',lwd=3)
lines(year,gwist2,type = 'b',lty=1,col='saddle brown',lwd=3)
lines(year,daejist2,type = 'b',lty=1,col='darkgreen',lwd=3)
lines(year,ulist2,type = 'b',lty=1,col='deep pink',lwd=3)
lines(year,sejist2,type = 'b',lty=1,col='dodger blue',lwd=3)
lines(year,jejjuist2,type = 'b',lty=1,col='dodger blue',lwd=3)





plot(year,seoist+seoist2,main='준형식+비형식평생교육기관 ',
     type='b',lty=1,col='red',xlab='년도',
     ylab='기관수 (개)'
     ,ylim=c(1,4000),lwd=3)
lines(year,puist2+puist,type = 'b',lty=1,col='blue',lwd=3)
lines(year,daegist2+daegist,type = 'b',lty=1,col='gainsboro',lwd=3)
lines(year,incist2+incist,type = 'b',lty=1,col='coral',lwd=3)
lines(year,gwist2+gwist,type = 'b',lty=1,col='saddle brown',lwd=3)
lines(year,daejist2+daejist,type = 'b',lty=1,col='darkgreen',lwd=3)
lines(year,ulist2+ulist,type = 'b',lty=1,col='deep pink',lwd=3)
lines(year,sejist2+sejist,type = 'b',lty=1,col='dodger blue',lwd=3)
lines(year,jejjuist2+jejuist,type = 'b',lty=1,col='dodger blue',lwd=3)







