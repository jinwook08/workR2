#Data Frame 생성

city <-  c('seoul','Tokyo','Washingtpn')
rank <- c(1,3,2)
city.info <- data.frame(city,rank)
city.info

name <- c('Hong','Kim','Lee')
age <- c(22,20,25)
gender = factor(c('M','F','M'))
blood.type = factor(c('A','B','O'))
person.info <- data.frame(name,age,gender,blood.type)
person.info




person2.info <- data.frame(name = c('Hong','Kim','Lee'),
                           age <- c(22,20,25),
                           gender = factor(c('M','F','M')),
                           blood.type = factor(c('A','B','O')))
person2.info                   #factor 타입.

                           




#data frame 요소접근방법

city.info[1,1]
city.info[1,]
city.info[,1]
city.info[city.info$city,]
city.info[ , 'rank']

person.info$name
person.info[ person.info$name == 'Hong',]
person.info[ person.info$name == 'Hong', c('name','age')]


data()    #data set 연습하라고 만들어놓음

iris

iris[ , c(1:2)]
iris[ , c(1,3,5)]
iris[ , c('Sepal.Length','species')]
iris[1:5, ]
iris[1:5, c(1,3)]



#Matrix와 Data Frame에서 사용하는 함수

dim(person.info)
nrow(person.info)
nrow(m3)
ncol(person.info)
ncol(m3)
head(iris)
tail(iris)
str(iris)                #데이터 셋에 들어가는 행과 열을을 알아낼수있다. 
str(city.info)
str(person.info)
iris[,5]
unique(iris[,5])                 #중복된 데이터를 하나씩 뽑아서 벡터형으로 나열해라. 
table(iris[,'Species'])
table(person.info[ , 'blood.type'])   #종류별 카운터를 해줌.팩터일때만. 
tabel(persin.info[ , 'age'])          #factor가 아니라서 찾지 못한다. 


#data frame은 변수 중심으로 진행이 된다.   

dim(iris)    # 150 5 즉 변수(열)가 150개 관측치(행)가 5개 




#matrix/Data Frame 사용함수
#행별/ 열 별 합계와 평균 계산
colSums(iris[, -5])     #변수의 합계만 구하겠다. 
apply( iris[ , 1:4 ], 2, sum)     #1.행 2.방향 1은 행방향2는 열방향 3.동작 //
colMeans(iris[, -5])         #변수의 평균만 구하겠다. 
apply( iris[ , 1:4 ], 2, mean)
rowSums(iris[, -5])             #행의 합계만 구해라
apply( iris[ , -5 ], 1, sum)     
rowMeans(iris[, -5])
apply( iris[ , -5 ], 1, mean)
apply(iris[,-5],2,median)        #중앙값을 구해라. 



#행/열 방향 전환
z <- matrix(1:20, nrow=4, ncol= 5)
z
t(z)

#조건에 맞는 행과 열의 값 추출(DATA FRAME만 가능)
IR.1 <- subset( iris, Species == 'setosa')
IR.1
IR.2 <- subset(iris, Sepal.Length> 5.0 &Sepal.Width >4.0)
IR.2
IR.2[ , c(2,4)]




#Matrix/ Data Frame 산술연산
a <- matrix(1:20,4,5)
a
b <- matrix(21:40,4,5)
b

2*a    #해당셀에 전부 2를 곱해라
b-5         #해당셀에 전부 5를빼라 
2*a +3*b        #각 해당셀에 대하여 연산을 실행하고 더해라

a+b                  
b-a
b/a
a*b



#### Matrix /Data Frame 자료구조 확인/ 변환
class(iris)                   #data frame인지 matrix 인지 구분
str(iris)
str(state.x77)
class(state.x77)
#논리 값으로 판별
is.matrix(iris)
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

st <- data.frame(state.x77)
str(st)
head(st)
class(st)
dim(st)


iris.m <- as.matrix(iris[ , 1:4])             #데이터 프레임을 매트릭스로 변환할때 쓴다. 
head(iris.m)
class(iris.m)
str(iris.m)

#행하나 전체가 관측치이다. 











