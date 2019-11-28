##
##break/next
##

sum <- 0
for (i in 1:10){
  sum <-  sum + i
  if(i>=5){
    break
  }
}
print(sum)
#####반복을 5번만 진행한다. #############  break 빠져나가라 ####

sum <- 0
for (i in 1 :10){
  if (i %% 2== 0){
    next
  }
  sum <- sum+i
}

print(sum)

1+3+5+7+9
###################짝수만 건너뛰어라#################



##
##산술 내장 함수
##

log(10)+5                              #로그함수 # 로그함수를 실행한 결과에다가 5를 더해라 
log(10,base = 2)                      
sqrt(25)                                #제곱근
max(5,3,2)                              #최댓값
min(3,9,5)                              #최솟값
abs(-10)                                     #절대값
factorial(5)                            #팩토리얼
sin(pi/2)                               #삼각함수



sin(1/sqrt(2))






##
##사용자 정의함수
##

mymax <- function(x,y){
  num.max <- x
  if (y>num.max){
    num.max <- y
  }
  return(num.max)
}
mymax(118,15)
a <- 10
b <- 5
c <- 8
max <- mymax(a,b)              #a,b를 max에다가 정의한다. 
max <- mymax(max,c)             #max와 c를 비교해서 정의한다. 
max








#사용자 정의 함수 매개변수 초기값 설정
mydiv <- function(x,y=2){   #y의 초기값이 주어지지 않으면 2로 설정
  result <- x/y
  
  return(result)
}

mydiv(x=10,y=10)
mydiv(10,3)
mydiv(10)


#외부 파일에 있는 함수 호출
setwd('D:/workR')             #경로지정
source('mylib.R')

my_max(10,5)
my_div(10,2)



##
## vector 도입
##
a <- 10
b <- 5
c <- 8                            #scalar
max <- a
if(b > max){max <- b}
if(c > max){max <- c}
max


v <- c(10,5,8)
max <- v[1]
for (i in 2:length(v) ){
  if(v[i]>max){
    max <- v[i]
    
  }
}

max
v <- c(133,5,2228)
print(max(v))




a <- 10
b <- 5
c <- 8                          #scalar
d <- 1
e <- 2
f <- 3
g <- 4
h <- 5
i <- 102
j <- 7

max <- e
if(b > max){max <- b}
if(c > max){max <- c}
if(d > max){max <- d}
if(a > max){max <- a}
if(f > max){max <- f}
if(g > max){max <- g}
if(h > max){max <- h}
if(i > max){max <- i}
if(j > max){max <- j}


max





v <- c(10,5,8,2,3,4,5,6,7,8,9,0,11,2232)
max <- v[1]
for (i in 2:length(v) ){
  if(v[i]>max){
    max <- v[i]
    
  }
}

max


#vector 생성
ㄸ

x <- c(1,2,3)
y <- c('a','b','c')
z <- c(TRUE,TRUE,FALSE,TRUE)
x
y
z
class(x)
class(y)
class(z)


w <- c(1,2,3,'a','b','c')


w
class(w)


p <- c(1,2,3,TRUE,TRUE,FALSE)

p
class(P)



#벡터를 생성하는 방
v1 <- 50:90
v1
v2 <- c(1,2,3,50:90)
v2

length(v1)
class(v1)
class(v2)


v3 <- seq(1, 101,3)     #1부터 101까지 3칸씩 건너서 
v3
v4 <- seq(0.1,1.0,0.1)     #0.1부터 1.0까지 3칸씩 건너서
v4
v5 <- rep(1,times = 5)          #1을 5번 반복
v5
v6 <- rep(1:5, times= 3)          #1부터 5까지 3번 반복
v6
v7 <- rep(c(1,5,9), times=3)         #벡터를 3번 반복
v7


#벡터 원소값에 이름 저장

score <-c(90,85,70)
score
names(score)
names(score) <- c('Cha','Kim','Lee')
names(score)
score


#벡터 원소 접근
score[1]
score[2]
score[3]
score['Lee']
score['Kim']
score['Cha']


d <-c(1,4,3,7,8)
d[1]
d[2]
d[3]
d[4]
d[5]
d[6]

names(d)
names(d) <- c('chah','adsd','ddsd','wwwk')
names(d)
d

d[1]
d[2]
d[3]



for (i in 1:length(score)){
  print(score[i])
}

score_names <- c('Cha','Kim','Lee')
for( i in 1:length(score)){
  print(score[score_names[i]])
}


#벡터에서 여러 개의 값을 한번에 추출

d <- c(1,4,3,7,8)
d[c(1,3,5)]    #1번 3번 5번 인덱스 값을 표현해라
d[1:3]             #1번부터 3번 인덱스 까지 
d[seq(1,5,2)]        #1번부터 5번인덱스 까지 
d[-2]                #2번인덱만 제외시켜라 
d[-c(3:5)]             #3번부터 5번 인덱스를 제외시켜라




GNP <- c(2090,2450,960)
GNP
names(GNP) <- c('kor','jap','nepal')
GNP
GNP[1]
GNP['kor']
GNP[c('kor','nepal')]



#벡터의 내용(요소)값 변경\

v1 <- c(1,5,7,8,9)
v1
v1[2] <- 3
v1
v1[c(1,5)] <- c(10,20)
v1


#벡터간 연산

x <- c(1,2,3)
y <- c(4,5)
x + y
x * y
z <- x +y
z


#벡터에 적용 가능한 함수

d <-  c(1,2,3,4,5,6,7,8,9,10)   
sum(d)                          #합계
sum(2*d)                        #곱
length(d)                       #벡터의 요소 개수(길이) 
mean(d[1:5])                    #평균 
mean(d)                           
median(d[1:5])                  #중앙값 
median(d)
max(d)                          #최대값 
min(d)                          #최소값 
sort(d)                         #정렬 
sort(d,decreasing = FALSE )     #오름차순
sort(d,decreasing = TRUE)       #내림차순
range(d)                        #값의 범위(최소값~최대값) 
var(d)                          #분산 
sd(d)                           #표준편차


#page 129쪽 참고/.


#벡터에 논리연산 적용
d>=5
d[d>5]
sum(d>5)     #개수를 구한거 5보다 큰숫자
sum(d[d>5])     #합계를 구한거임
d ==5            #5와 같은것의 위치를 파악해라

cond <- d>5 &d<8 #d가 5보다 크고 8보다 작은 6과 7이 TRUE가 된다. 
cond
d[cond]

all(d>5)          #벡터 전체가 5보다 큰가? 
any(d>5)          #벡터 중에서 5보다 큰게 하나라도 있는가?


head(d)                #앞에서 6개만  -->defalt 값
tail(d)                 #뒤에서 6개만-->defalt 값
head(d,3)                  #앞에서 3개만
tail(d,3)                        #뒤에서 3개만









x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

w <- c(x,y)
w
union(x,y)          #합집합
intersect(x,y)       #교집합  
setdiff(x,y)          #차집합 
setequal(x,y)           #x,y에 동일한 요소가 있는지 확인. 
setequal(x,z)             #숫자가 모두 포함 되어 있어야
                                #TRUE 순서는 상관 XX




#리스트 사용하기/ 

ds <-  c(90,85,70,84)
my.info <- list(name = 'CHA',age = 26, statu= TRUE, 
                score= ds)   #my.info는 리스트

my.info                       #key는 name,age,status,score
my.info[1]                    #value는 CHA, 26 TRUE ds
my.info[[1]]                  #여러가지 자료형도 가능하다
my.info$name
my.info[[4]]
my.info[[4]][1]
my.info[[4]][1:2]

#my.info[1]를 사용하면 my.info에서 전체값 즉 key와 value의 값 전체를 가져온다. 
#그러나 my.info[[1]] 를 사용한다면 value의 값만 나오는것을 알 수 있다. 
#my.info$name를 이용해서 지정값만 불러온다. 
#my.info[[4]] 벡터 전체의 내용이 전부 나온다. 
#my.info[[4]][1]벡터의 전체 내용중에 1번 인덱스만 불러온다. 
#my.info[[4]][1:2]를 이용해서 특정부분 인덱스만을 선택이 가능하다.







#FACTOR형


bt <- c('A','B','B','O','AB','A')    
bt.new <- factor(bt)                        
bt                                     #벡터
bt.new                                 #팩터형 벡터
bt[5]
bt.new[5]
levels(bt.new)
as.integer(bt.new)
bt.new[7] <- 'B'
bt.new[8] <- 'C'
bt.new


#levels는 저 값의 숫자만 넣어줘야한다는거임. 
#팩터형은 항상 범위가 나온다. 
#levels(bt.new)의 범위값을 보고 싶을때 나오는 함수. 
#에러가 나오는 이유는 팩터의 범위 밖임으로 invalid factor level, NA generated
#와 같은 형태의 에러가 나온다. 
#as.integer(bt.new)에서 얻은 levels 데이터 값의 순서대로 1,2,3,4의 정수 값을 가지는데 
#이를 이용하여 bt.new의 값들을 전부 정수형으로 바꾸어준다. 




