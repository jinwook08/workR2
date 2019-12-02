#
#
#

setwd("D:/New-one/workR2/excel")
df <- read.table(file= 'airquality.txt',header= T)
df

class(df)
dim(df)
str(df)
head(df,3)
tail(df,3)

install.packages('xlsx')
install.packages('rJava')   #패키지를 설치하겠다. 

library(rJava)
library(xlsx)   #패키지를 사용하겠다. 


df.xlsx <- read.xlsx(file='airquality.xlsx', sheetIndex = 1,  #앞에 sheetIndex 를 쓰지않아도 상관없다.
                     encoding = 'UTF-8')    #sheetIndex  는 몇번째 시트인지고른다. 
df.xlsx
class(df.xlsx)
str(df.xlsx)
head(df.xlsx,3)
tail(df.xlsx,3)

#read.table
#read.csv   ##위에 두개는base 패키지  
#read.xlsx    ##rJava라는함수에 설치되어 있으므로 인스톨을 이용해서 설치한다. 

score <- c(76,84,69,50,95,6,82,71,88,84)
which(score==69)
which(score>=85)
max(score)
which.max(score)
min(score)
which.min(score)

idx <- which(score>=60)    #60보다 큰 값들을 전부 
score[idx] <- 61            #61로 바꾸어준다. 
score 

idx <- which(iris[,1:4]>5.0,arr.ind = T)   #arr.ind 를 사용해야좌표값이 주어진다. 
idx


#
#단일변수(일변량) 범주형 자료 탐색.  #범주형이면서 일변량인경우 많지않아요.
#
#

favorite <- c('WINTER','SUMMER','SPRING',
              'SUMMER','SUMMER','FALL',
              'FALL','SUMMER','SPRING','SPRING')
favorite
class(favorite)
table(favorite)
table(favorite)/length(favorite)
ds <- table(favorite)
ds
barplot(ds,main='favorite season')



ds.new <- ds[c(2,3,1,4)]
ds.new
barplot(ds.new,main = 'favorite season')   #이렇게 순서를 바꿀수있어!!
####중요하단다. 
#main ==  가장 상단에 표시한다. 

##파이 그래프

pie(ds,main='favorite season')
pie(ds.new, main= 'favorite season')

#범주형은 값의 범위이다. 
#1부터 3사이의 값만 범위로 들어가 있다.
#숫자이기때문에 범주형이 아니다는 절대 아님. 

favorite.color <- c(2,3,2,2,1,1,2,3,2,1,2,3,1,2,1,3,3,
                    1,2,3,2,1,2,1,2,3,1)
ds <- table(favorite.color)
ds
barplot(ds,main='favorite season')
colors <- c('green','red','black')
names(ds) <- colors
ds
barplot(ds,main='favorite season',col=colors)
pie(ds,main = 'favorite season', col= colors)



#col == 색상부여인수. 




#단일변수(일변량)연속형 자료 탐색

weight <- c(60,62,64,65,68,69)
weight
weight.heavy <- c(weight,120)
weight.heavy

#평균단점 해당하는 데이터의 값이 고르면 원하는 값을 구하기 쉽지만
#하나가 굉장히 큰 값이 들어가면 매우 크게 나올 수 있다. 
mean(weight)
mean(weight.heavy)

#중앙값
median(weight)
median(weight.heavy)

#절사평균
mean(weight,trim = 0.2)
mean(weight.heavy, trim = 0.2)

#trim 상위; 20프로 하위 20프로씩 잘라내고 평균을구한다. 

#사분위수
quantile(weight.heavy)

quantile(weight.heavy, (0:10)/10)


#1사분위 2사분위 3사분위 4사분위로 나누어준다. 
#2사분위가 중앙값과 같다. 
#1사분위 25% 2사분위 50% 3사분위 75% 4사분위 120%
#0% 최솟값, 100% 최댓값. 


#종합해서 쓰는 함수 
summary(weight.heavy, )
#산포(distribution)-값이 얼마나 퍼져있는 정도 파악. 
#나중에 산포도라는것을 배운다. 

#분산
var(weight)

#표준편차
sd(weight)
#값의 범위(최소값과 , 최대값)
range(weight)
#최대값과 최소값의 차이
diff(range(weight))


#histogram: 연속형 자료의 분포를 시각화 연속형 자료에서는
# 구간을 누나고 구간에 속한 값들의 개수를 세는 방법으로 사용.

str(cars)
dist <- cars[,2]
hist(dist,main='Histogram for 제동거리',xlab='제동거리'
     ,ylab='빈도수',border='black',col='green',
     las=0, breaks=5)


#cars 라는 데이터 셋. 
#dist 제동거리 를 가지고 연속형의 일반형을 .
#las 는 글자의 방향을 나타낸다. 
#breaks 는 기본적으로 막대의 갯수를 나타낸다. 
#그러나 데이터 분포에 따라서는 breaks의 개수대로 나오지 않을 수도 있다. 
#hist 히스토그램으로 값을 표현해준다. 



#상자그림(boxplot, 상자수염그림)
#사분위수를 시각화하여 그래프 형태로 표시
#상자 그림은 하나의 그래프 데이터의 분포 형태를 포함한
#다양한 정보를 전달한다. 
#자료의 전반적인 분포를 이해하는데 도움. 
#구체적인 최소/ 최대 중앙갑을 알기는 어렵다. 

boxplot(dist,main='자동차 제동거리')

boxplot(dist)
boxplot(dist)$stats #정상범위 사분위수
boxplot(dist)$n     #관측치 개수
boxplot(dist)$conf  #중앙값 신뢰구간
boxplot(dist)$out   #이상치(특이값) 목록


#일뱐량중 그룹으로 구성된 자료의 상자그림

boxplot(Petal.Length~Species, 
        data= iris,
        main= '품종별 꽃잎의 길이')
boxplot(iris$Petal.Length~iris$Species, 
        main= '품종별 꽃잎의 길이')



# 
# 한화면에 여러 그래프 작성

par(mfrow= c(1,3))    #1x3 가상화면 분할
barplot(table(mtcars$carb),main= 'c',
        xlab = 'carburetors',ylab='freq',
        col='blue')

barplot(table(mtcars$cyl),main= 'cyl',
        xlab = 'cyl',ylab='freq',
        col='black')

barplot(table(mtcars$gear),main= 'g',
        xlab = 'gear',ylab='freq',
        col='green')

par(mfrow=c(1,1))  # 가상화면 분할 해제

#현재 현상을 데이터를 통해서 그 이면을 찾아내는것. 










