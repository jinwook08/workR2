#
# 
# DATA Preprocessing
# 7일차. 
# 
#vector의 결측치 처리

z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)  #is로 시작하면 결과는 논리값. 
sum(is.na(z))     #FALSE ==0 TRUE ==1
sum(z, na.rm = TRUE)    #결측치를 제외하고 연산해라. 



#결측치 대체및 제거. //단순 대입법. 
z1 <- z
z1[is.na(z1)] <- 0    #is.na에서 나오는 결측치가  TRUE이므로
z1                     #이를 이용해서 그 결측치의 값을 0으로 바꾸어 주는 단순 대입법. 


#Listwise deletion
z2 <- c(5,8,1,NA,3,NA,7)
z3 <- as.vector(na.omit(z2))      #na.omit이 NA를 삭제해라
z3                                #그리고 as.vector를 이용해서 
                                  #벡터로 바꾸어라. 

#MAtrix/Data Frame 결측치 처리
x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)
#Matrix/Data Frame 열별 결측치 확인 방법. 
#for문 이용
 
for(i in 1:ncol(x)){
  this.na <- is.na(x[ , i])
  cat(colnames(x)[i],
      "\t", sum(this.na),
      '\n')
}

#열 별로 결측치가 몇개 있는지 파악이 가능하다. 


#이 방법이 더 많이 쓰이는 방법이다 .
#apply()이용
col_na <- function(y){
  return (sum(is.na(y)))
}                                   #apply(data frame,  행방향=1/열 방향=2, 함수=>반복 1회차에 실행. )
na_count <- apply(x,2,col_na)         #apply함수 자체가 반복문을 가지고 있다. 
na_count


###다르게 apply를 사용하는 방법.//익명 함수를 사용하는 방법. 
#이 방법을 더 많이 사용한다. 
na_count <- apply(x,2, 
                  function(y) sum (is.na(y)))
na_count

#apply(x,2 function(y) sum(is.na(y)))
#function(y) sum(is.na(y))--> 익명 함수라 한다. 
#


#결측치가 있을때 변수관의 관계를 통하여 확인해보는 방법.
barplot(na_count[na_count>0])

install.packages('VIM')   
require(VIM)       ###라이브러리랑 같은 함수. 

#결측치 자료 조합 확인용 시각화 도구
aggr(x, prop = FALSE, numbers = TRUE)
 
#두 개의 변수간의 결측치 관계 확인 시각화 도구
marginplot(x[c('Sepal.Width','Sepal.Length')],
           pch=20,
           col=c('darkgray','red','blue'))


## Matrix/Data Frame의 행(data)별 결측치 확인
rowSums(is.na(x))
sum(rowSums(is.na(X))>0)

sum(is.na(x))
#결측값이 포함된 행은 몇 개 인지 출력하시오. 
#행에 포함된건지 열에 포함된건지 모른다. 


#결측치를 제외한 새로운 데이터셋 생성. 
head(x)
x[!complete.cases(x),] #결측치가 포함된 행. 
y <- x[complete.cases(x),]   #결측치가 포함되지 않은 행만   y에 넣어라.  #complete.case-> 결측치가 포함된 행을 제거하고 해라. 
head(y)



# 
# 
# #이상치(out lier)
# 1. 논리적으로 성립되지 않는 값. --> 변수의 특성을 알아야한다.
#--> 따라서 얘는 눈으로 직접 찾아야하는 수밖에 없다. 
# 2. 상식적으로 용인되지 않는 값. -->상자 수염시각화 . 
# 
  # 
  #특이값, 이상치(outlier)
  st <- data.frame(state.x77)
  summary(st$Income)
  boxplot(st$Income)
  boxplot.stats(st$Income)$out
  
  #데이터를 알고 이 데이터가 문자열이 맞느냐 숫자형이 맞느냐를 전부 따져보고 그 이후에.
  #데이터 분석을할때 가장 먼저 할것 결측치와 이상치부터 찾아본다. 
  
  
  ##특이값 처리: NA로 변환 후 결측치 처리방법 이용.
  out.val <- boxplot.stats(st$Income)$out
  st$Income[st$Income %in% out.val] <- NA    #%in% 포함여부를 나타내는 연산자. 
  head(st)
  newdata <- st[complete.cases(st),]
  head(newdata)
  ########################데이터 정제를 지금까지 해 보았다. 
  #Data정제를 한다는건 
  #결측치 처리
  #이상치 처리.



#이제부터 Data 가공을 해보겠다. 
#정렬,추가,필터링, 병합,집계 

#
#데이터 정렬
#vector 정렬
v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)     #앞 번호부터 정렬
v1
v2 <- sort(v1, decreasing = T)   #뒷번호부터 정렬
v2




#Matrix/Data Frame 정렬
head(iris)
order( iris$Sepal.Length )   #정렬시켜주는데 그 정렬시킨애들 순서만을 나타낸다. 
iris[order(iris$Sepal.Length),]   #Ascending  #이때 옆에 나오는 숫자는 원래 몇번째에 있던 꽃인지 말해준다. 
iris[order(iris$Sepal.Length, decreasing = T),]   #Descending#여기서 처음으로 나오는 꽃은 원래 132번째 꽃이였지만 정렬을 통해서 앞으로 끌고 온다. 
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Species,decreasing = T,
           iris$Sepal.Length),]    #정렬 기준을 2개 설정. 


#데이터 분리.
sp <- split(iris, iris$Species)   #품종별로 나누어 준다. 
sp
summary(sp)
summary(sp$setosa)   #요약 정리
sp$setosa

  

#데이터 선택  조건에 맞는것만 출력. 
subset(iris, Species=='setosa')
subset(iris, Sepal.Length>7.5)
subset(iris, Sepal.Length>5.1 & Sepal.Width>3.9)
subset(iris, Sepal.Length>7.6,
       select = c(Petal.Length,Petal.Width))


#데이터 sampling
#숫자를 임의로 추출

#샘플링의 2가지 방법.
#비복원 추출  ---> 샘플링하고 다시 넣지 않고 샘플링하는거. (한번 뽑은건 빼고 샘플링한다. 
#복원추출 --> 샘플링하고 다시 또 넣어서 또 샘플링하는거(한번 뽑은것도 다시 넣어서 샘플링을 한다. )
x <- 1:100
y <- sample(x,size=10, replace=FALSE)
y
#replace== FALSE 가 비복원추출. .


#행을 임으로 추출
idx <- sample(1:nrow(iris),size=50,
              replace=FALSE)
idx
iris.50 <- iris[idx,]
dim(iris.50)
head(iris.50)



set.seed(100)   #t샘플링을 동일한 번호로 사용하고 싶을때. 
sample(1:20,size=5)
set.seed(100)
sample(1:20,size=5)
set.seed(100)
sample(1:20,size=5)


sample(1:45,size=8)


#데이터 조합.
combn(1:5,3)    #1부터 5사이의 3가지를 뽑는 조합의 경우의수. 
x=c('red','green','blue','black','white')
com <- combn(x,2)
com    #2가지 변수씩 뽑을때 앞에서 부터.10개의 조합의 경우의수. 

for (i in 1:ncol(com)){
  cat( com[,i], '\n')
}


##집계.

# 데이터 집계



str(iris )



agg <- aggregate( iris[ , -5 ],
                  
                  by = list( iris$Species),
                  
                  FUN = mean)

agg



## aggreate( 1, 2, 3 )

## 1 =>집계할 대상  2 => 집계할 단위 3 => 할일 

## 1 => 품종을 제외 시켜라 ( - ) 2 => 품종 별로 집계 3 => 평균을 구해라



agg <- aggregate( iris[ , -5 ],
                  
                  by = list( iris$Species),
                  
                  FUN = sd)                      # sd 표준 편차 

agg







head( mtcars )

agg <- aggregate( mtcars,
                  
                  by = list( cyl = mtcars$cyl,     # 기준이 cyl과 vs.
                             
                             vs = mtcars$vs),
                  
                  FUN = max)                     # 최대값 

agg





##데이터 병합. 
x <- data.frame(name=c('a','b','c'),
                mat= c(90,80,40))
y <- data.frame(name=c('a','b','d'),
                korean=c(75,60,90))
z <- merge(x,y,by=c('name'))

z
#변수의 이름이 같을때만 병합. 다르면 병합 x
#즉 둘다 각각 네임이 같을때만 병합이 가능하다. 


merge(x,y)   #둘중에 같은 이름을 가진 변수끼리 병합. 
merge(x,y, all.x=T) # y의 korea 값이 없는 c의 korean에 NA값이 들어간다. 변수만 추가. 
merge(x,y ,all.y = T) #x의 mat 값이 없는 d의 mat에 NA값이 들어간다.  변수만 추가. 
merge(x,y, all=T) #모든 값들을 보여주는 단순 통합. 변수+ 데이터 추가. 



#변수의 이름이 서로 다를때  name 과  sname의 차이. 


x <- data.frame(name=c('a','b','c'),
                mat= c(90,80,40))
y <- data.frame(sname=c('a','b','d'),
                korean=c(75,60,90))
z <- merge(x,y,by.x=c('name'),
               by.y = c('sname'))

z


#R에서 가장 많이 사용하는 패키지.
#
#dplyr package
#

install.packages('dplyr')
library(dplyr)
#데이터를 가공할때 가장 많이 사용되는 패키지. 

# %>% --> pipe파이프 연산자. ctrl + shift + M


df <- data.frame(var1=c(1,2,3),
                 var2=c(2,3,2))

df

#rename: 이름변경
df <- rename(df,v1=var1,v2=var2)
df
##변수 이름을 바꾸는 패키지. dplyr

##파생변수 추가
df$sum <- df$v1 + df$v2
df
#2행1열에 값을 5로 바꾸어 준다. 
df[2,1] <- 5
df


df <- data.frame(id=c(1,2,3,4,5,6),
                 class=c(1,1,1,1,2,2),
                 math=c(50,60,45,30,25,50),
                 english=c(98,56,43,21,23,55),
                 science=c(34,68,87,43,23,77)
                 )

df
##filter(): 행 추출
df %>% filter(class==1)
df %>% filter(class==2)
df %>% filter(class!=1)
df %>% filter(class!=2)

#입력-> %>% -> 출력
#파이프는 연결기능만 한다. 
df %>% filter(science>70)
df %>% filter(math<50)

df %>% filter(class==1&math>=50)
df %>% filter(math>=50|english>=90)
df %>% filter(class %in% c(1,3,5))  #%in% --> 포함여부를 나타내는 명령.  
#필터 함수는 행을 추출할때 사용하는 함수이다. 
#필터 함수는 조건 식만 주면 된다. 
#dplyr 패키지의 가장큰 장점이 파이프 기능. 

class1 <-df %>% filter(class==1)  
class2 <- df %>% filter(class ==2)
class1
class2
##split 과 비슷하나 별도의 데이터 프레임으로 만들수 있다는게 장점이다. 


#select():변수 추출
df %>% select(math)
df %>% select(science)

df %>% select(class,math,science)

df %>% select(-math)    #math를 빼고 추출해라. 



#dplyr 함수 조합. 
df %>% 
  filter(class==1) %>% 
  select(science)

df %>% 
  select(id, science) %>% 
  head


df %>% 
  select(id, science) %>% 
  sum



df %>% 
  select(id, science) %>% 
  max


#arrange ():정렬 sort함수와 같은 기능. 
df %>% arrange(science)#오름차순
df %>% arrange(desc(science)) #내림차순. 


#mutatge():파생변수 추가
df %>% 
  mutate(total=math+english+science) %>% head

df %>% 
  mutate(total=math+english+science,
         average=(math+english+science)/3)%>% head


df %>% 
  mutate(grade=ifelse(science>=60,'pass','fail')) %>% head
#파생변수 추가할때 이걸 더 많이 쓴다. 




df %>% 
  mutate(total=math+english+science,
         average=(math+english+science)/3)%>% 
  mutate(grade=ifelse(average>=90,'pass',
                      ifelse(average<60,'fail','normal'))) %>%
  head
#평균이 90이상이면 pass 60이하면  fail , 나머지는 normal.

df %>% 
  mutate(total=math+english+science,
         average=(math+english+science)/3)%>% 
  arrange(desc(average)) %>% 
  head
#변수의 결과를 가지고 싶으면 반드시 변수에 담아서 저장해라. 




#summarise():집단별 요약
#group_by(): 집단별 나누기.
df %>% summarise(mean_math=mean(math))
df %>% group_by(class) %>%              #group_by로 그룹핑 1반 하나 묶고 2반하나 묶어서 이걸로 아래에서 집단별 요약 실행. 
  summarise(mean_math=mean(math),
            mean_english=mean(english),
            mean_science=mean(science),
            n=n())   #n은 빈도수를 계산해주는 함수이다. 


#::--> 스코프 콜론 두개 다음에 나오는 것은 데이터셋 이름. 
#패키지만 설치하고 로드 따로 안하고 특정한 패키지가 가지고 있는 데이터 셋을 사용하는 방법을 :: 콜론 두개 뒤에 데이터셋이름이다.

install.packages('ggplot2')

str(ggplot2::mpg)
mpg <- data.frame(ggplot2::mpg)
dim(mpg)
str(mpg)
head(mpg)
View(mpg)


mpg %>% group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)


mpg %>% group_by(manufacturer) %>% filter(class=='suv')%>% mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% arrange(desc(mean_tot)) %>% head(5)

# 
# #데이터 합치기. 
# #left_join(): 가로로 합치기(변수추가)
# #inner_join(): 가로로 합치기.(변수추가)
# full_join():가로로 합치기(변수추가)
# bind_rows():세로로 합치기(data추가)

df1 <- data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,85))
df2 <- data.frame(id=c(1,2,3,4,5),
                  final=c(60,80,70,90,85))
total <- left_join(df1,df2,by='id')
df1 <- data.frame(id=c(1,2,3),
                  address=c('서울','부산','제주'),
                  stringsFacrors=F)  #스트링을 Factor로 만들어질 가능성을 막아주는 인수가 stringsFactors=F이다. 
df2 <- data.frame(id=c(1,2,4),
                  gender=c('남','여','남'))

df1
df2
total


df_left <- left_join(df1,df2,by='id')   #기준이df1으로 df2를 추가할껀데 기준이  id이다 이때 df1에 123 id가 있음 그런데 df2에 id가 124이므로 값이 젠더에 NA값이 들어간다. 
df_left

df_inner <- inner_join(df1,df2,by='id')#둘의 아이디가 같은 것들만 합하여 나타내어 준다. 
df_inner

df_full <- full_join(df1,df2,by='id')#전부 다 나타내어 준다. 
df_full




df1 <- data.frame(id=c(1,2,3,4,5),
                 test=c(60,80,70,90,85))
df2 <- data.frame(id=c(1,2,3,4,5),
                  test=c(60,80,70,90,85))

df_all <- bind_rows(df1,df2)  ##새로추가 행으로..
df_all


install.packages('psych')
library(psych)

summary(mtcars)
describe(mtcars)
#둘이 비슷한 함수임. 


install.packages('descr')
require(descr)

df <- data.frame(id= c(1,2,4),gender=c('남','여','남'))

table(df$gender)   #도수분포표
freq(df$gender)   #도수 분포표 + 막대그래프
freq(df$gender, plot = F) #plot을F로하면 막대그래프는 안나온다. 








