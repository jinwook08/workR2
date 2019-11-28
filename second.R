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

