# * 실습 결과를 R Script file로 제출
# 
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# 
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
# 
# 
# 
# 문1)
# 
# R에서 제공하는 state.x77 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.
# 
# 
# 
# • 군집의 수는 5로 한다.
# 
# • state.x77은 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화를 실시한 후 군집화를 실행한다.
# 

library(cluster)

std <-  function(x){
  return ((x-min(x))/ (max(x)-min(x)))
}
st <- apply(state.x77,2,std)
st
sft <- kmeans(x=st, center= 5)
sft


clusplot(st,
         sft$cluster,
         color = TRUE,
         shade = TRUE,
         labels = 2,
         lines = 0)


# 문2)
# 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.
# 
# 
# 
# • 군집의 수는 2로 한다.
# 
# • Sonar 데이터셋에서 마지막에 있는 Class 열은 제외하고 군집화를 실행한다.
# 
# 
# 
install.packages("mlbench")
library( mlbench )

data( "Sonar" ) 			# 데이터셋 불러오기

Sonar<- Sonar[,-61]
sf <- kmeans(x=Sonar,center=2)

clusplot(Sonar,
         sf$cluster,
         color = TRUE,
         shade = TRUE,
         labels = 2,
         lines = 0)




# 
# 문3) 
# 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.
# 
# 
# 
# . Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
# 
# . Sonar 데이터셋에서 홀수 번째 데이터(관측값)를 훈련용 데이터로 하고, 짝수번째 데이터(관측값)를 테스트용 데이터로 한다.
# 
# . k-최근접 이웃에서 k를 3, 5, 7로 다르게 하여 예측 정확도를 비교한다.
# 
data('Sonar')
Sonar
library(class)
tr.idx<- seq(1,nrow(Sonar),2)

So <- Sonar
So
ds.tr <- So[tr.idx,-61]
ds.tr
ds.ts <- So[-tr.idx,-61]
ds.ts
cl.tr <- factor(So[tr.idx,61])
cl.tr
cl.ts <- factor(So[-tr.idx,61])
cl.ts
pred <- knn(ds.tr,ds.ts,cl.tr,k=7,prob = TRUE)
pred
acc <- mean(pred==cl.ts)
acc
table(pred,cl.ts)
#k=3일때 0.8269
#k=5일떄 0.75
#k= 7일때 0.711538

# 
# 
# 문4) 
# 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.
# 
# 
# 
# . Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
# 
# . k-최근접 이웃에서 k는 3으로 한다.
# 
# . 5-fold 교차 검증 방법으로 예측 정확도를 측정한다.

data('Sonar')
Sonar
library(class)
tr.idx<- seq(1,nrow(Sonar),2)

So <- Sonar
So
ds.tr <- So[tr.idx,-61]
ds.tr
ds.ts <- So[-tr.idx,-61]
ds.ts
cl.tr <- factor(So[tr.idx,61])
cl.tr
cl.ts <- factor(So[-tr.idx,61])
cl.ts
pred <- knn(ds.tr,ds.ts,cl.tr,k=3,prob = TRUE)
pred
acc <- mean(pred==cl.ts)
acc
table(pred,cl.ts)


library(cvTools)
k=5
folds <- cvFolds(nrow(Sonar),K=k)

acc <- c()
for(i in 1:k){
  ts.idx <- folds$which==i
  ds.tr <- So[tr.idx,-61]
  ds.ts <- So[-tr.idx,-61]
  cl.tr <- factor(So[tr.idx,61])
  cl.ts <- factor(So[-tr.idx,61])
  pred <- knn(ds.tr,ds.ts,cl.tr,k=3)
  acc[i] <- mean(pred==cl.ts)
}
acc
mean(acc)    ##0.8269





