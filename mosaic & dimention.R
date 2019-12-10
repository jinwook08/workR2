#
#
#
#https://www.rdocumentation.org/packages/vcd/versions/1.4-4
# 모자이크라는 함수의 설명. 
#다중변수 범주형 데이터에 대한 각 변수의 그룹별 비율을 면적으로 표시

str(mtcars)
head(mtcars)
mosaicplot(~gear+vs,#대상변수  #~x축 +y축
           data=mtcars, #데이터셋
           color=TRUE, #y축 변수의 그룹별 음영 다르게표시
           main='Gear and Vs') # 제목.


mosaicplot(~gear+vs,
           data=mtcars,
           color= c('green','blue'),#변수의 그룹별 색상. 
           main='Gear and Vs')




#테이블을 이용해서 모자이크 만들기. 

tbl <- table(mtcars$gear,mtcars$vs)
tbl
mosaicplot(tb1,color = T,main='Gear and Vs')




##차원 축소(dimension reduction)

install.packages('Rtsne')
library(Rtsne)
library(ggplot2)

ds <- iris[,-5]   #인덱스 5는 품종이라서 제거
                   #하면 4개의 변수가 필요하므로 4차원이 된다 4차원은 기존 방식으로 그릴수가 없으므로 우리가 그릴수 있는 방향으로 차원을 축소해야한다. 


#차원축소
#중복데이터 제거

dup = which(duplicated(ds))
dup   ##143번째에 중복데이터가 있다 라는것을 알려준다. 

ds<-ds[-dup,] 
ds.y <- iris$Species[-dup]   ##모든 데이터에서 중복 을 지워줘야한다. 

#차원축소 수행 --> t-SNE 함수 실행

tsne <- Rtsne(ds, #차원 축소 대상 데이터셋
              dim=2, #축소할 차원 2/3차원
              perplexity=10)  #차원 축소 과정에서
                              #데터 샘플링을 수행하는데
                              # 샘플의 갯수
                              # perplexity(대상데이터수)/3보다 작게지정
                              

tsne <- Rtsne(ds, dim=2, perplexity=10)   ##dim 2차원으로 축소해라  ##10번 동작해라. 
tsne

#차원축소 결과 시각화
df.tens <- data.frame(tsne$Y)
head(df.tens)

ggplot(df.tens,aes(x=X1, y= X2,color=ds.y))+
  geom_point(size=2)
##ds.y는 품종별 지정.
##데이터가 군집화 되어지는가를 판단할 수있음.



install.packages(c('rgl','car'))
library(car)
library(rgl)
library(mgcv)


tsne <- Rtsne(ds, dims= 3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

scatter3d(x=df.tsne$X1, y= df.tsne$X2,
          z=df.tsne$X3)

###보라색 같은색 나오는게 회귀선이다. 


points <- as.integer(ds.y)
color <- c('red','green','blue')
scatter3d(x= df.tsne$X1, y=df.tsne$X2,
          z= df.tsne$X3,
          point.col= color[points],
          surface = FALSE)



















