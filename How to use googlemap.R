
# 
# 공간 시각화
# 
# 
# google map사용
# 
# 절차
# 1.R 최신버전 설치
# 2.ggplot2 최선버전 설치
# 3.ggmap 설치
# 4.구글맵을 사용하기 위한 API key 획득
# 5.구글맵을 이용한 공간 시각화 수행
# 
# 
# install.packages
# 


library(ggmap)
register_google(key='AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g')

##구글맵에서 경도와 위도 정보가 필요하다. 
gc <- geocode(enc2utf8('제주'))
gc
##geocode가 알아서 경도와 위도 정보를 구해준다.
##geocode로 값을 구하면 tible값으로 숫자가 아니다 따라서


cen <- as.numeric(gc) #경도 / 위도를 숫자로 변환
cen

##지도 표시
map <- get_googlemap(center = cen)
ggmap(map)



gc <- geocode(enc2utf8('한라산'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,  #지도 중심점 좌표
                     zooom=10,     #지도 확대 정도
                     size=c(640,640),  #지도 크기
                     maptype = 'hybrid') #지도 유형
ggmap(map)


##타입을 안주면 3d맵 하이브리드는 로드맵과 섞은 형태. 
#roadmap, hybrid




cen <- c(126.561099, 33.253077)
map <- get_googlemap(center = cen,
                     zoom = 17,
                     maptype = 'roadmap'
                           )
ggmap(map)


################

##지도위에다가 마커를 표현하는 방법
gc <- geocode(enc2utf8('제주시'))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen,
                     maptype = 'roadmap',
                     marker=gc)
ggmap(map)


names <- c('용두암','성산일출봉','정방폭포',
           '중문관광단지','한라산1100고지','차귀도')
addr <- c('제주시 용두암길 15',
          '서귀포시 성산읍 성산리',
          '서귀포시 동홍동 299-3',
          '서귀포시 중문동 2624-1',
          '서귀포시 색달동 산1-2',
          '제주시 한경면 고산리 125')
gc <- geocode(enc2utf8(addr))

gc


df <- data.frame(name=names,lon=gc$lon,
                lat=gc$lat)
df


cen <- c(mean(df$lon), mean(df$l))

map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom=10,
                     size= c(720,720),
                     marker = gc)
ggmap(map)



###지도에 관광지 텍스트 추가하기 .
gmap <- ggmap(map)
gmap+
  geom_text(data= df,
            aes(x= lon,y= lat),
            size=5,
            label=df$name)


####지도에 데이터 표시하기
dim(wind)
str(wind)
wind

sp <- sample(1:nrow(wind),50)
df <- wind[sp,]
head(df)

cen <- c(mean(df$lon),mean(df$lat))
gc <- data.frame(lon=df$lon,lat=df$lat)
head(gc)

##데이터 표시하기전에 먼저 마커부터 찍어주고
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom = 6,
                     marker = gc)
ggmap(map)

##지도에 풍속을 원의 크기로 표시 하는방법. 

map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom = 6,
                    )
gmap <- ggmap(map)

gmap+
  geom_point(data=df,
             aes(x=lon,y=lat,size=spd),  #wind 데이터셋 안에 있는 변수 값.
             alpha=0.5,col='blue')+
  scale_size_continuous(range=c(1,14))#원 크기 조절. 

##alpha 값은 투명도 값이 작을수록 투명하게.
#
##


##단계구분도

install.packages('ggiraphExtra')
library(ggiraphExtra)

dim(USArrests)
str(USArrests)
head(USArrests)

library(tibble)
crime <- rownames_to_column(USArrests,var = 'state')
crime$state <- tolower(crime$state)
str(crime)

##여기까지 데이터셋을 준비한거임. 



##모양은 지도 모양인데 우리나라 전국적으로 인구를 색으로 표현하거나할때 사용하는방법 마치 트리맵과 같을때. --> 단계 구분도라고 한다. 


library(ggplot2)
install.packages('mapproj')
library(mapproj)

state_map <- map_data('state')
str(state_map)

ggChoropleth(data= crime,
             aes(fill = Murder,
                 map_id=state),
             map=state_map)


#
#한국 행정지도 패키지.
#http://rpubs.com/cardiomoon/222145


install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")
library(kormaps2014)
library(moonBook2)


areacode
str(kormap1)


library(ggplot2)
theme_set(theme_gray(base_family="NanumGothic"))

ggplot(korpop2,aes(map_id=code,fill=총인구_명))+
  geom_map(map=kormap2,colour="black",size=0.1)+
  expand_limits(x=kormap2$long,y=kormap2$lat)+
  scale_fill_gradientn(colours=c('white','orange','red'))+
  ggtitle("2015년도 시도별 인구분포도")+
  coord_map()




