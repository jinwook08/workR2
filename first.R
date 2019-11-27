#
# R 프로그래밍 1일차 
#
#first.R
#
#작성자:jinwook 
#
#최초작성일:2019.11.26
#
#
print("Hello, World!!")

number <- 10 
number2 = 100
number3 <- number

numberValue <- 1                  #camel 표기법
str_value <- "R Language"         #snake 표기법 
booleanvalue <- TRUE

numberValue <- "R script"
numberValue <- 1

print(numberValue)
print(str_value)
print(booleanvalue)

#print와 cat은 읽기 기능입니다. 

cat("Numeric number:", numberValue,"\n" )
cat("string:", str_value,"\n")
cat("Boolean value:", booleanvalue,"\n")


numberValue <- scan()       #input기능입니다.//쓰기 기능입니다.  
cat("Numeric number:", numberValue,"\n" )









