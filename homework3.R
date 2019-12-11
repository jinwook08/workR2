# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
# 



# 문1)
# R에서 제공하는 state.x77 데이터셋을 차원 축소하여 2차원 산점도와 3
# 차원 산점도를 작성하시오. (state.x77은 매트릭스 타입이기 때문에 데이터프레임
#                 으로 변환하여 실습한다.)
# 
library(Rtsne)
library(ggplot2)
class(state.x77)
st <- data.frame(state.x77)
dim(st)

dup <-　which(duplicated(st))
dup

tsne <- Rtsne(st, dims=2, perplexity=5)
tsne

ds.y <- st$Frost
df.tsne <- data.frame(tsne$Y)



ggplot(df.tsne,aes(x=X1,y=X2,
                   color=ds.y))+
  geom_point(size=2)

#################
library(car)
library(rgl)
library(mgcv)







# 문2)
# R에서 제공하는 swiss 데이터셋을 차원 축소하여 2차원 산점도와 3차원
# 산점도를 작성하시오.
# 
class(swiss)
str(swiss)
dim(swiss)
mode(swiss)
sw <- swiss
dup1 <- which(duplicated(sw))
dup1
ed <- swiss$Education
##중복 없음.
tsne2 <- Rtsne(sw,dims=2,perplexity=8)

df.tsne2 <- data.frame(tsne2$Y)

ggplot(df.tsne2,aes(x=X1,y=X2,color=ed))+
  geom_point(size=3)


tsne3 <- Rtsne(sw,dims=3,perplexity=8)
df.tsne3 <- data.frame(tsne3$Y)
head(df.tsne3)
tail(df.tsne3)
scatter3d(x=df.tsne3$X1,y= df.tsne3$X2,z= df.tsne3$X3)






# 문3) 
# R을 이용하여 지도를 출력하시오.
# (1) 서울시청을 중심으로 지도 크기는 600x600, 지도 유형은 roadmap인 지도를 출력
# 하시오.


library(ggmap)
library(ggiraphExtra)
library(ggplot2)
library(tibble)
library(mapproj)

register_google(key='AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g')

gc <- geocode(enc2utf8('서울'))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center=cen,
                     zoom=10,
                     size=c(600,600),
                     maptype= 'roadmap')
ggmap(map)


# (2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8
# 인 지도를 출력하시오.
gc <- geocode(enc2utf8('금강산'))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center=cen,
                     zoom=8,
                     size=c(500,500),
                     maptype= 'hybrid')
ggmap(map)



# (3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지
# 도를 출력하시오.

gc <- geocode(enc2utf8('강남역'))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center=cen,
                     zoom=16,
                     size=c(640,640),
                     maptype= 'roadmap')
ggmap(map)



# (4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지
# 도를 출력하시오.



map <- get_googlemap(center=c(127.397692,36.337058),
                     zoom=9,
                     size=c(600,600),
                     maptype= 'roadmap')
ggmap(map)




# (5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의
# 지도를 출력하시오.
# 

map <- get_googlemap(center=c(135.502330,34.693594),
                     zoom=10,
                     size=c(600,600),
                     maptype= 'roadmap')
ggmap(map)

# 문4)
# R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
# 지도 위에 표시하시오.
# 

gc <- geocode(enc2utf8('서울'))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center=cen,
                     zoom=10,
                     size=c(600,600),
                     maptype= 'roadmap')
ggmap(map)


names <- c('강서구청','구로구청','금천구청','동작구청','서초구청','강남구청','송파구청','강동구청')

gc <- geocode(enc2utf8(names))
gc

df <- data.frame(names,gc$lon,gc$lat)
df

cen <- c(mean(df$gc.lon),mean(df$gc.lat))
cen
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom=10,
                     size=c(600,600),
                     marker=gc)
ggmap(map)

gmap <- ggmap(map)
gmap+
  geom_text(data=df,
            aes(x=gc.lon,y=gc.lat),
            size=5,
            label=df$names)








# 

# wd <- c(37.550872,37.495459,37.456913,37.512414,37.483478,37.517292,37.514121,37.530271)
# 
# gd <- c(126.849490,126.887449,126.895437,126.939625,127.032665,127.047386,127.106036,127.123754)
# 
# dd<- union(gd,wd)
# tibble(dd)
# dff<- data.frame(names,gd,wd)
# mdd<- mean(dff[,2])
# mdd
# mcc <- mean(dff[,3])
# mcc
# mjh<- union(mdd,mcc)
# mjh
# 
# map<-get_googlemap(center =mjh,
#                    maptype = 'roadmap',
#                    zoom=10,
#                    size=c(600,600),
#                    marker=dd)
# 
# ggmap(map)
# 
# 
# 



# 강서구청 37.550872, 126.849490
# 구로구청 37.495459, 126.887449
# 금천구청 37.456913, 126.895437
# 동작구청 37.512414, 126.939625
# 서초구청 37.483478, 127.032665
# 강남구청 37.517292, 127.047386
# 송파구청 37.514121, 127.106036
# 강동구청 37.530271, 127.123754






# 문5)
# R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 단, 마커와 광
# 역시 이름을 함께 표시하시오.
# 
names <- c('광주광역시','부산광역시','울산광역시','인천광역시','대구광역시','대전광역시')

gc <- geocode(enc2utf8(names))
gc

dff <- data.frame(names,gc$lon,gc$lat)
dff

cen <- c(mean(df$gc.lon),mean(df$gc.lat))
cen
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom=7,
                     
                     marker=gc)
ggmap(map)

gmap <- ggmap(map)
gmap+
  geom_text(data=dff,
            aes(x=gc.lon,y=gc.lat),
            size=5,
            label=dff$names)












# 문6)
# R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로
# 시하되 국립공원의 이름을 함께 표시하시오.
# 
names <- c('태백산국립공원','태안해안국립공원 안면도지구','한려해상국립공원','태안해안국립공원','내장산국립공원','속리산국립공원','월출산국립공원','북한산국립공원','치악산국립공원','오대산국립공원','변산반도국립공원','지리산국립공원','소백산국립공원','월악산국립공원','계룡산국립공원')

gc <- geocode(enc2utf8(names))
gc

df <- data.frame(names,gc$lon,gc$lat)
df

cen <- c(mean(df$gc.lon),mean(df$gc.lat))
cen
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom=8,
                     
                     marker=gc)
ggmap(map)

gmap <- ggmap(map)
gmap+
  geom_text(data=df,
            aes(x=gc.lon,y=gc.lat),
            size=5,
            label=df$names)




# 문7) 
# ‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교
# 통사고 발생건수를 지도상에 원의 크기로 나타내시오.
# 
setwd('C:/Users/ICT01_22/Desktop/새 폴더 (2)')
gt<- read.csv('도로교통공단_시도_시군구별_월별_교통사고(2018).csv')

View(gt)
class(gt)
str(gt)
mode(gt)

library(ggmap)
library(ggplot2)


sd <- subset(gt, 시군구=='종로구')
sd1 <- subset(gt,시군구=='중구')
sd2 <- subset(gt,시군구=='용산구')
sd3 <- subset(gt,시군구=='성동구')
sd4 <- subset(gt,시군구=='동대문구')
sd5 <- subset(gt,시군구=='성북구')
sd6 <- subset(gt,시군구=='도봉구')
sd7 <- subset(gt,시군구=='은평구')
sd8 <- subset(gt,시군구=='서대문구')
sd9 <- subset(gt,시군구=='마포구')
sd10 <- subset(gt,시군구=='강서구')
sd11 <- subset(gt,시군구=='구로구')
sd12 <- subset(gt,시군구=='영등포구')
sd13 <- subset(gt,시군구=='동작구')
sd14 <- subset(gt,시군구=='관악구')
sd15 <- subset(gt,시군구=='강남구')
sd16 <- subset(gt,시군구=='송파구')
sd17 <- subset(gt,시군구=='서초구')
sd18 <- subset(gt,시군구=='양천구')
sd19 <- subset(gt,시군구=='중랑구')
sd20 <- subset(gt,시군구=='노원구')
sd21 <- subset(gt,시군구=='광진구')
sd22 <- subset(gt,시군구=='강북구')
sd23 <- subset(gt,시군구=='금천구')

ssdd<- sum(sd[,4])
ssdd1 <- sum(sd1[,4])
ssdd2 <- sum(sd2[,4])
ssdd3 <- sum(sd3[,4])
ssdd4 <- sum(sd4[,4])
ssdd5 <- sum(sd5[,4])
ssdd6 <- sum(sd6[,4])
ssdd7 <- sum(sd7[,4])
ssdd8 <- sum(sd8[,4])
ssdd9 <- sum(sd9[,4])
ssdd10 <- sum(sd10[,4])
ssdd11 <- sum(sd11[,4])
ssdd12 <- sum(sd12[,4])
ssdd13 <- sum(sd13[,4])
ssdd14 <- sum(sd14[,4])
ssdd15 <- sum(sd15[,4])
ssdd16 <- sum(sd16[,4])
ssdd17 <- sum(sd17[,4])
ssdd18 <- sum(sd18[,4])
ssdd19 <- sum(sd19[,4])
ssdd20 <- sum(sd20[,4])
ssdd21 <- sum(sd21[,4])
ssdd22 <- sum(sd22[,4])
ssdd23 <- sum(sd23[,4])

total <- c(ssdd,ssdd1,ssdd2,ssdd3,ssdd4,ssdd5,ssdd6,ssdd7,ssdd8,ssdd9,ssdd10,ssdd11,ssdd12,ssdd13,ssdd14,ssdd15,ssdd16,ssdd17,ssdd18,ssdd19,ssdd20,ssdd21,ssdd22,ssdd23)
total

names <- c('종로구','중구','용산구','성동구','동대문구','성북구','도봉구','은평구','서대문구','마포구','강서구','구로구','영등포구','동작구','관악구','강남구','송파구','서초구','양천구','중랑구','노원구','광진구','강북구','금천구')

gc <- geocode(enc2utf8(names))
gc

df <- data.frame(names,gc$lon,gc$lat)
df

cen <- c(mean(df$gc.lon),mean(df$gc.lat))
cen

wwe <- data.frame(df,total)
wwe

map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom=11,
                     
                     marker=gc)
ggmap(map)



map <- get_googlemap(center = cen,
                     maptype = 'roadmap',zoom = 12
                     ,markers = gc
                     
                     )
ggmap(map)+
  geom_point(data=wwe,
             aes(x=gc.lon,y=gc.lat,size=total),
             alpha=0.5,col='red')+
  scale_size_continuous(range=c(1,14))

# 문8)
# 7번과 동일한 자료를 이용하여 제주시 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.
