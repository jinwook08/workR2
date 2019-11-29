#차진욱  
#2019.11.28/2019.11.29

#문제1. d1 <- 1:50 ; d2 <- 51:100

d1 <- 1:50
d2 <- 51:100

#1.d1, d2값 출력

print(d1)
print(d2)

#d2 길이 출력
length(d2)

#d1 + d2, d2 - d1, d1 * d2, d2 / d1의 결과 출력

d1+d2

d2-d1

d2/d1

#d1, d2 각각의 합 출력
sum(d1)
sum(d2)

#d1, d2의 모든 값들의 합 출력


d3 <- NULL
d3 <- d1+d2
sum(d3)

#d2 최대값, 최소값 출력
max(d2)
min(d2)

#d2, d1의 각각의 평균값을 구한 후 평균과의 차이 출력

mean(d2)
mean(d1)
m <- mean(d2)
m1 <- mean(d1)

m-m1

#d1 내림차순으로 정렬해서 출력

sort(d1,decreasing = TRUE)


#d1, d2  오름차순으로 정렬 후 각 10개씩을 추출하여 d3에 저장

so <- sort(d1,decreasing = FALSE)
so2 <- sort(d2, decreasing = FALSE)

head(so,10)
head(so2,10)
a <- head(so,10)
b <- head(so2,10)
union (a,b)




###############문제2번########################
#v1 <- 51:90
#60보다 작은 수 모두 출력

v1 <- 51:90
print(v1)

for (i in v1){
  if(i>59)
    break
    print(i)
}








#70보다 작은 수가 몇 개인지 출력
cnt <- 0
for (i in v1){
  cnt <- cnt+1
  if(i>69)
    break
    print(i)
}
print(cnt)

sum(v1<70)

#65보다 큰 수들의 합 출력

sum(v1[v1>65])


# 60보다 크고 73보다 작은 수를 출력


for (i in v1){
  if(i>60 & i<73)
  
  print(i)
}



#65보다 작거나 80보다 큰 수를 모두 출력

for (i in v1){
  if(i<65 | i>80)
    print(i)
}


#7로 나누었을때 나머지가 3인 수를 모두 출력

for (i in v1){
  if(i %% 7 == 3)
    print(i)
}



#7의 배수들의 값을 0으로 변경
for ( i in v1){
  if(i %% 7 == 0)
    i <- 0
     print(i)
}

# 짝수를 모두 합한 값을 출력
s <- 0
for (i in v1){
  if(i %% 2 == 0)
   s= s+ i
}

print(s)


#홀수이거나 80보다 큰 수를 모두 출력

for ( i in v1){
  if (i %% 2 == 1 | i>80)
    print(i)
}
v1 <- 51:90

# 3과 5의 공배수 출력

for(i in v1){
  if(i %% 3== 0)
    if(i %% 5 ==0)
      print(i)
}


#짝수에 대해서만 2를 곱해서 저장

v1[v1%%2==0]*2

#7의 배수들을 제거한 후 v1 내용 출력 

for (i in v1){
  if(i %% 7== 0){
    next
    
  }
  print(i)
}


