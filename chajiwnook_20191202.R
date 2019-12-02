# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
# 
# 문1) 
# 어떤 학급의 성별이 다음과 같을 때 주어진 문제를 해결하기 위한 R 코드를 작성하시오.
# 
# F F F M M F F F M M
# 
gender <- c('F' ,'F' ,'F' ,'M' ,'M' ,'F', 'F' ,'F', 'M' ,'M')





# 1. 위의 자료를 gender 벡터에 저장하시오.
gender <- c('F' ,'F' ,'F' ,'M' ,'M' ,'F', 'F' ,'F', 'M' ,'M')

gender
# 2. gender에 있는 값들에 대해 도수분포표를 작성하여 출력하시오.
ge2 <- table(gender)
ge2

# 3. gender에 있는 값들에 대해 막대그래프를 작성하여 출력하시오.
barplot(ge2,main = 'gender')
# 4. gender에 있는 값들에 대해 원그래프를 작성하여 출력하시오.
pie(ge2,main='gender')

# 문2)
# 좋아하는 계절에 대한 조사 결과가 다음과 같을 때 주어진 문제를 해결하기 위한 R 코드를 작성하시오.
# 여름 겨울 봄 가을 여름 가을 겨울 여름 여름 가을
# 
# 1. 위의 자료를 season 벡터에 저장하시오.

season <- c('여름', '겨울', '봄', '가을', '여름', '가을', '겨울', '여름', '여름', '가을')
season
# 2. season에 있는 값들에 대해 도수분포표를 작성하여 출력하시오.
ss <- table(season)
ss
# 3. season에 있는 값들에 대해 막대그래프를 작성하여 출력하시오.
barplot(ss,main = 'season')
# 4. season에 있는 값들에 대해 원그래프를 작성하여 출력하시오.
pie(ss,main = 'season')
# 
# 문3)
# 학생 A의 과목별 성적이 다음과 같을 때 각 문제를 해결하기 위한 R 코드를 작성하시오.
# 
# KOR ENG ATH HIST SOC MUSIC BIO EARTH PHY ART
# 90 	85 	73 	80 	 85  65    78  50    68  96
# 
# 1. 위 데이터를 score 벡터에 저장하시오(과목명은 데이터 이름으로 저장).
score <- c(90,85,73,80,85,65,78,50,68,96)
names(score) <-  c('KOR','ENG','ATH','HIST','SOC','MUSIC','BIO','EARTH','PHY','ART')
score
# 2. score 벡터의 내용을 출력하시오.
socre
# 3. 전체 성적의 평균과 중앙값을 각각 구하시오.
mean(score)
median(score)
# 4. 전체 성적의 표준편차를 출력하시오.
sd(score)
# 5. 가장 성적이 높은 과목의 이름을 출력하시오.
s2 <- max(score)

s3<- subset(score,s2==score)
names(s3)


# 6. 성적에 대한 상자그림을 작성하고, 이상치에 해당하는 과목이 있으면 출력하시오.
boxplot(score,main='성적')
boxplot(score)$out   #이상치(특이값) 목록

# 7. 다음 조건을 만족하는 위 성적에 대한 히스토그램을 작성하시오.
# (그래프 제목: 학생 성적, 막대의 색: 보라색)
str(score)

hist(score,main = '학생성적',col='purple')



# 문4)
# R에서 제공하는 mtcars 데이터셋에 대해 다음 문제를 해결하기 위한 R코드를 작성하시오.
# 
# 1. 중량(wt)의 평균값, 중앙값, 절사평균값(절사범위: 15%), 표준편차를 각각 구하시오.
mt <- mtcars[,"wt"]
mtcars
mean(mt)
median(mt)
mean(mt,trim=0.15)
sd(mt)
# 2. 중량(wt)에 대해 summary( ) 함수의 적용 결과를 출력하시오.
summary(mt,)

# 3. 실린더수(cyl)에 대해 도수분포표를 출력하시오.
cy <- mtcars[,'cyl']
cy
table(cy)
# 4. 앞에서 구한 도수분포표를 막대그래프로 출력하시오.
barplot(cy)
# 5. 중량(wt)의 히스토그램을 출력하시오.
hist(mt, main='중량')
# 6. 중량(wt)에 대해 상자그림을 출력하시오.(단, 상자그림으로부터 관찰할 수 있는정보를 함께 출력하시오.)
boxplot(cy, main= '중량')
boxplot(cy)$stats #정상범위 사분위수
boxplot(cy)$n     #관측치 개수
boxplot(cy)$conf  #중앙값 신뢰구간
boxplot(cy)$out   #이상치(특이값) 목록

# 7. 배기량(disp)에 대한 상자그림을 출력하시오.(단, 상자그림으로부터 관찰할 수 있는 정보를 함께 출력하시오.)
mt21 <- mtcars[,'disp']
mt21
boxplot(mt21,main='배기량')
boxplot(mt21)$stats #정상범위 사분위수
boxplot(mt21)$n     #관측치 개수
boxplot(mt21)$conf  #중앙값 신뢰구간
boxplot(mt21)$out   #이상치(특이값) 목록
# 8. 기어수(gear)를 그룹 정보로 하여 연비(mpg) 자료에 대해 상자그림을 작성작성하고,
# 각 그룹의 상자그림을 비교하여 관찰할 수 있는 것이 무엇인지 나타내시오.


boxplot(mpg~gear,
        data=mtcars,
        main='기어와 연비 비교')
# 기어가 3단일때 분포의 범위가 작음을 알 수 있다. 
#기어의 중간값은 약 15정도로 4,5와 비교했을때 비교적으로 좋음을 알 수 있다. 
#기어가 4단일대 연비의 중간값이 약23정도로 3단과 4단을 비교해 보았을때 값이 매우 높을것을 볼 수 있다. 
#기어가 5단일때 분포의 범위가 가장 큰것을 보아 연비의 차이가 많이 나는것을 알 수 있다. 
#그러나 중간값을 기어가 4단일때 보다 더 좋은것을 볼 수 있다. 
#이처럼 자동차의 연비는 기어가 높다고 무조건 높기만한것은 아니다. 
