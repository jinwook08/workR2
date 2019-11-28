##
## mylib.R
##
##이런게 나중에 package가 된다. 이게 바로 라이브러리 파일이다. 이런 
#라이브러리만 넣어 논다. 

##
##사용자 정의함수
##최대값 찾기.

my_max <- function(x,y){
  num.max <- x
  if (y>num.max){
    num.max <- y
  }
  return(num.max)
}





#사용자 정의 함수 매개변수 초기값 설정
my_div <- function(x,y=2){   #y의 초기값이 주어지지 않으면 2로 설정
  result <- x/y               #초기값은 반드시 뒤에 값을 지정해야한다.
  
  return(result)
}









