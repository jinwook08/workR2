
# 16일차
# 
# 군집화(clustering)/분류(classification)
# 
# 군집화 :주어진 대상 데이터들을 유사성이 높은 것끼리 묶어주는 기술(군집, 봄주, 그룹)
# 
# K-means 군집화 평균 알고리즘
# 

mydata <- iris[,1:4]
fit <- kmeans(x=mydata, center= 3)  #center= 3 3개의 군집으로 나누어라 . 
fit
# K-means clustering 
# with 3 clusters of sizes 62, 50, 38  -->3개 군집에 속한 데이터 개수
# 
# Cluster means:
#  Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     5.901613    2.748387     4.393548    1.433871
# 2     5.006000    3.428000     1.462000    0.246000
# 3     6.850000    3.073684     5.742105    2.071053
#
#
# Clustering vector:--> 각 데이터에 대한 군집번호 
#   [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
# [28] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 3 1
# [55] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1
# [82] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 1 3 3 3 3 1 3
# [109] 3 3 3 3 3 1 1 3 3 3 3 1 3 1 3 1 3 3 1 1 3 3 3 3 3 1 3
# [136] 3 3 3 1 3 3 3 1 3 3 3 1 3 3 1

fit$cluster  # 각 데이터에 군집번호
fit$center    

library(cluster)  #차원축소 후 군집 시각화 패키지. 

clusplot(mydata,         #군집대상
         fit$cluster,     #군집번호
         color=TRUE,        #원의 색
         shade = TRUE,        #원의 빗금표시 유무
         labels=2,              #관측값 출력 형태
         lines=1)                   #중심선 연결 표시 


subset(mydata, fit$cluster==2)



# 대상 데이터 표준화 후 군집화
# 
#   데이터와 데이터의 거리를 계산할 때 발생하는 문제
#   모든 변수가 거리 계산에 동등한 영향을 갖도록 
#   하기 위해서 모든 변수의 자료 범위를 0~1 사이로
#   표준화한 후 거리 계산을 한다. 
# 
#표준화 공식. 
# (x-min(A))/(max(A)-min(A))
# x:변수 A의 임의의 관측값
# max(A), min(A)는 변수 A 관측값중 최대/ 최소값. 
#

# 표준화 시키는  함수 
std <-  function(x){
  return ((x-min(x))/ (max(x)-min(x)))
}
mydata <- apply(iris[,1:4],2,std)
fit <- kmeans(x=mydata, center= 3)
fit



##
##KNN(K-Nearest Neighbor, K-최근접 이웃) 분류 알고리즘
##

library(class)
#훈련용/테스트용 데이터 준비

iris[tr.idx,1:4]

tr.idx <- c(1:25, 51:75, 101:125)
ds.tr <- iris[tr.idx,1:4]            #훈련용
ds.ts <- iris[-tr.idx, 1:4]            #테스트용
cl.tr <- factor(iris[tr.idx,5])     #훈련용 그룹정보
cl.tr
cl.ts <- factor(iris[-tr.idx,5])    #테스트 그룹정보
pred <- knn(ds.tr,ds.ts,cl.tr,k=3,prob=TRUE)
pred
acc <- mean(pred==cl.ts)
acc
table(pred,cl.ts)




#
#교차 검증 방법(k-fold cross validation)

install.packages('cvTools')
library(cvTools)
 k= 10
folds <- cvFolds(nrow(iris), K=k )

acc <- c()
for(i in 1:k){
  ts.idx <-  folds$which==i
  ds.tr <- iris[-ts.idx,1:4]
  ds.ts <- iris[ts.idx,1:4]
  cl.tr <- factor(iris[-ts.idx,5])
  cl.ts <- factor(iris[ts.idx,5])
  pred <- knn(ds.tr,ds.ts,cl.tr,k=5)
  acc[i] <- mean(pred==cl.ts)
}
acc
mean(acc)
# ##over fitting 이 안 일어나게 하는게 중요하다 
# --> k- fold cross validation 으로 여러번의 훈련 데이터와 훈련횟수를 정한다. 이를 이용해서 오버피팅을 방지할 수 있다. 


