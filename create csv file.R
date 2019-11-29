#csv file 내용 읽기. 

setwd("D:/workR/excel")            #경로지정
air <- read.csv("airquality.csv", header = T)  #csv파일을 읽어오는 방법. 
#데이타 프레임을 만들면 꼭 확인해야한느 작업. 
class(air)
dim(air)
str(air)
head(air)
tail(air)



name <- c('Hong','Kim','Lee')
age <- c(22,20,25)
gender = factor(c('M','F','M'))
blood.type = factor(c('A','B','O'))
person.info <- data.frame(name,age,gender,blood.type)
person.info

setwd("D:/workR/excel")            #경로지정
write.csv(person.info, 'person_info.csv',row.names=F)      #csv파일을 저장하는 방법. 
