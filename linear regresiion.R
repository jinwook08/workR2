###
##
##14일차
##
##단순선형 회귀분석( simple linear regression analysis )
###
## modeling: 현실 세계에서 일어나는 현상을 수학식으로 표현하는 행위
# 
# 데이터 과학에서 
# 독립변수 x를 설명변수 (eaplanatory variable), 특징 (feature)   
# 종속변수 y를 반응변수 ( response variable), 레이블 (lable)
# x가 입력되면 y를 맞추어야하는 문제, y를 ground truth로 간주 
# 
# 데이터 과학에서 Modeling 이란 수집한 data(훈련 데이터)를 이용하여 최적의 모델을 찾아내는 과정. 
# 
# 
# 최적의 모델을 찾는 과정
# 모델: y= wx + b
# 
# 1. 모델 선택 --> 선형 방정식 선택
# 2. 주어진 data(훈련 data)를 적용하여 매개변수 결정. -->lm()
# 3. 예측은 훈련 data에 없는 새로운 data로 모델이 레이블을 추정하는 과정. -->predict

# 4. 완성된 모델에 대한 품질 평가. 
#summary(): 결과 이해. 
##
##
###
# 
# 회귀분석 (Regression Analysis)
# 관찰된 연속형 분수들에 대해 두  변수 사이의 모형을 구한 뒤 
# 적합도를 측정해 내는 분석방법
# 
# 시간에 따라 변화하는 데이터나 어떤 영향, 가설적 실험, 
# 인과 관계의 모델링등의 통계적 예측에 이용될 수 있다.
# 
# 단순선형 회귀분석(simple linear regression analysis)
# 독립변수와 종속변수와의 관계가 선형으로 표현 하나의 독립 변수를 다루는 분석방법
# 
# 
# 
# 단순선형 회귀모델의 회귀식: y= wx + b(w,b는 상수)
#         w,b는 어떻게 찾을 수 있을가?
#         x,y로 구성된 data를 이용하여 w,b를 찾아내는 모델
#         



##단순선형 회귀분석. 
#주행거리와 제동거리 사이의 회귀모델
str(cars)
head(cars)

#산점도를 통한 선형 관계 확인
plot(dist~speed, data= cars)
plot(cars)
cars

#회귀모델 구하기, 
#종속(반응) 변수~ 독립(설명) 변수 순서로 지정
model <-lm(dist~speed, cars)
model
## y= wx+b ///y= dist , x= speed
##선형 변수와 반응변수로 결정되는게 있다 분석하여 사용하ㅣ자. 
abline(model)
##lm 함수를 이용해서 w와b값을 예측해서 만든 회귀선.

###여기까지 단순선형회귀분석 기본 순서임.

#관련 함수

coef(model)  #매개변수(계수) -w,b 값 출력
cars
fitted(model) #훈련 data에 대한 예측값.  predict랑 비슷.
residuals(model)     #잔차: 회귀식으로 추정된 값과의 차이 
#잔차 제곱합을 평균제곱오차(MES-mean squared error)로 변환환
cars
deviance(model)/length(csrs$speed)

b <- coef(model)[1]
b
w <- coef(model)[2]
w
speed <- 21.5
dist <- w *speed+ b
dist

df <- data.frame(speed=c(21.5,25.0,25.5,26.0,26.5,27.0,27.5,28.0))
predict(model,df)#예측 수행 함수 
plot(df$speed,predict(model,df),col='hotpink',
     cex=3,pch=15)
abline(model,lwd='3')




speed <- cars[,1]
pred <- w*speed +b
pred

compare <-  data.frame(pred,cars[,2],
                       pred-cars[,2])
compare

colnames(compare) <- c('예상','실제','오차')

head(fitted(model),3)     #예측
head(residuals(model),3)    #추정된 값과의 차이. 
head(compare,3)



summary(model)
# 
# 평균은 클수록, 분산은 작을수록, 데이터의 크기가 클수록 
# 믿음이 커진다. -> t-통계량 (t-statistics)/t-값 (t-value)
# t-값이 크면 대립가설에 대한 믿음이 강해진다. 
# t-값이 작으면 대립가설에 대한 믿음이 약해진다. 
# 
# 데이터를 통해 '대립가설이 통계학적으로 유의미하다' 라는 것을 증명하고 확인하는 작업을 t-검정(t-test)라 한다. 
# 
#'귀무가설이 참이라고 가정했을 때, 표본으로 부터 얻어지는 
# 통계치가 나타날(관측될) 확률'을 계산하는데 이 때 계산된 확률 값을 p값이라 한다. 

# p값이 매우 낮으면, 이러한 표본 통계 값은 우연히 나타나기 어려운 케이스이기 때문에, 우리는 귀무가설을 채택하지 않고 ( 기각하고), 대안적인 가설인 가설, 즉 대립가설을 채택한다. 
cars


str(cars)
head(cars)
car_model <- lm(dist~speed,data=cars)
coef(car_model)
plot(car_model)
abline(car_model,col='red')
summary(car_model)






str(women)
head(women)
women_model <- lm(weight~height, data=women)
coef(women_model)
plot(women_model)
abline(women_model,col='red')
summary(women_model)










