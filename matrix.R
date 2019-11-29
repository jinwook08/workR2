#matrix 생성

z <-  matrix(1:20,nrow = 4)
z

z <- matrix(1:20, ncol = 4)
z

z <- matrix(1:20,nrow = 4,ncol = 5)
z

###열 우선 방식이라고 한다.   (변수 중심으로 본다. )
###R에서는 특별하게 지정하지 않으면 열 우선 방식을 사용한다. 

z <- matrix(1:20, nrow=4, ncol = 5, byrow= T)
z


###행 우선 방식이다. 

x <- 1:4
x
y <- 5:8
y
z <- matrix(1:20,nrow = 4, ncol = 5)
z

m1 <- cbind(x,y)
m1
m2 <- rbind(x,y)
m2
m3 <- rbind(m2,y)
m3
m4 <- cbind(z,y)
m4






#matrix에서 cell의 값 추출

x <- 1:4
x
y <- 5:8
y
z <- matrix(1:20,nrow = 4, ncol = 5)
z


z[2,3]
z[1,4]
z[2,]
z[,4]

z[2,1:3]
z[1,c(1,2,4)]
z[1:2,]
z[,c(1,4)]


#matrix에서 행/열에 이름 지정
score <- matrix(c(90,85,69,78,
                  85,86,56,33,
                  34,66,88,22),nrow=4,ncol = 3)
score
rownames(score) <- c('CHA','KIM','LEE','HYUN')
colnames(score) <- c('English','MATH','science')
score

score['CHA','MATH']
score['KIM',c('MATH','science')]
score['LEE']
score[,'English']
rownames(score)
colnames(score)
colnames(score)[2]












