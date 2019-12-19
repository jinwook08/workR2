data <- data.frame(
  category=c("청년 일자리 지원사업",'청년 창업 지원사업'),
  count=c(89.7 , 10.3 )
)

# Compute percentages
data$fraction <- data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax <- cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin <- c(0, head(data$ymax, n=-1))

# Compute label position
data$labelPosition <- (data$ymax + data$ymin) / 2

# Compute a good label
data$label <- paste0(data$category, "\n : ", data$count)

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=ifelse(data$count==89.7, 'orange','grey'))) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=4) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")



setwd('C:/Users/ICT01_06/Desktop/시각화 자료/새 폴더/불참이유')
tt<- read.csv('total불참2.csv',as.is=TRUE,header = F)
str(tt)
tt
View(tt)
tt2<- t(tt)
tt2
as.numeric(tt2[,3])
str(tt2)
tt3<- tt2[c(-1,-7,-13,-19),]
tt4<- tt3[,3]
tt4

str(tt4)
tt4 <- as.numeric(tt4)
str(tt4)


# Create test data.
data2015 <- data.frame(
  category=c("실질적인 도움이 되지 않아서", "지원절차가 어려워서", "원하는 지원사업이 없어서",'지원사업 시행에 대해 알지 못해서','기타'),
  count=c(10.6, 6.9, 5.8,70.2,6.5)
)

# Compute percentages
data2015$fraction <- data2015$count / sum(data2015$count)

# Compute the cumulative percentages (top of each rectangle)
data2015$ymax <- cumsum(data2015$fraction)

# Compute the bottom of each rectangle
data2015$ymin <- c(0, head(data2015$ymax, n=-1))

# Compute label position
data2015$labelPosition <- (data2015$ymax + data2015$ymin) / 2

# Compute a good label
data2015$label <- paste0(data2015$category, "\n : ", data2015$count)

# Make the plot
ggplot(data2015, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=ifelse(data2015$count==70.2, 'orange','gray'))) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=4) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")



# Create test data.
data2016 <- data.frame(
  category=c("실질적인 도움이 되지 않아서", "지원절차가 어려워서", "원하는 지원사업이 없어서",'지원사업 시행에 대해 알지 못해서','기타'),
  count=c(7.2,  4.5,  7.3, 78.4,  2.6)
)

# Compute percentages
data2016$fraction <- data2016$count / sum(data2016$count)

# Compute the cumulative percentages (top of each rectangle)
data2016$ymax <- cumsum(data2016$fraction)

# Compute the bottom of each rectangle
data2016$ymin <- c(0, head(data2016$ymax, n=-1))

# Compute label position
data2016$labelPosition <- (data2016$ymax + data2016$ymin) / 2

# Compute a good label
data2016$label <- paste0(data2016$category, "\n : ", data2016$count)

# Make the plot
ggplot(data2016, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=ifelse(data2016$count==78.4, 'orange','gray'))) +
  geom_rect() +
  geom_label( x=4.2, aes(y=labelPosition, label=label), size=3) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")



# Create test data.
data2017 <- data.frame(
  category=c("실질적인 도움이 되지 않아서", "지원절차가 어려워서", "원하는 지원사업이 없어서",'지원사업 시행에 대해 알지 못해서','기타'),
  count=c(12.5, 6 , 7.9 ,73.3 , 0.2)
)

# Compute percentages
data2017$fraction <- data2017$count / sum(data2017$count)

# Compute the cumulative percentages (top of each rectangle)
data2017$ymax <- cumsum(data2017$fraction)

# Compute the bottom of each rectangle
data2017$ymin <- c(0, head(data2017$ymax, n=-1))

# Compute label position
data2017$labelPosition <- (data2017$ymax + data2017$ymin) / 2

# Compute a good label
data2017$label <- paste0(data2017$category, "\n : ", data2017$count)

# Make the plot
ggplot(data2017, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=ifelse(data2017$count==73.3, 'orange','gray'))) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=4) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")



# Create test data.
data2018 <- data.frame(
  category=c("실질적인 도움이 되지 않아서", "지원절차가 어려워서", "원하는 지원사업이 없어서",'지원사업 시행에 대해 알지 못해서','기타'),
  count=c(4.2,  5.4,  3.7, 86.7 , 0)
)

# Compute percentages
data2018$fraction <- data2018$count / sum(data2018$count)

# Compute the cumulative percentages (top of each rectangle)
data2018$ymax <- cumsum(data2018$fraction)

# Compute the bottom of each rectangle
data2018$ymin <- c(0, head(data2018$ymax, n=-1))

# Compute label position
data2018$labelPosition <- (data2018$ymax + data2018$ymin) / 2

# Compute a good label
data2018$label <- paste0(data2018$category, "\n : ", data2018$count)

# Make the plot
ggplot(data2018, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=ifelse(data2018$count==86.7, 'orange','gray'))) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")




setwd('C:/Users/ICT01_06/Desktop/시각화 자료/새 폴더/창업교육 만족도')
ck <- read.csv('창업교육 만족도 조사 결과15~18 2종합.csv',as.is=T,header=F)
ck
str(ck)
t1<- t(ck)
t1
ck2015 <- t1[1:5,]
ck2015
View(ck2015)
ck2015 <- as.data.frame(ck2015)
colnames(ck2015) <- c('a','b','c')
ck2015$a <- as.character(ck2015$a)
ck2015$a <- as.numeric(ck2015$a)

ck2015$c <- as.character(ck2015$c)
ck2015$c <- as.numeric(ck2015$c)
str(ck2015)
ck2015$c


##창업교육만족도2015
ck2015 <- data.frame(
  category=c("매우불만", "불만", "보통",'만족','매우만족'),
  count=ck2015$c
)

# Compute percentages
ck2015$fraction <-ck2015$count / sum(ck2015$count)

# Compute the cumulative percentages (top of each rectangle)
ck2015$ymax <- cumsum(ck2015$fraction)

# Compute the bottom of each rectangle
ck2015$ymin <- c(0, head(ck2015$ymax, n=-1))

# Compute label position
ck2015$labelPosition <- (ck2015$ymax + ck2015$ymin) / 2

# Compute a good label
ck2015$label <- paste0(ck2015$category, "\n : ", ck2015$count)

# Make the plot
ggplot(ck2015, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3,fill=category )) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")

t1
ck2016 <- t1[6:10,]
ck2016
View(ck2016)
ck2016 <- as.data.frame(ck2016)
colnames(ck2016) <- c('a','b','c')
ck2016$a <- as.character(ck2016$a)
ck2016$a <- as.numeric(ck2016$a)

ck2016$c <- as.character(ck2016$c)
ck2016$c <- as.numeric(ck2016$c)
str(ck2016)
ck2016$c


##창업교육만족도2016
ck2016 <- data.frame(
  category=c("매우불만", "불만", "보통",'만족','매우만족'),
  count=ck2016$c
)

# Compute percentages
ck2016$fraction <-ck2016$count / sum( ck2016$count)

# Compute the cumulative percentages (top of each rectangle)
ck2016$ymax <- cumsum(ck2016$fraction)

# Compute the bottom of each rectangle
ck2016$ymin <- c(0, head(ck2016$ymax, n=-1))

# Compute label position
ck2016$labelPosition <- (ck2016$ymax + ck2016$ymin) / 2

# Compute a good label
ck2016$label <- paste0(ck2016$category, "\n : ", ck2016$count)

# Make the plot
ggplot(ck2016, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3,fill=category )) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")





t1
ck2017 <- t1[11:15,]
ck2017
View(ck2017)
ck2017 <- as.data.frame(ck2017)
colnames(ck2017) <- c('a','b','c')
ck2017$a <- as.character(ck2017$a)
ck2017$a <- as.numeric(ck2017$a)

ck2017$c <- as.character(ck2017$c)
ck2017$c <- as.numeric(ck2017$c)
str(ck2017)
ck2017$c





##창업교육만족도2016
ck2017 <- data.frame(
  category=c("매우불만", "불만", "보통",'만족','매우만족'),
  count=ck2017$c
)

# Compute percentages
ck2017$fraction <-ck2017$count / sum( ck2017$count)

# Compute the cumulative percentages (top of each rectangle)
ck2017$ymax <- cumsum(ck2017$fraction)

# Compute the bottom of each rectangle
ck2017$ymin <- c(0, head(ck2017$ymax, n=-1))

# Compute label position
ck2017$labelPosition <- (ck2017$ymax + ck2017$ymin) / 2

# Compute a good label
ck2017$label <- paste0(ck2017$category, "\n : ", ck2017$count)

# Make the plot
ggplot(ck2017, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3,fill=category )) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")






t1
ck2018 <- t1[16:20,]
ck2018
View(ck2018)
ck2018 <- as.data.frame(ck2018)
colnames(ck2018) <- c('a','b','c')
ck2018$a <- as.character(ck2018$a)
ck2018$a <- as.numeric(ck2018$a)

ck2018$c <- as.character(ck2018$c)
ck2018$c <- as.numeric(ck2018$c)
str(ck2018)
ck2018$c





##창업교육만족도2016
ck2018 <- data.frame(
  category=c("매우불만", "불만", "보통",'만족','매우만족'),
  count=ck2018$c
)

# Compute percentages
ck2018$fraction <-ck2018$count / sum( ck2018$count)

# Compute the cumulative percentages (top of each rectangle)
ck2018$ymax <- cumsum(ck2018$fraction)

# Compute the bottom of each rectangle
ck2018$ymin <- c(0, head(ck2018$ymax, n=-1))

# Compute label position
ck2018$labelPosition <- (ck2018$ymax + ck2018$ymin) / 2

# Compute a good label
ck2018$label <- paste0(ck2018$category, "\n : ", ck2018$count)

# Make the plot
ggplot(ck2018, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3,fill=category )) +
  geom_rect() +
  geom_label( x=4, aes(y=labelPosition, label=label), size=3) +
  scale_fill_brewer(palette=7) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")





