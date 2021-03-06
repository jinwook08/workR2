#
#
# #6일차
# #
# 다중변수 자료
# 탐색
# 
# 두 변수 사이의 산점도
# 산점도(scatter plot) -2변수로 구성된 자료의 
#                       분포를 알아보는 그래프
#                       관측값들의 분포를 통해
#                       2변수 사이의 관계파악


#graphics package가 plot등등을 가지고 있음. 
#이변량.
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg,main= '중량-연비 그래프',
     xlab ='중량',  ylab= '연비', col= 'red',pch= 19)

plot(mtcars$wt,mtcars$mpg, main= '중량-연비 그래프',
     xlab ='중량',  ylab= '연비', col= 'red',pch= 19)

plot(mpg~wt,main= '중량-연비 그래프',
     xlab ='중량',  ylab= '연비', col= 'red',pch= 19)

plot(mtcars[,c('wt','mpg')],main= '중량-연비 그래프',
     xlab ='중량',  ylab= '연비', col= 'red',pch= 19)

#모두 똑같은 그래프가 나오며 형태만 다르다. 잘 알아두길 바란다.
#pch는 선점도에 찍히는 모양 0~25
#중량이 증가하면 연비도 낮아 지더라. 



#pairs 를 이용해야 다변량일때 그림을 그릴수 있다. 

# 범주형. 
#그룹정보가 있는 두변수의 산점도. 
iris.2 <- iris[, 3:4]  #이러한 특징들을 품종에 따라서 보고싶은거                          .그러기 위해서 아래에서         
point <- as.numeric(iris$Species)    # 품종들을 문자열에서 숫자로                                         바꾸어 주었다. 
point
color <- c('red','green','blue')
plot(iris.2, main='Iris plot',
     pch= c(point),
     col= color[point])

iris[, 3:4]
iris[, 'Species']

#선형도에서 선을 찾는 방법,
#선형관계를 통해서 상관 분석으로 선형도에서 선을 찾는다. 
#-1<= r<= 1의 상관관계를 나타낸다. 
#r이 -라면 음의 상관관계를 가지며 왼쪽위에서 아래 방향으로
#r이 +라면 양의 상관관계를 가지며 왼쪽 아래에서 오른쪽 위 방향으로 올라간다. 
#대략적으로 +_0.5를 기준으로 상관관계가 높다 낮다는 나타낸다. 
#다변량을때는 상관관계를 사용한다. 
#이때 산점도를 사용한다. 


#상관분석  #두변수간의 관계를 파악하고 상관관계가 강한지 약한지부터 파악해야한다. 만약에 강하다면 회귀선을 만든다. 
beers <- c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers,bal)
tbl

plot(bal~beers, data= tbl)          #산전도

#수치적으로 상관관계가 강하냐 약하냐 --> 상관계수
#-1<= r<= 1 에서 0.5 이상이거나 이하일때 양, 또는 음의 상관관계가높다고 한다. 

res <- lm(bal~beers,data=tbl)       # 회귀식. y= xw+b  ////      y= 종속변수///x는 독립변수 ///w는 weight///b는 bias 이식은 회귀선을 찾는게 목적이다. 
#lm 이라는 함수가 weight 값과 bias를 주어진다. 

res


abline(res)                     #회귀선. 

cor(tbl[,1:2])                 # 이변량상관계수. 
cor(iris[, 1:4])               #다변량 상관계수



# 상관분석 순서
# 1.상관분석 대상 변수선정
# 2.산점도 작성(관측값 분포 확인):plot()
# 3.회귀식 도출: lm()
# (회귀식: 두 변수의 선형관계를 가장 잘 나타낼 수 있는 선의 식)
# (y= xw+b)
# 4.회귀선을 선점도에 표시 :abline()
# (회귀선: 관측값들의 추세를 가장 잘 나타낼 수 있는 선)
# 5.상관계수 계산:cor()
# 6.상관분석 결과 해석.


#
#시계열
month <- 1:10

late <- c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,late,main = '지각생 통계',
     type='l',lty=1,lwd=1,
     xlab='Month',ylab='late cnt')

plot(month,late,main = '지각생 통계',
     type='b',lty=1,lwd=1,
     xlab='Month',ylab='late cnt')

plot(month,late,main = '지각생 통계',
     type='o',lty=1,lwd=1,
     xlab='Month',ylab='late cnt')

plot(month,late,main = '지각생 통계',
     type='s',lty=1,lwd=1,
     xlab='Month',ylab='late cnt')

#각각의 타입을 바꾸어서 선그래프를 만들어 보았다. 
#lwd== 선의 두깨
#lty== 선의 모양
#type== 그래프의 유형
#x축에 시간정보가 들어가는게 시계열 데이터이다. 



#복수의 선 그래프
late1 <- c(5,8,7,9,4,6,12,13,8,6)

late2 <- c(4,6,5,8,7,8,10,11,6,5)

plot(month,late1,main = '지각생 통계',
     type='b',lty=1,col='red',
     xlab='Month', ylab='late cnt', ylim=c( 1, 15 ) )

lines(month,late2,type='b', col='blue')

# 
# 
# 자료 탐색 실습= 탐색적 데이터분석. 
# 
# 0단계:문제 정의
# 1단계: 분석 대상 데이터셋 준비
# 
# BostonHousing 데이터셋 (mlbench pac)

install.packages('mlbench')
library(mlbench)
data('BostonHousing')
myds <- BostonHousing[ , c('crim','rm','dis','tax','medv')]

#crim :1인당 범죄율.
#rm:주택 1가구당 방수
#dis 보스턴 5개 지역센터까지의 거리
# tax: 재산세율
# medv:주택가격


#데이터셋 준비/
class(BostonHousing)
dim(BostonHousing)
str(BostonHousing)
head(BostonHousing)
tail(BostonHousing)
myds <- BostonHousing[ , c('crim','rm','dis','tax','medv')]
myds

#2단계.#파생변수 추가: grp변수 추가(주택가격상중하)
grp <- c()
for(i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i] <- 'H'
  }else if (myds$medv[i]<=17.0){
    grp[i] <- 'L'
  }else{
    grp[i] <- 'M'
  }
}
print(grp)
table(grp)


grp <-  factor(grp)
grp <- factor(grp,levels = c('H','M','L'))
myds <- data.frame(myds,grp)
head(myds)
#없는 변수를 추가해 넣었습니다. 



#3단계: 데이터셋의 형태와 기본적인 내용 파악. 

str(myds)
head(myds)
table(myds$grp)


#4단계: 히스토그램에 의한 관측값의 분포 화인
par(mfrow=c(2,3))
for(i in 1:5){
  hist(myds[ , i],
       main = colnames(myds)[i],
       col = 'yellow')
}

par(mfrow=c(1,1))

#이걸 해줘야 분할한 화면을 다시 하나로 사용가능. 




#5단계: 상자그림에 의한 관측 값의 분포 확인

par(mfrow=c(2,3))
for(i in 1:5){
  boxplot(myds[ , i],
       main = colnames(myds)[i])
      
}


#상자그림을 통해서 분포를 확인하고 이상치가 있는지 확인한다. 

par(mfrow=c(1,1))



#6단계: 그룹별 관측값 분포
boxplot(myds$crim~myds$grp,
        main= '1인당 범죄율')

boxplot(myds$rm~myds$grp,
        main= '방의개수')


#7단계 : 다중 산점도를 통한 변수 간상관 관계 확인. 
pairs(myds[,-6])


#8단계:그룹 정보를 포함한 변수간 상관 관계 확인
point <- as.integer(myds$grp)
color <- c('red','green','blue')
pairs(myds[,-6],pch= point,
      col= color[point])

#9단계: 변수 간 상관계수 확인.
 cor(myds[,-6])

 # 
 # #탐색적 데이터 분석은 Data를 이해하는데 목적을 두고있다. 
 # 1.Data set에 대한 이해
 # 2.문제 정의 검증
 # 3.문제 정의에 대한 1차 결과 파악. 
 # 
