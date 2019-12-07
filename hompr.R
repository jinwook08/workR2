setwd("D:/개인 프로젝트/내 외국인 관광객 현황")
pp <- read.csv("제주특별자치도_내국인관광객현황_2015.csv")

pp
col <- rowSums(pp[c(1,2,3) , c(-1,-2,-3)])  #2015형태별 제주도 관광객.
col
chh <- sum(col) #2015제주도 총관광객 인원
chh
형태 <- c('개별여행','부분패키지','패키지')
목적 <- c('레저스포츠','회의및업무','휴양및관람','친지방문','교육여행','기타방문')

travel._2015 <- data.frame(형태,col)
travel._2015          #전체 제주도 관광 형태. 

##제주도 관광 목적.##
goal <- rowSums(pp[c(-1,-2,-3) , c(-1,-2,-3)])
goal
travel2._2015 <- data.frame(목적,goal)
travel2._2015            #형태별 제주도 관광 형태. 
sum(goal)





pp1 <- read.csv("제주특별자치도_내국인관광객현황_2016.csv")

pp1
col1 <- rowSums(pp1[c(1,2,3) , c(-1,-2,-3)])  #2016형태별 제주도 관광객.
col1
chh1 <- sum(col1) #2016제주도 총관광객 인원
chh1
형태 <- c('개별여행','부분패키지','패키지')
목적 <- c('레저스포츠','회의및업무','휴양및관람','친지방문','교육여행','기타방문')

travel._2016 <- data.frame(형태,col1)
travel._2016          #전체 제주도 관광 형태. 

##제주도 관광 목적.##
goal1 <- rowSums(pp1[c(-1,-2,-3) , c(-1,-2,-3)])
goal1
travel2._2016 <- data.frame(목적,goal1)
travel2._2016           #형태별 제주도 관광 형태. 
sum(goal1)









pp2 <- read.csv("제주특별자치도_내국인관광객현황_20171231.csv")

pp2
col2 <- rowSums(pp2[c(1,2,3) , c(-1,-2,-15)])  #2017형태 제주도 관광객.
col2
chh2 <- sum(col2) #2017제주도 총관광객 인원
chh2
형태 <- c('개별여행','부분패키지','패키지')
목적 <- c('레저스포츠','회의및업무','휴양및관람','친지방문','교육여행','기타방문')

travel._2017 <- data.frame(형태,col2)
travel._2017          #전체 제주도 관광 형태. 

##제주도 관광 목적.##
goal2 <- rowSums(pp2[c(-1,-2,-3) , c(-1,-2,-15)])
goal2
travel2._2017 <- data.frame(목적,goal2)
travel2._2017           #형태별 제주도 관광 형태. 
sum(goal2)










pp3 <- read.csv("제주특별자치도_내국인관광객현황_20181231.csv")

pp3
col3 <- rowSums(pp3[c(1,2,3) , c(-1,-2,-15)])  #2018형태별 제주도 관광객.
col3
chh3 <- sum(col3) #2018제주도 총관광객 인원
chh3
형태 <- c('개별여행','부분패키지','패키지')
목적 <- c('레저스포츠','회의및업무','휴양및관람','친지방문','교육여행','기타방문')

travel._2018 <- data.frame(형태,col3)
travel._2018          #전체 제주도 관광 형태. 

##제주도 관광 목적.##
goal3 <- rowSums(pp3[c(-1,-2,-3) , c(-1,-2,-15)])
goal3
travel2._2018 <- data.frame(목적,goal3)
travel2._2018           #형태별 제주도 관광 형태. 
sum(goal3)








##################################################################################################################


read.csv('제주특별자치도_연도별관광객입도현황_2013_2018.csv')

fore <- read.csv('제주특별자치도_연도별관광객입도현황_2013_2018.csv')

fore

Tr<- fore[c(-1),c(-8)]
jap<- Tr[1,]
jap            ##15~18년도별 일본인 현황
jap1<- sum(jap[ ,c(-1,-2,-3 )])  #15~18년도 일본인 합계
jap1

us <- Tr[2,]
us                  ##15~18년도별 미국인 현황
us1<- sum(us[ , c(-1,-2,-3 )])          #15~18년도 미국인 합계
us1

tw <- Tr[3,]
tw                    #15~18년도별 대만인 합계
tw1<- sum(tw[,c(-1,-2,-3 )])            #15~18년도 중국인 합계
tw1

ch <- Tr[4,]
ch                    ##15~18 년도별 중국인 현황
ch1 <- sum(ch[,c(-1,-2,-3 )])           ##15~18년도별 중국인 합계
ch1


hk <- Tr[5,]
hk                    ##15~18 년도별 홍콩인 현황
hk1<- sum(hk[,c(-1,-2,-3 )])             ##15~18년도별 홍콩인 합계
hk1

sg <- Tr[6,]
sg                    ##15~18 년도별 싱가폴인 현황
sg1<- sum(sg[,c(-1,-2,-3 )])             ##15~18년도별 싱가폴인 합계
sg1



mal <- Tr[7,]
mal                    ##15~18 년도별 말레이시아인 현황
mal1<- sum(mal[,c(-1,-2,-3 )])             ##15~18년도별 말레이시아인 합계
mal1

ext <- Tr[8,]
ext                    ##15~18 년도별 기타인 현황
ext1<- sum(ext[,c(-1,-2,-3 )])             ##15~18년도별 기타인 합계
ext1



sum(chh,chh1,chh2,chh3)   #2015~2018까지 내국인 관광객수의 합.

mm <- sum(chh,chh1,chh2,chh3) 
mm/4    #2015~2018 내국인 평균 인원수

sum(jap1,us1,tw1,ch1,hk1,sg1,mal1,ext1)   #2015~2018 외국인 합계수
mm1 <- sum(jap1,us1,tw1,ch1,hk1,sg1,mal1,ext1)
mm1/4
#2013~2018 외국인 평균


install.packages('xlsx')
install.packages('rJava')   #패키지를 설치하겠다. 

library(rJava)
library(xlsx)   #패키지를 사용하겠다. 
install.packages('ggplot2')
library('ggplot2')

barplot(c(mms,mm1s),main = '2015~2018제주도 방문관광객')
mms <- mm/10000
mms

mm1s <- mm1/10000
mm1s


barplot(c(mms,mm1s),ylim=c(0,6000),las=1,col=c('green','red'),
        xlab='내국인     외국인 ',ylab='방문객/10000',main = '2015~2018제주도 방문관광객')










###################################################
Tr<- fore[c(-1),c(-8)]
jap<- Tr[1,]
jap            ##15~18년도별 일본인 현황
jap1<- sum(jap[ ,2])
jap2<- sum(jap[ ,3])
jap3<- sum(jap[ ,4])
jap4<- sum(jap[ ,5])
jap5<- sum(jap[ ,6])
jap6<- sum(jap[ ,7])  #15~18년도 일본인 합계
jap1

us <- Tr[2,]
us                  ##15~18년도별 미국인 현황
us1<- sum(us[ , 2]) 
us2<- sum(us[ , 3])
us3<- sum(us[ , 4])
us4<- sum(us[ , 5])
us5<- sum(us[ , 6])
us6<- sum(us[ , 7])

us1

tw <- Tr[3,]
tw                    #15~18년도별 대만인 합계
tw1<- sum(tw[,2])
tw2<- sum(tw[,3])
tw3<- sum(tw[,4])
tw4<- sum(tw[,5])
tw5<- sum(tw[,6])
tw6<- sum(tw[,7])
tw1

ch <- Tr[4,]
ch                    ##15~18 년도별 중국인 현황
ch1 <- sum(ch[,2])           ##15~18년도별 중국인 합계
ch2 <- sum(ch[,3])
ch3 <- sum(ch[,4])
ch4 <- sum(ch[,5])
ch5 <- sum(ch[,6])
ch6 <- sum(ch[,7])
ch1


hk <- Tr[5,]
hk                    ##15~18 년도별 홍콩인 현황
hk1<- sum(hk[,2])             ##15~18년도별 홍콩인 합계
hk2<- sum(hk[,3])
hk3<- sum(hk[,4])
hk4<- sum(hk[,5])
hk5<- sum(hk[,6])
hk6<- sum(hk[,7])
hk1

sg <- Tr[6,]
sg                    ##15~18 년도별 싱가폴인 현황
sg1<- sum(sg[,2])             ##15~18년도별 싱가폴인 합계
sg2<- sum(sg[,3])
sg3<- sum(sg[,4])
sg4<- sum(sg[,5])
sg5<- sum(sg[,6])
sg6<- sum(sg[,7])

sg1



mal <- Tr[7,]
mal                    ##15~18 년도별 말레이시아인 현황
mal1<- sum(mal[,2])             ##15~18년도별 말레이시아인 합계
mal2<- sum(mal[,3])
mal3<- sum(mal[,4])
mal4<- sum(mal[,5])
mal5<- sum(mal[,6])
mal6<- sum(mal[,7])
mal1

ext <- Tr[8,]
ext                    ##15~18 년도별 기타인 현황
ext1<- sum(ext[,2])             ##15~18년도별 기타인 합계
ext2<- sum(ext[,3])
ext3<- sum(ext[,4])
ext4<- sum(ext[,5])
ext5<- sum(ext[,6])
ext6<- sum(ext[,7])
ext1



fore_2015<- sum(jap3,us3,tw3,ch3,hk3,sg3,mal3,ext3)
fore_2015

fore_2016<- sum(jap4,us4,tw4,ch4,hk4,sg4,mal4,ext4) #2015년 외국인 제주도 방문 합계.
fore_2016

fore_2017<- sum(jap5,us5,tw5,ch5,hk5,sg5,mal5,ext5)
fore_2017

fore_2018<- sum(jap6,us6,tw6,ch6,hk6,sg6,mal6,ext6)
fore_2018



chh /1000000 #2015 한국
chh1/1000000   #2016 한국
chh2/1000000  #2017 한국
chh3 /1000000     #2018 한국
total_chh<- c(chh /10000 ,chh1/10000, chh2/10000 ,chh3 /10000  )
year <- c(2015,2016,2017,2018)
tt<- data.frame(year,total_chh)
total_chh
tt
hist(total_chh,breaks=4, )

str(total_chh)
barplot(total_chh,ylim =c(0,1500),las=1,col='green' ,xlab='2015            2016            2017            2018',ylab='방문객/10000',main='내국인 관광객 방문추이')

total_fore <- c(fore_2015/10000,fore_2016/10000,fore_2017/10000,fore_2018/10000)
barplot(total_fore,ylim =c(0,1500),las=1,col='red' ,xlab='2015              2016             2017              2018',ylab='방문객/10000',main='외국인 관광객 방문추이')


plot(year,total_fore,main = '내국인,외국인 관광객 방문추이 비교',type='b',lty=1,lwd=5,col='red',
     xlab='year',ylab='방문객/10000',ylim=c(0,1500))


lines(year,total_chh, type = 'b',col='green',lwd=5)


# year <- c(2015,2016,2017,2018)
# num <- c(chh,chh1,chh2,chh3)
# name <- '내국인'
# 
# trv <- data.frame(year,num,name)
# plot(trv[,2]/100,type='o',col=1,ann=F,ylim = c(0,60))
# lines(trv[,3]/100,type='o',col=2)
# lines(trv[,4]/100,type='o',col=3)
# lines(trv[,5]/100,type='o',col=4)
# 
# hist()

setwd('D:/개인 프로젝트/외국인_제주여행_쇼핑장소')
shop<- read.csv('외국인_제주여행_쇼핑장소_2014.csv')
View(shop)
shop_2014.1<- shop[1:2,2:4]
shop_2014.1

shop <- read.csv('외국인_제주여행_쇼핑장소_2015.csv')
shop_2015.1 <- shop[1:2,2:4]
View(shop_2015.1)
shop_2015.1

shop <- read.csv('외국인_제주여행_쇼핑장소_2016.csv')
shop_2016.1 <- shop[1:2,2:4]
shop_2016.1

shop <- read.csv('외국인_제주여행_쇼핑장소_2017.csv')
shop_2017.1 <- shop[1:2,2:4]
shop_2017.1

shop <- read.csv('외국인_제주여행_쇼핑장소_2018.csv')
shop_2018.1 <- shop[1:2,2:4]
shop_2018.1

install.packages("dplyr")
library(dplyr)

shop_2015.2 <- shop_2015.1[,c(-1,-2)]
shop_2015.2
shop_2016.2 <- shop_2016.1[,c(-1,-2)]
shop_2016.2
shop_2017.2 <- shop_2017.1[,c(-1,-2)]
shop_2017.2
shop_2018.2 <- shop_2018.1[,c(-1,-2)]
shop_2018.2
total_shop <- c(shop_2015.2,shop_2016.2,shop_2017.2,shop_2018.2,stringsFacrors=F)
total_shop
total_ss <- c(8.3,26.9,35,24.9)
year <- c(2015,2016,2017,2018)





setwd('D:/개인 프로젝트/내국인 쇼핑장소')

kor_2015.1<- read.csv('내국인_제주여행_쇼핑장소_2015.csv')
kor_2015.2<- kor_2015.1[1:2,13]
kor_2015.2
kor_2016.1<- read.csv('내국인_제주여행_쇼핑장소_2016.csv')
kor_2016.2<- kor_2016.1[1:2,13]
kor_2016.2
kor_2017.1<- read.csv('내국인_제주여행_쇼핑장소_2017.csv')
kor_2017.2<- kor_2017.1[1:2,10]
kor_2017.2
kor_2018.1<- read.csv('내국인_제주여행_쇼핑장소_2018.csv')
kor_2018.2<- kor_2018.1[1:2,8]
kor_2018.2
total_kor <- c(24.6,48.5,48.4,60.2)




plot(year,total_ss,main = '외국인,내국인 제주도내 전통시장 쇼핑비율 ',type='b',lty=1,lwd=5,col='red',xlab='year',ylab='비율(%)',ylim=c(0,70))
lines(year,total_kor,type = 'b',col='green',lwd=5)




setwd('C:/Users/ICT01_14/Desktop/개인 프로젝트/개인 프로젝트/내국인 1인당 지출비용')
kor_shop <- read.csv('내국인_개별여행객_1인당_지출경비_2015.csv')
k <- kor_shop[3,10]

kor_shop1 <- read.csv('내국인_개별여행객_1인당_지출경비_2016.csv')
k1<- kor_shop1[3,10]

kor_shop2 <- read.csv('내국인_개별여행객_1인당_지출경비_2017.csv')
k2 <- kor_shop2[3,10]
kor_shop3 <- read.csv('내국인_개별여행객_1인당_지출경비_2018.csv')
k3 <- kor_shop3[3,10]
k
k1
k2
k3

total_korshop <- c(508759,571866,594576,508759)
total_korshop

setwd('C:/Users/ICT01_14/Desktop/개인 프로젝트/개인 프로젝트/내국인 1인당 지출비용/외국인 개별 여행객 돈 쓰는거')



fore_shop <-read.csv('외국인_개별여행객_1인당_지출경비_2015.csv')
f<- fore_shop[3,10]


fore_shop1 <-read.csv('외국인_개별여행객_1인당_지출경비_2016.csv')
f1 <- fore_shop1[3,10]


fore_shop2 <-read.csv('외국인_개별여행객_1인당_지출경비_2017.csv')
f2 <- fore_shop2[3,10]


fore_shop3 <-read.csv('외국인_개별여행객_1인당_지출경비_2018.csv')
f3<- fore_shop3[3,10]

f
f1
f2
f3
total_foreshop <- c(1985078,1555015,1643853,2056063)
total_foreshop
year <- c(2015,2016,2017,2018)

plot(year,total_korshop,main = '외국인, 내국인 1인당 지출경비 비교 ',type='b',lty=1,lwd=5,col='green',xlab='year',ylab='단위(원)',ylim=c(0,2300000))
lines(year,total_foreshop,type = 'b',col='red',lwd=5)



sum(total_foreshop)/4
sum(total_korshop)/4
###약 3.3배 차이. ##









