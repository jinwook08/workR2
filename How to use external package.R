#
#10일차
#

##ggplot 막대그래프.

install.packages('tidyverse')
library(tidyverse)
library(ggplot2)
###tible은 data.frame 개선한 프로그램. 
mpg<- ggplot2::mpg
dim(mpg)
str(mpg)
head(mpg)
View(mpg)

ggplot(data = mpg)+geom_point(mapping= aes(x=displ,y=hwy))
#geom_point =--> 삼전도 
#mapping--> x,y를 지정해준다. 
#ggplot+ geom_point는 기본적인 사용방법임. 
#인수명 mapping을 안써도 된다. 안쓰고 싶다면 아래와 같은 방법으로 진행하면된다. 


month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

ggplot(df,aes(x=month,y=rain))+geom_bar(stat='identity',width = 0.7,fill='steelblue')

#geom 은 항상 그래프를 그리는 함수로 _ 뒤에 적는게 그래프의 유형. 
#gglpot에는 항상 데이터 프레임이 들어간다. 
#aes라는 함수가 맵핑할때 쓰는 함수이다. 
#stat는 막대 높이를 무었으로 할거냐.
#fill은 막대안에 세워진 색을 뜻한다. ,



ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat = 'identity', width = 0.7, fill='steelblue')+
  ggtitle('월별 강수량')+
  theme(plot.title = element_text(size=25, 
                                  face = 'bold',
                                  colour = 'steelblue'))+
  labs(x='월',y='강수량')+coord_flip()
#theme은 ggtitle의 테마를 지정한다. 
#coord_flip은 세로인 바의 모양을 가로로 만들어준다. 

##히스토그램 그려보기

ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)
#히스토그램을 작성할때 binwidth x값의 카운트 세는 기준을 0.5로 해라. 

ggplot(iris,aes(x=Sepal.Width,fill=Species, color=Species))+              #색상을 품종별로 정해줘라
  #fill은 막대를 채우는 인수
  #color는 막대 선색. 
  geom_histogram(binwidth=1, position = 'dodge')+
  theme(legend.position = 'top')
#fill= Species 는 Species가 범주형으로서 특정한 값이므로 색도 범주형에서 미리 지정되어 있으므로 color에 Species 만 넣어도 된다. 
#legend.position.범례의 위치를 맨 위로 나타내라. 
#일반적으로 ggplot은 계층방식(layer방식)이다. 
#1단계 ggplot 2단계 geom_ 3단계 theme 판+판+판 
#binwidth는 연속형 데이터 상에서 얼마 단위로 짤라서 값을 표현한것이다. 이때 단위가 작을 수록 더 세분화하여 표현이 가능하다. 


###ggplot2 scatter cahrt
ggplot(data= iris, mapping=aes(x=Petal.Length,
                               y= Petal.Width))+
  geom_point()
##2계층. 

###ggplot2 scatter cahrt
ggplot(data=iris)+
  geom_point(mapping = aes(x=Petal.Length,
                           y=Petal.Width))



# 위의 두개 결과는 똑같이 나오는것을 볼 수 있다. 둘의 차이점은 처음 코드에서는 ggplot 안에 모든 데이터 셋을 지정했지만 아래 코드에서는 geom_point에서 모든 데이터를 지정해줬다. 테마는 일반적으로 분리하는것으로 한다. 


###ggplot2 scatter cahrt
ggplot(data= iris, mapping=aes(x=Petal.Length,
                               y= Petal.Width,
                               color= Species,
                               shape=Species))+
  geom_point(size= 3)+
  ggtitle('꽃잎의 길이와 폭')+
  theme(plot.title = element_text(size = 25,
                                  face='bold',
                                  colour='red'))

#size는 점 싸이즈.
#shape는 형태별 모양으로 제공
#ggtitle은 제목 





##ggplot Box plot

ggplot(data= iris,mapping=aes(y=Petal.Length))+
  geom_boxplot(fill='yellow')



ggplot(data= iris,mapping=aes(y=Petal.Length,
                              fill=Species))+
  geom_boxplot()




##ggplot Line chart
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)
df
head(df)

ggplot(df,aes(x=year,y=cnt))+
  geom_line(col ='red')
#선그래프는 시계열 데이터에 주로 사용한다.
#시간이 들어가는 정보를 시각화 할때 주로 사용한다. 





##ggplot에서 공통적으로 쓰는 방법.
##ggplot 작성 graph 꾸미기.(공통)

str(economics)

#사선
ggplot(economics,aes(x=date,y=psavert))+
  geom_line()+
  geom_abline(intercept = 12.18671,
              slope =-0.0005444)

#intercept: y절편값.
#slope: 기울기. 



#평행선 

ggplot(economics,aes(x=date,y=psavert))+
  geom_line()+
  geom_hline(yintercept = mean(economics$psavert))



##수직선. 시계열 데이터
library(dplyr)
library( ggplot2 )

str( economics )
economics$psavert
min( economics$psavert )

x_condition <- economics$psavert == min(economics$psavert )
x_inter <- economics[ x_condition, ]
ggplot(economics,aes(x=date,y=psavert))+
  geom_line()+
  geom_vline(xintercept  = x_inter$psavert )


######################원래는 밑에것만 해도 되는데 안되서 위에거러함.##

x_inter <- filter(economics,psavert == min(economics$psavert))$date
x_inter

ggplot(economics,aes(x=date,y=psavert))+
  geom_line()+
  geom_vline(xintercept  = x_inter$psavert )





##텍스트 추가.##
ggplot(airquality,aes(x=Day,y=Temp))+
  geom_point()+
  geom_text(aes(label=Temp,
                vjust=0,
                hjust=0))



##영역 지정 및 화살표 표시

ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_point()+
  annotate('rect',            #상자 모양으로 만들어라. 
           xmin=3,
           xmax=4,
           ymin=12,
           ymax=21,
           alpha=0.5,
           fill='skyblue')+
  annotate('segment',x=2.5,xend=3.7,     
           y=10,yend=17,color='red',
           arrow= arrow())+
  annotate('text',x=2.5,y=10,
           label='point')


#지정영역에 뭔가 선으로 표시를 하고 싶을때 #annotate 함수를 사용하면 된다.  segment는 화살표를 그려라 .
#alpha 값은 지정된 영역의 투명도 1에가까울 수록 불 투명하다. 
#annotate 영역 지정하기 


##트리맵을 만들어보자. 
#상자하나의 크기가 데이터의 크기를 나타낸다. 

#treemap
install.packages('treemap')
library(treemap)



data(GNI2014)
dim(GNI2014)
str(GNI2014)

head(GNI2014)
View(GNI2014)
GNI2014
treemap(GNI2014,
        index = c('continent','iso3'),#계층구조
        vSize = 'population',           #타일크기
        vColor='GNI',                    #타일컬러
        type= 'value',                     #타일컬러링방법
        bg.labels = 'yellow',                #레이블배경색
        title="World's GNI")                       #제목.
        
##크기순으롭 시각화할때 좀 더 편안하게 볼 수 있다. 

st <- data.frame(state.x77)
st <- data.frame(st,stname=rownames(st))
treemap(st,
        index=c('stname'),
        vSize = 'Area',
        vColor='Income',
        type='value',
        bg.labels = 'red',
        title='미국 주별 수입')



#산점도에 Bubble 추가( Bubble chart)

symbols(st$Illiteracy, st$Murder,            #원의 x,y 좌표
        circles = st$Population,             #원의 반지름
        inches = 0.3,                        #원크기 조절값
        fg= 'white',                         #원 테두리 색
        bg= 'lightgray',                     #원 바탕색
        lwd=1.5,                            #원 테두리선 두께
        xlab = 'rate of Illiteracy',
        ylab = 'crime(murder) rate',
        main = 'Illiteracy and Crime')
text(st$Illiteracy,st$Murder,                 #텍스트출력 x,y 좌표
     rownames(st),                            #출력할 text
     cex=0.6,                                  #폰트크기
     col='brown')                                #폰트컬러





###ggplot을 이용해서 코드 복사 붙여넣기
# Libraries
library(ggplot2)
library(dplyr)
install.packages(plotly)
library(plotly)
install.packages(viridis)
library(viridis)
install.packages(hrbrthemes)
library(hrbrthemes)

# The dataset is provided in the gapminder library
install.packages(gapminder)
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Interactive version
p <- data %>%
  mutate(gdpPercap=round(gdpPercap,0)) %>%
  mutate(pop=round(pop/1000000,2)) %>%
  mutate(lifeExp=round(lifeExp,1)) %>%

  # Reorder countries to having big bubbles on top
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  
  # prepare text for tooltip
  mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
  
  # Classic ggplot
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp

# save the widget
# library(htmlwidgets)
# saveWidget(pp, file=paste0( getwd(), "/HtmlWidget/ggplotlyBubblechart.html"))

