





#문.1
#>score
#m  f
#[1,] 10 21
#[2,] 40 60
#[3,] 60 70
#[4,] 20 30


#1.위와 같은 내용의 matrix score를 생성

matrix(c(10,40,60,20,21,60,70,30),nrow = 4,ncol = 2)


#2. score의 열 이름을 각각 male, female로 바꾸시오

score <- matrix(c(10,40,60,20,21,60,70,30),nrow = 4,ncol = 2)

colnames(score) <- c('male','female')

score


#3. 2행에 있는 모든 값을 출력


score[2,]



#4. female의 모든 값을 출력


score[ , 2]


#  5. 3행 2열의 값을 출력
score[3,2]




#문2.

#R에서 제공하는 state.x77 데이터셋을 이용하여 작성



#1. state.x77을 변환하여 st에 data frame으로 작성


st <- data.frame(state.x77)


# 2. st의 내용을 출력


st


# 3. st의 열 이름 출력

rownames(st)


#4. st의 행 이름 출력
colnames(st)



#5. st의 행의 개수와 열의 개수 출력
dim(st)


#6. st의 요약 정보 출력


str(st)


#7. st의 행별 합계와 평균 출력


apply(st[ , ],1,sum)
apply(st[,],1,mean)

rowSums(st[,1:8])
rowMeans(st[,1:8])

#8. st의 열별 합계와 평균 출력 



apply(st[ , ],2,sum)
apply(st[,],2,mean)


colSums(st[,1:8])
colMeans(st[,1:8])



#9. Florida 주의 모든 정보 출력

st1 <- subset(state.x77, Population == 8277)
st1


#10. 50개 주의 수입(Income) 정보만 출력

st1 <- data.frame(state.x77)
st1
st1[ , c('Income')]



#11. Texas 주의 면적(Area)을 출력

st1 <- data.frame(state.x77)
st1
st1['Texas','Area']



#12. Ohio 주의 인구(Population)와 수입(Income) 출력

st1 <- data.frame(state.x77)

st1['Ohio',c('Population','Income')]


#13. 인구가 5,000 이상인 주의 데이터만 출력
st1 <- data.frame(state.x77)


st1 <- subset(st1, Population >5000)
st1




#14. 수입이 4,500 이상인 주의 인구, 수입, 면적을 출

st1 <- data.frame(state.x77)
st1 <- subset(st1,Income >4500)
st1[,c('Income','Population','Area')]


#15. 수입이 4,500 이상인 주는 몇 개인지 출력
st1 <- data.frame(state.x77)


st1 <- subset(st1,Income >4500)
nrow(st1)



#16. 전체 면적(Area)이 100,000 이상이고, TE결빙일수(Frost)가 120 이상인 주의 정보 출력
st1 <- data.frame(state.x77)
st1 <- subset(st1, Area>100000&Frost>120)

st1



#17. 인구(Population)가 2,000 미만이고, 범죄율(Murder)이 12미만인 주의 정보 출력
st1 <- data.frame(state.x77)
st1 <- subset(st1, Population<2000 & Murder<12)

st1



#18. 문맹률(Illiteracy)이 2.0 이상인 주의 평균 수입은 얼마인지 출력
st1 <- data.frame(state.x77)
 subset(st1, Illiteracy>=2.0)

mean(st1$Income)
#19.문맹률(Illiteracy)이 2.0 미만인 주와 2.0 이상인 주의 평균 수입의 차이 출력
 
 st1 <- data.frame(state.x77)
 st2 <- subset(st1,Illiteracy<2.0)
 st3 <- subset(st1,Illiteracy>=2.0)
 
mean(st2$Income)-mean(st3$Income)
  
#  20. 기대수명(Life Exp)이 가장 높은 주는 어디인지 출력

st1 <- data.frame(state.x77)
st1
max(st1$Life.Exp)
st2 <- subset(st1,Life.Exp==73.6)
st2
rownames(st2)
#  21 Pennsylvania 주보다 수입(Income)이 높은 주들 출력

st1 <- data.frame(state.x77)
st1
st2<- st1['Pennsylvania',]
st2
st2 <- subset(st,Income>st2$Incom)
nrow(st2)
st2
rownames(st2)





#  
#  문3)
# R에서 제공하는 mtcars 데이터셋은 자동차 모델에 대한 제원 정보를 담고 있다.
# 1. 이 데이터셋의 자료구조 출력
mtcars
mt <- data.frame(mtcars)

class(mt)
class(mtcars)
# 2. 이 데이터셋의 행의 개수와 열의 개수 출력
dim(mtcars)

# 3. 이 데이터셋 열들의 자료형 출력
str(mt)

# 4. 연비(mpg)가 가장 좋은 자동차 모델 출력
mt1 <- mt$mpg
max(mt1)
mt2 <- subset(mt,mpg==33.9)
rownames(mt2)

# 5. gear가 4인 자동차 모델 중 연비가 가장 낮은 모델 출력
mt1 <- subset(mt, gear==4)
mt2 <- mt1$mpg
min(mt2)
mt2 <- subset(mt1,mpg==17.80)
rownames(mt2)

# 6. Honda Civic의 연비(mpg)와 gear 수 출력
mt1 <- mt['Honda Civic',]

mt1[,c('mpg','gear')]



# 7. Pontiac Firebird 보다 연비가 좋은 자동차 모델 출력


mt1 <- mt['Pontiac Firebird',]
mt2<- mt1[,c('mpg')]
mt2
mt3 <- subset(mt,mpg>mt2)
rownames(mt3)

# 8. 자동차 모델들의 평균 연비 출력
mt1 <- mt$mpg
mean(mt1)


# 9. gear의 수 종류 출력
unique(mt[,'gear'])


# 
# 문4)
# R에서 제공하는 airquality 데이터셋은 일별로 대기의 질을 측정한 정보를 담고 있다.
# 
# 1. 이 데이터셋의 자료구조 출력
ai33 <- airquality

class(ai33)

class(airquality)

# 2. 이 데이터셋의 앞쪽 일부분 내용만 출력


ai <- data.frame(airquality)


head(ai)



# 3. 기온(Temp)이 가장 높은 날은 언제인지 월(Month)과 일(Day) 출력

ai1 <- ai[, 'Temp']
ai2 <- max(ai1)
ai3 <- subset(ai,Temp==ai2)
ai3[,c('Month','Day')]


# 4. 6월달에 발생한 가장 강한 바람(Wind)의 세기 출력

ai1 <- subset(ai, Month == '6') 
ai1
ai2 <- ai1[, 'Wind']
ai2
max(ai2)


# 5. 7월 달의 평균 기온(Temp) 출력
ai1 <- subset(ai,Month=='7')
ai1
ai2 <- ai1[, 'Temp']
ai2
mean(ai2)




# 6. 오존(Ozone) 농도가 100을 넘는 날은 며칠이나 되는지 출력

ai1 <- subset(ai,Ozone>100)
ai1

nrow(ai1)




# 
# 문5)
# 1. R에서 제공하는 state.x77 데이터셋에서 수입(Income)이 5,000 이상인 주의 데이터에서
# 수입(Income), 인구(Population), 면적(Area) 열의 값들만 추출하여 rich_state.csv에 저장


st1 <- data.frame(state.x77)
st2 <- subset(st1, Income>5000)
rich_state <- st2[ , c('Income','Population','Area')]


setwd('D:/workR2/excel')
write.csv(rich_state, 'rich_state.csv', row.names=T)







# 2. 1.에서 만든 rich_state.csv파일을 읽어서 ds 변수에 저장한 후 ds 내용 출력


setwd('D:/workR2/excel')
ds <- read.csv('rich_state.csv',header = T)

ds
















