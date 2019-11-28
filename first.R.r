#
# R 프로그래밍 1일차 
#
#first.R
#
#작성자:jinwook 
#
#최초작성일:2019.11.26
#
#
print("Hello, World!!")

number <- 10 
number2 = 100
number3 <- number

numberValue <- 1                  #camel 표기법
str_value <- "R Language"         #snake 표기법 
booleanvalue <- TRUE

numberValue <- "R script"
numberValue <- 1

print(numberValue)
print(str_value)
print(booleanvalue)

#print와 cat은 읽기 기능입니다. 

cat("Numeric number:", numberValue,"\n" )
cat("string:", str_value,"\n")
cat("Boolean value:", booleanvalue,"\n")


numberValue <- scan()      #input기능입니다.//쓰기 기능입니다.  
cat("Numeric number:", numberValue,"\n" )


number1 <- 10
number2 <- 20
resultAdd <- number1 + number2  #더하기 입니다.
resultSub <- number1 - number2  #빼기 입니다. 
resultMul <- number1 * number2  #곱 입니다. 
resultDiv <- number1 / number2  # 나누기 입니다. 
resultRem <- number2 %% number1  #나머지 입니다. 
resultSec <- number2 ^ 5         #제곱근 입니다. 
resultSec2 <-number2 **5
print(resultAdd)
print(resultSub)
print(resultMul)
print(resultDiv)
print(resultRem)
print(resultSec)
print(resultSec2)




number1 <- 0
number1 <- number1 +10
number1
#

number1 <- 0
number1 <- number1 +10
number1
number1 <- 0
number1 <- number1 +10
number1

number1 <- 0
number1 <- number1 +10
number1

number1 <- 0
number1 <- number1 +10
number1
number1 <- number1 +10
number1
number1 <- number1 +10
number1

number1 <- 0
number1 <- number1 +10
number1
number1 <- number1 +10
number1
number1 <- number1 +10
number1
number1 <- number1 +10
number1
number1 <- number1 +10
number1
number1 <- number1 +10
number1


number2 <-100
number1 <- number2 +10
number1
number2

print(number1 + 10 * number2 /2)

print((umber1 + 10)* number2 /2)


number300 <- 10
number300 <- number300 + 10
number300


number301 <-  number300 *2
number301


number1 <- 10.5
number2 <- 10
print(number1 > number2)
print(number1 >= number2)
print(number1 < number2)
print(number1 >= number2)
print(number1 == number2)
print(number1 != number2)

print(number1 > 10 & number2 >10)         #AND
print(number1 > 10 | number2 > 10)        #OR
print(!(number1 > 10))                     #NOT


number <- 100 
str <- "R Language"
result = number + str 
print(result)



number <- "100" 
str <- "R Language"
result = number + str 
print(result)


#제어구조 -선택구조

job.type <- 'A'        #A라는 문자 저장

#
if (job.type == 'B'){              
  bonus <- 200
}else{
  bonus <- 100
}
cat('joy type :', job.type, "\t\tbonus:",bonus)



###############################################

job.type <- 'B'

if (job.type == 'A'){
  bonus <- 200
}
cat("joy type :", job.type, "\t\tbonus :", bonus)




score <- 85

if (score >= 90){
  grade <- 'A'
} else if (score >= 80){
  grade <- 'B'
}else if (score>=70){
  grade <- 'C'
}else if (score>=60){
  grade <- 'D'
}else{
  grade <- 'F'    
}
cat("score:",score,"\t\tgrade:",grade)





number <- 29

if (number %% 2 == 0){
  num <- '짝수입니다.'
}else {
  num <- '홀수입니다.'
}

cat("number:",number,"는",num)





a <- 10 
b <- 20
if (a> 5& b>5){
  cat(a,">5 and ", b, ">5")
}else{
  cat(a, "<=5 or ", b, "<= 5")
}




a <- 4
b <- 20
if (a> 5& b>5){
  cat(a,">5 and ", b, ">5")
}else{
  cat(a, "<=5 or ", b, "<= 5")
}



a <- 10
b <- 20

if (a>b){
  c <- a
}else{
  c <- b
}
cat("a= ", a, "\tb= ",b,"\tc=",c)


c <- ifelse(a>b,a,b)
cat("a= ", a, "\tb= ",b,"\tc=",c)

help(ifelse)


x <- c(6:-4)
print(x)

#맥스값 구하기/. 

a <- 900
b <- 102
c <- 242
max <-a
  
if (b>max){
  max <- b
}
if(c>max){
  max <- c
}
cat("a=",a,"b=",b,"c=",c,"max=",max)

###################################
#반복구조

for (i in 1:10){
  a=i+i
  cat("쓰레기를",a,"개 주웠습니다.")
  print(a)
}



multiple = 2 
for (i in 1:9 ){
  cat(multiple,'X',i,'=',multiple * i, '\n')
}



# while
i <- 1
while (i<=10){
  print(i)
  i <- i+1
}

multiple = 2 
i <- 1
while(i<=9){
  cat(multiple,'X',i,'=',multiple * i, '\n')
  i <- i +1
}

#10개씩 끊어서 만들기.

lin <- 1
for (i in 1:100){
  cat(i, ' ')
  lin <- lin + 1
  if (lin >10){
    print(' \n')
    lin <- 1
  }
}


for (i in 1:100){
  cat( i, ' ')
  if(i %% 10 == 0){
    print('\n')
  }
}



#홀수 카운터 10개씩
counter <- 1
for (i in 1:1000){
  if(i %% 2 == 1)
    cat(i,' ')
  counter <- counter+1
  if (counter>20){
    print('\n')
    counter <- 1
  }
}





#1~1000까지 3의 배수와 5의 배수를 한 줄에 10개씩 출력하고
#마지막에 총 개수를 출력


count <- 1
for (i in 1:1000){
  if(i %% 3 == 0)
    cat(i, ' ')
  count <- +1
  if(i %% 5 == 0)
    cat(i,' ')
  count <- +1
  if(count>10){
    print('\n')
  count <- 1
  }
}



cut <- 1
for (i in 1:100){
  if(i %% 3 == 0)
    cat(i,' ')
  if(i %% 5 == 0){
    cat(i,' ')
    cut <-cut +1
 }if(cut >10){
    print('\n')
    cut <- 1
  }
}




cnt <- 1
for (i in 1:100){
  if (i %% 3 == 0)
    cat(i ,' ')
    cnt <-cnt +1
    if(i %% 5 == 0){
    cat(i, ' ')
    cnt <-cnt +1
     if(cnt>20){
      print('\n')
      cnt <- 1
    }
  }
}



s <- 0
cnt <- 1
for (i in 1:1000){
  if (i %% 3 == 0)
    cat(i ,' ')
  cnt <-cnt +1
  if(i %% 5 == 0){
    cat(i, ' ')
    s=s+i
    cnt <-cnt +1
    if(cnt>20){
      print('\n')
      cnt <- 1
      print(s)
    }
  }
}







