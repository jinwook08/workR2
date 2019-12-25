
library(ggmap)
register_google(key='AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g')
gc <- geocode(enc2utf8('한국'))
gc

cen <- as.numeric(gc)

map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     markers = gc)

names <- c('서울서부','서울','경기','부산','대전세종',
           '인천','대구','경남','광주','울산','전북','강원',
           '경기북부','충북','경북','제주','전남','충남')
addr <- c('서울특별시 금천구 가산디지털1로 181',
          '서울특별시 강남구 역삼로 169 명우빌딩',
          '경기도 수원시 영통구 이의동 906-5',
          '부산광역시 사상구 학감대로 257',
          '대전광역시 서구 청사로 136',
          '인천광역시 연수구 갯벌로 12',
          '대구광역시 북구 엑스코로 10 엑스코',
          '경상남도 창원시 의창구 원이대로 362',
          '광주광역시 서구 상무중앙로 84',
          '울산광역시 남구 삼산로 274',
          '전라북도 전주시 완산구 홍산로 276번지',
          '강원도 춘천시 중앙로 54',
          '경기도 고양시 일산동구 일산로 138',
          '충청북도 청주시 흥덕구 풍산로 50',
          '경상북도 구미시 이계북로 7',
          '제주특별자치도 제주시 연삼로 473',
          '전라남도 무안군 삼향읍 오룡3길 2',
          '충청남도 천안시 서북구 광장로 215'
          )

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names,lon=gc$lon,
                 lat=gc$lat)

cen <- c(mean(df$lon),mean(df$lat))



gd <- geocode(enc2utf8('한국'))
gd

can <- as.numeric(gd)

mp <- get_googlemap(center = cen,
                    zoom = 6,
                    maptype = 'roadmap',
                    markers = gc)
ggmap(mp)

