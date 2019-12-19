library(ggmap)
library(ggplot2)
library(tidyverse)


setwd('C:/Users/qlswl/Desktop/lastTeam')


jeju <- read.csv('제주도 청년 정책3.csv',header=F,as.is=T )
jeju
View(jeju)
jeju2<- jeju[,c(-1,-8)]



View(jeju3)
jeju3 <- jeju2[-1,]
jeju4<- t(jeju3)

View(jeju4)
class(jeju4)
str(jeju4)
data.frame(jeju4)

as.numeric(jeju3$V2)
t1 <- as.numeric(jeju3$V2)
t2 <- as.numeric(jeju3$V3)
t3 <- as.numeric(jeju3$V4)
t4 <- as.numeric(jeju3$V5)
t5 <- as.numeric(jeju3$V6)
t6 <- as.numeric(jeju3$V7)
j1<- data.frame(t1,t2,t3,t4,t5,t6)
j2<- j1[,-1]
j2

j3<- j2[-1,]
j3

nm <- c('제주청년 뉴딜 일자리사업', '제주 더 큰 내일센터 운영', '지역산업 맞춤형 일자리 창출지원사업','지역주도형 청년일자리 ', '청년 취업지원 희망프로젝트','취업지원프로그램 운영', '청년 공공일자리지원','맞춤형 일자리 창출지원','대학일자리센터 지원', '청년Dream 취업박람회', '청년 창업농 영농정착 지원', '청년 농업인 육성','청년 창업 역량강화','청년어업인 영어정착 지원')
j4<- data.frame(nm,j3)
View(j4)

data.frame(year,j4)
ggplot(j4, aes(y='제주청년 뉴딜 일자리사업'))+
  geom_bar(stat='identity')

year<- c(2018,2019,2020,2021,2022)
t1 <- c(350,2814,3000,3000,3000)
t2 <- c(100,2700,13000,13000,13000)
t3 <- c(1,2646,3000,3000,3000)
t4 <- c(1	,2273	,2273	,2273,	2273)
t5 <- c(1600,	1500,	2200,	2200,	2200)
t6 <- c(1779,	1451,	1456,	1456,	1456)
t7 <- c(760,	1439,	1439,	1439,	1439)
t8 <- c(770,	1139,	1077,	770,	770)
t9 <- c(425	,425	,600	,600	,600)
t10 <- c(60	,56	,56	,56	,56)
t11<- c(400,	1443,	1359,	1459,	1559)
t12 <- c(45,	664,	195,	195,	195)
t13 <- c(68,	728,	780,	780,	820)
t14 <- c(1,	67,	70,	70,	70)


total <- data.frame(year,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14)
total
View(total)
names(total) <- c('뉴딜 일자리사업', '더 큰 내일센터', '맞춤형 일자리 창출지원사업','지역주도형 청년일자리 ', '청년 취업지원 희망프로젝트','취업지원프로그램 운영', '청년 공공일자리지원','맞춤형 일자리 창출지원','대학일자리센터 지원', '청년Dream 취업박람회', '청년 창업농 영농정착 지원', '청년 농업인 육성','청년 창업 역량강화','청년어업인 영어정착 지원')
total
jeju
t1
ggplot(total)+
  geom_line(aes(x=year,y=t1),col='deeppink',lwd=2)+
  geom_line(aes(x=year,y=t2),col='red',lwd=2)+
  geom_line(aes(x=year,y=t3),col='blue',lwd=2)+
  geom_line(aes(x=year,y=t4),col='green',lwd=2)+
  geom_line(aes(x=year,y=t5),col='coral',lwd=2)+
  geom_line(aes(x=year,y=t6),col='brown',lwd=2)+
  geom_line(aes(x=year,y=t7),col='darkgreen',lwd=2)+
  geom_line(aes(x=year,y=t8),col='hotpink',lwd=2)+
  geom_line(aes(x=year,y=t9),col='purple',lwd=2)+
  geom_line(aes(x=year,y=t10),col='sky blue',lwd=2)+
  theme(legend.position ='right')+
  labs(x='년도', y='예산 (백만원)')+
  ggtitle('도내 청년 일자리 정책사업')+
  theme(plot.title = element_text(size=20,
                                  face='bold',
                                  colour = 'dark orange'))

library(ggplot2)

  
  
  
  
  


