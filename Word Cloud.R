#
#워드클라우드(Word Cloud)
# #
# #
# 한글 워드 클라우드 설치
# 1.java 실행환경 구축
# 2.자료수집(Text 자료)
#   2.1 text file 형태로 수집
#   2.2 web scraping을 이용하여 수집
#3.명사추출.
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_231')                  #자바 실행환경 위치 설정. 

#필요시 설치
install.packages('wordcloud')   #word cloud
install.packages('wordcloud2')     #word cloud
install.packages('KoNLP')               #한국어 처리
install.packages("RColorBrewer")        #색상 선택
library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)
library(dplyr)
library(ggplot2)
setwd('C:/Users/ICT01_22/Desktop/새 폴더 (2)')
text <- readLines('mis_document.txt',encoding = 'UTF-8')
text
##텍스트 파일을 열때에는 항상 마지막에 공백이 있어야 오류가 적게 나올 수 있다. 따라서 텍스트 파일을 만들때는 마지막 끝에 공백을 넣어두는게 좋다. 
#또한 리눅스와 윈도우가 텍스트 파일을 다루는 방법이 다르기 때문에 주의해서 사용해야한다. 
##공백이 없을 때 나는 에러:'In readLines("mis_document.txt", encoding = "UTF-8") :
# 'mis_document.txt'에서 불완전한 마지막 행이 발견되었습니다'


###분리 하기 
##우리말씀 한글 사전 로딩 하기 
buildDictionary(ext_dic = 'woorimalsam')
pal2 <- brewer.pal(8,'Dark2')#색상 팔레트 생성
noun <- sapply(text,extractNoun,USE.NAMES =F)# 명사 추출
noun

##extractNoun--> 명사 추출해라.
##텍스트 마이닝--> 명사의 빈도수를 체크하여 시각화.

#4.추출된 명사 빈도수 계산 및 시각화하기.



noun2 <- unlist(noun)#list ->vector로 변환
wordcount <- table(noun2)
sort.noun <- sort(wordcount,decreasing = T)[1:10]
sort.noun
sort.noun <- sort.noun[-1]
barplot(sort.noun,names.arg = names(sort.noun),
        col = 'steelblue',main='빈도수 높은 단어',
        ylab='단어 빈도수')

##추출할때 잘못하면 값이 실제 텍스트에서의 값과는 다르게 나올 수 있다. 


df <- as.data.frame(sort.noun)
df
ggplot(df,aes(x=df$noun2,y=df$Freq))+
  geom_bar(stat= 'identity',   ##y축으로 표현하는것.
           width = 0.7,
           fill='steelblue')+
  ggtitle('빈도수 높은 단어')+
  theme(plot.title = element_text(size=25,
                                  face='bold',
                                  colour = 'steelblue',
                                  hjust = 0,
                                  vjust = 1))+
  labs(x='명사',y='단어빈도수')+
  geom_text(aes(label=df$Freq),hjust=-0.3)+   ##빈도표시
  coord_flip()
##가로로 누운게 더 많은 데이터를 표현가능.

pal3 <- brewer.pal(9,'Reds')[5:9] #팔레트 색 다른것도 가능하다. 



wordcloud(names(wordcount),  #단어
          freq = wordcount,  #단어 빈도
          scale = c(6,0.7),  #단어폰트크기(최대,최소)
          min.freq = 3,      #단어최소빈도 #최하 이정도 이상은 되는 애들만 나오게 해라. 
          random.order = F,  #단어출력위치
          rot.per = .1,      #90도 회전다어 비율
          colors = pal3)     #단어 색. 


#6. 전처리 과정 수행
  # 6.1 불필요한 단어 삭제
  # 6.2 생략된 단어를 사전에 등재
  # 


##생략된 단어 사전에 등재    
buildDictionary(ext_dic = 'woorimalsam',
                user_dic = data.frame('정치','ncn'),  ##ncn은 명사를 뜻한다. 
                replace_usr_dic=T)
noun <- sapply(text, extractNoun,USE.NAMES = T)
noun2 <- unlist(noun)     ##리스트를 백터로 잡음

##불필요한 단어 삭제. 
noun2 <- noun2[nchar(noun2)>1]      ##길이가 1보다 작은거 삭제/.
noun2 <- gsub('하지','',noun2)     ##이런 단어를 ''으로 바꾸겠다. 결국 지우겠다.  
noun2 <- gsub('때문','',noun2)
wordcount <- table(noun2)

brewer.pal.info

##다시한번 워드 클라우드를 실행하면
wordcloud(names(wordcount),  #단어
          freq = wordcount,  #단어 빈도
          scale = c(6,0.7),  #단어폰트크기(최대,최소)
          min.freq = 3,      #단어최소빈도 #최하 이정도 이상은 되는 애들만 나오게 해라. 
          random.order = F,  #단어출력위치
          rot.per = .1,      #90도 회전다어 비율
          colors = pal3)     #단어 색. 

##위에서 지운값들이 빠지는것을 볼 수 있다. 
##사전에 단어를 등록하면 새롭게 단어를 추출해야한다. 
##그래야만 등록한 단어가 다시 추출된다. 


# 

#애국가 형태소 분석
library(KoNLP)
useSystemDic()
useSejongDic()
useNIADic()
# 애국가 가사
# 
# https://www.mois.go.kr/frt/sub/a06/b08/nationalIcon_3/screen.do


# 1.사전 설정

useSejongDic()


# 2.텍스트 데이터 가져오기

word_data <- readLines('애국가(가사).txt')
word_data

# 3. 명사 추출
word_data2 <- sapply(word_data,extractNoun, USE.NAMES = F)
word_data2
###사전에 따라서 추출되는것이 다를수 있다. 

#3.1 제대로 출되지 않은 단어를 사용자 사전에 등록
add_words <- c('백두산','남산','철갑','가을','하늘','하느님','바람','삼천리','서리','기상')
buildDictionary(user_dic = data.frame(add_words,
                rep('ncn',length(add_words))),
                replace_usr_dic = T)
get_dictionary('user_dic')
##사전에 단어를 추가 했으므로 새롭게 명사 추출

word_data2 <- sapply(word_data,extractNoun, USE.NAMES = F)
word_data2

#4.행렬을 벡터로 변환
undata <- unlist(word_data2)

#5.사용 빈도 확인
word_table <- table(undata)
word_table

#6. 필터링 작업: 두 글자 이상 단어만 선별, 공백이나 한 자리 문자를 걸러냄. 

undata2 <- undata[nchar(undata)>=2]
undata2

word_table2 <- table(undata2)
word_table2

#7. 데이터 정렬
sort(word_table2,decreasing = T)

#애국가 형태 분석 완료
#가장 기본적인 전처리만 수행, 100% 정확한 데이터라 볼 수 없음

#8.word cloud 작성 후 분석
library(wordcloud2)
wordcloud2(word_table2)


#8.1 배경 및 색상 변경
wordcloud2(word_table2,
           color='random-light',
           backgroundColor = 'black')

#8.2모양 변경

wordcloud2(word_table2,
           fontFamily = '맑은고딕',
           size=1.2,color='random-light',
           backgroundColor='black',
           shape='star')


#8.3 선택 색상 반복
wordcloud2(word_table2,size=1.6,
           color=rep_len(c('red','blue'),
                         nrow(word_table2)))



wordcloud2(demoFreq,size=1.6,
           color=rep_len(c('red','blue'),
                         nrow(word_table2)))


#8.4 일정 방향 정렬

wordcloud2(word_table2,
           minRotation = -pi/6,
           maxRotation = -pi/6,
           rotateRatio = 1)



wordcloud2(demoFreq,
           minRotation = -pi/6,
           maxRotation = -pi/6,
           rotateRatio = 1)


##시각화는 잘 설명하기 위한 목적이다. 













