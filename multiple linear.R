##
##
##다중 선형 회귀 분석. 
##
#다중선형 회귀모델  : 여러개의 독립변수를 다루는 회귀모델
#
#
# 회귀식 
# y= B0 + B1X1+ B2X2+ B3X3+...+BnXb
# 
# 독립변수가 n개인 다중 선형 회귀에서 주어진 자료를 이용해
# B0,B1,B2,B3,...,Bn의 값을 알아내는 회귀모델
# 
# 
# 
install.packages("tidyverse")
install.packages('car')
library(tidyverse)
library(car)
car
str(prestige)
head(prestige)

newdata <- Prestige[,c(1:4)]
head(newdata)
plot(newdata,pch=16,col='red',
     main= 'Matrix Scatterplot')
#Income을 이용해서 만들어 보겠다
~Hei

model <-  lm(income~education +prestige+ women,
             data= newdata)
model
##물결 무늬 앞쪽이 종속변수 뒤쪽에 독립변수 
##income이라는 종속변수에 대한 독립변수의 값을 찾아라
coef(model)

#intercept 가 뭐냐  ? y= B0 + B1X1+ B2X2+ B3X3+...+BnXb 여기 회귀식에서의 b0가 바로 인터셉트이다. 
# 따라서 회귀식은
# income=(-253.8497)+  (177.1990*newdata$education)  +  (141.4354*newdata$prestige)    -(50.8957 *newdata$women)
# 이 된다. 


income=(-253.8497)+  (177.1990*newdata$education)  +  (141.4354*newdata$prestige)    -(50.8957 *newdata$women)
income

fitted(model)
residuals(model)

# 선형회귀분석
# 1.model 결정
# 2.계수 결정(회귀식)--> 훈련data)
# 3.예측-->test data 
# 4. 실제 값으로 예측. 
# 
# 


deviance(model)  #잔차

deviance(model)/length(newdata$education)## 평균제곱 오차
summary(model)

##별은 y를 결정하는데 영향력이 높은 x
# 
# Adjusted R-squared:  0.6323 --> 이 값은 1과 0.5 사이를 가지는데 1값으로 갈수록 높은 현실 설명력을 가진다. 
# 0.63은 약 64퍼센트의 값을 가진다고 생각하면 좋음



newdata2 <- Prestige[,c(1:5)]
model2 <- lm(income~., data= newdata2)
summary(mode12)

##lm함수에서 .을 쓴이유는 이하 전부라는 뜻이다. 


library(MASS)
model3 <- stepAIC(model2)
##stepAIC함수 adsp에 나온다 
##영향력이 높은것만 뽑아라. 
summary(model3)


# linear Regration:연속형 Data에대한 예측.
# logistic Regration : 범주형 Data에 대한 예측. --> 결과 값을 범주형태로 변환 시켜주어야 한다. --> one-hot 인코딩 나중에 머신러닝가면 들을것임.(0과 1로 바꾸라는거임.) --> 범주형태로 바꾸어 주는거다.--> sigmoid 함수. 


#Logistic Regression( 로지스틱 회귀분석 )
# 회귀모델에서 종속 변수의 값의 형태가 범주형인 경우 
# 예측 모델
# 주어진 data로 부터 어던 범주를 예측하는 분야를 회귀와 
# 구분하여 분류(classification)이라고 한다. 
# 
# 로지스틱 회귀도 기본적으로 회귀 기법이기 때문에 종속변수는 숫자로 표현되어야 한다. 
# 
# 예) YES와 NO는 0과 1로 seotosa,versicolor, viginica는 
# 1,2,3,과 같이 숫자로 바꾼 후에 로지스틱 회귀 적용 

iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)
tail(iris.new)
##as.integer로 Species의 값을 숫자형으로 바꾸어 준다. 

iris_model <- glm(Species~.,data= iris.new)
iris_model
coef(iris_model)
summary(iris_model)
#glm 로지스틱에 사용하는 함수. 

unknown <- data.frame(rbind(c(5.1,3.5,1.4,0.2)))
names(unknown) <- names(iris)[1:4]
unknown

pr <- predict(iris_model, unknown)
pr
pr <- round(pr,0)
##one -hot 인코딩 --> y값의 형태가 범주형이기 때문이다. 
levels(iris$Species)[pr]



test
test <- iris[,1:4]
pred <- predict(iris_model,test)
pred <- round(pred,0)

answer <- as.integer(iris$Species)
pred== answer
acc <- mean(pred==answer)
acc

