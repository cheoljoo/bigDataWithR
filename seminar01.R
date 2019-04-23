# seminar 01 ------------------------
## __ 연산 -----------------------

# if you want to run , press ctrl+enter after selecting multiple lines.
a = 1
b=2
c=a+b
ls()


rm(a)
ls()

rm(list = ls())
ls()

head(data)

iris    # press ctrl + shift + c  when toggle comments
head(x=iris,n=10)   # press tab to show parameters

write.csv(iris,file = "data/iris.csv")  # path is based on project path

head(read.csv("data/iris.csv") )
aaa <- read.csv("data/iris.csv")

CURWD <- getwd()
setwd("~")
list.files(getwd())

setwd(CURWD)

getwd()

1 + 2 * (3+4)
log(43+32+1)
sqrt((4+3)*(2+1))
( (1+2)/(3+4)) ^ 2


## __ 주요 data 형 -------------------

### ___ vector --------------------
x <- c(1,2,3,4,5)
x

x <- 1:100
x

x[5]

x[1,5]  # error -> matrix
x[c(1,5)]  # ok

x <- c(1,2,3,4,5)
1/x
x*2
x+2


x <- c(x,0,x)

x <- 1:15
x <- x*2-1
x


x <- c(1,1,1,1,1)
x
x+2
y<- c(1,2,3)
y
x+y   # 길이다 다른 2개를 연산할때는 , 짧은 것을 길이가 긴 것과 같게 확장시켜서 계산을 해준다.


length(x)


seq (1,30,by = 2)
seq (1,length=10,by=2)
seq(5,length=5,by= -0.5)


x <- 1:3
x
rep(x,4) # times = 4
rep(x, each = 5)


x <- 1:5
x>3
x[x>3]


x<- 1:100
sum(x>15)  # x>15 보다 큰 것의 갯수 : 방법 1
x<- 1:100
x <- x[x>15]    # 방법2 : length(x [x>15] )  [조건]
length(x)
x<- 1:100
length(x [x>15] )

x<- 1:100
mean(x>15)

x<- 1:100
sum( x[x>15])



z <- c(1:3,NA);  z   # missing values
z
is.na(z)

1/0
-1/0

Inf - Inf   # NaN (Not a Number)


### ___ character vector ----------------
c("s","a","n",1)   # 숫자도 문자로 변형..  임
# 다른 type을 저장하기위해서는 list 사용 (python tuple과 같은 것ㅇ)

paste("x","Y" , sep = "\n")
paste("x","Y","z" , sep = "")
paste("X",1:10)    # "x"가 10개짜리 vector로 같이 만들어진다.   이렇게 변수명도 쉽게 생성 가능

# 응용문제 : x1..x3 , y1.. y3  z1 .. z3
paste(rep(c("x","y","z"), each=3) , 1:3 , sep="")



x <- c(1, 2, 3, NA, 5, 6, 7, NA, 9, 10)
x
x[x > 5 & !is.na(x)]


xx <- c("x","y")
xx
xx[1]
xx[1:2]
xx[c(1,2,2,1)]



# 응용문제 : 
xx[ rep(c(1,2,2,1), times=2)]

x <- 1:10
x[-c(5,7)]  # 5,7번째를 제외하고 뽑는다.

x <- 1:10
x[c(5,7)] <- 100
x

x <- 1:10
x[5:7] <- x[5:7]*100
x

x <- 1:10
x[5:7] <- NaN;x  # 5,7까지를 없애고 싶다.
x.remove(x,5:7)



# "X_1" , "X_2" ... 10까지의 분자열을 포함하는 벡터를 만드시오.
paste("X",1:10,sep="_")

# [1,2,3,..,19]의 요소를 포함하는 벡터 v를 만들고 , 짝수 번째 요소만 추출하시요.
x <- 1:19 ; x
x[x %% 2 == 0]
v <- 1:19
v[seq(1,19,by=2)]

# [1,2,3,..,19]의 요소를 포함하는 벡터 v를 만들고 , [1,2,4 ..]과 같이 3간격으로 추출하시오
x <- 1:19 ; x
x[x %% 3 == 0]

# X1,x2,x3 , y1, y2,y3 , z1,z2,z3의 문자열 값을 가지는 벡터를 만드시오.
paste(rep(c("x","y","z") , each=3), 1:3 , sep="")




### ___ matrix -----------------------

# matrix 만드는 방법 1
z <- 1:30
dim(z) <- c(5,6) ;  z    # 데이터를 뿌리는 방향은 열방향
dim(z) <- c(2,5,3); z

z <- 1:30
dim(z) <- c(5,6) ;  z    # 데이터를 뿌리는 방향은 열방향
z[3,4]
z[3,]
z[3:4,]
z[ , 3:4]
z[ ,3]  # vector 형태로 뽑힘.
z[ , 3, drop=FALSE]    # dimension을 유지하면서 뽑는다.

z[c(1,3) , c(1,3)]


# matrix 만드는 방법 2
mat <- matrix(1:25,nrow=5) ; mat

mat <- matrix(1:25,nrow=5, byrow = TRUE) ; mat

ind <- matrix(c(1,3,2,2,3,1), nrow=3,byrow=TRUE); ind   # 뽑고 싶은 정보의 위치만 matrix로 만들면 된다.
mat[ind]
dim(mat)
length(mat)

v <- 1:9
length(v)
dim(v)



matrix(1:30,nrow = 5)



### ___ list --------------------

# list라는 것은 여러가지의 다른 타입의 data를 넣기를 원할때 사용한다.
# python , C++ tuple과 같다.

lst <- list(name = "fred",
            wife = "Mary",
            no.children = 3,
            child.ages = c(4,7,9),
            mat = matrix(1:6,nrow=3)
)

lst$name
lst$child.ages
lst$child.ages[3]
lst$mat[2:3, ]

dim(lst$mat)
nrow(lst$mat)
ncol(lst$mat)
dim(lst$mat)[1]
a <- dim(lst$mat)
a[1]

lst[1]    # [] 리스트의 부분집합
lst[3]
lst[2:3]
class(lst[1])    # class()는 type을 물어보는 함수 이다.
class(lst[2:3])
lst[[4]]   # [[ ]] 대괄호를 2개를 하면 특정 변수의 값을 추출한다.
lst[[4]][3]

# matrix의 2,3번째 행만을 뽑는다.
lst[[5]][2:3, ]

# 추가하고 싶을때
lst$aaa <- 1:10
lst

lst$aaa <- NULL    # 삭제 가느
lst

lst$mat[ ,2] <- lst$mat[,2] * 3 # [,2]에 3을 곱해준다.
lst


# 함수에 argument를 list로 주고 받는다.


reg <- lm(Sepal.Width ~ Sepal.Length, data = iris) ; reg
reg$coefficients
reg$coefficients[0]
reg$coefficients[1]
reg$fitted.values



# 문제 : name , age , sex를 포함하는 list를 생성하시오.
list(
  name = "charles.lee",
  age = 12,  # anti aging
  sex = "M"
)


# 구구단
m <- matrix(1,ncol=9,nrow=9)
m
for(i in 1:9) {
  for(j in 1:9) {
    m[i,j] <- i*j
  }
}
m










### ___ data.frame ------------------------
head(iris)   # data.frame은 list의 특수한 형태 이며 , matrix의 문법도 먹는다.

df <- data.frame(   # column의 수가 모두 같게 입력해야 하다.
  A = 1:5,
  B = 5:1,
  C = c("A",'b',"C",'d','e')
)
df

df$C
# Levels 는 변수의 범주를 나타낸다.
df$B
df$C[3]
df[[1]][2]
df[['A']][2]
class(df[3])
length(df[3])
str(df)

df[2]   # 결과는 data.frame 이다.

# matrix의 문법도 그대로 동작한다.
df[2, ]
df[ , 3, drop=F]
df[3,3]

dim(df)   # data.frame은 matrix의 operation이 모두 가능하다. (length만 다른 값이 나옴)
nrow(df)
ncol(df)

length(df)    # matrix에서는 15이지만, list에서는 3

summary(df)
summary(iris)

# 엑셀에 빈칸이 있을때는 이것을 NA로 읽어온다.
# 엑셀이나 cSV에서 읽는 값은 data.frame
cr <- read.csv("data/Crimes.csv")
head(cr)
class(cr)

install.packages("readxl")
library(readxl)

cr <- read_xlsx("data/exl.xlsx")
head(cr)
class(cr)
b <- read_xlsx("data/exl.xlsx" , sheet = "Sheet2")
b
b <- read_xlsx("data/exl.xlsx" , sheet = 3)
b
c <- read_xlsx("data/exl.xlsx" , range = "Sheet3!D9:F21")
c


## __ for loop & if  ----------------------------

for(i in 1:10){
  print(i)
  cat(i, "----\n\n")
}

for(i in 1:10){
  if(i %% 2 == 1){
    print(i)
  } else {
    cat("none\n")
  }
}



# 1 ~ 100 까지의 누적함
a <- 0
for(i in 1:100){
  a <- a+i
}
a

a <- 1
for(i in 1:10){
  a <- a*i
}
a


# 구구단
for(i in 2:9){
  for(j in 1:9){
    cat(i , "*" , j , " = " , i*j , "\n")
  }
}


### ___ example (lecture 20) : download -----------------
download.file("http://www.iexceller.com/MyXls/Lectures/VisualBasic/VB0002.zip" , destfile = "aaa.zip")

install.packages("stringr")
library(stringr)
str_pad(1,width=4,pad=0)
str_pad(13,width=4,pad=0)

sprintf("%04d",1)

for(i in 1:50){
  a <- str_pad(i,width=4,pad=0)
  b <- paste0("VB" , a , ".zip")
  c <- paste("http://www.iexceller.com/MyXls/Lectures/VisualBasic/VB" , a , ".zip" , sep = "")
  print(c)
  print(b)
  download.file(c,destfile = b)
}


### ___ smartbind in r ------------------
install.packages("gtools")
library(gtools)

df1 <- data.frame(A=1:10, B=LETTERS[1:10], C=rnorm(10) )
df2 <- data.frame(A=11:20, D=rnorm(10), E=letters[1:10] )
df1
df2
smartbind(df1,df2)      # combined based on column

a <- read_xlsx("data/exl.xlsx");a 
b <- read_xlsx("data/exl.xlsx" , sheet = "Sheet2"); b
c <- read_xlsx("data/exl.xlsx" , range = "Sheet3!D9:F21"); c


# browser()
# tibble is different type with data.frame. So we change type with as.data.frame funciton
# 엑셀에서 받은 것은 tribble이므로 data.frame으로 변경하여 사용하면 된다. 
all <- as.data.frame(read_xlsx("data/exl.xlsx", sheet=1))  # all <-  data.frame()
all
for(sh in 2:3){
  data <- as.data.frame(read_xlsx("data/exl.xlsx", sheet=sh))
  print(data)
  all <- smartbind(all , data)
}
all
write.csv(all, "data/all.csv" , na="")

# column 수와 이름이 모두 같을때는 , smartbind대신 rbind 를 써도 된다.


list.files("data","*.csv")



## __ function --------------------------

myFun <- function(){
  
  return()
}

myFun <- function(a=1,b=1){
  out <- a^2 + b^2
  return(out)
}
myFun(2,2)
myFun(2, )
myFun(2)
myFun(b=5)

myCum <- function(n=1){
  cum <- 0
  for(i in 1:n){
    cum <- cum + i
  }
  return(cum)
}
ls()
myCum(5)
myCum(10000)
myCum()


myCalc <- function(a,b){
  # plus = a+b
  # minus = a-b
  # prod = a*b
  # div = a/b
  # 
  # out <- list(
  #   plus = plus,
  #   minus = minus,
  #   prod = prod,
  #   div = div
  # )
  out <- list(
    plus = a+b,
    minus = a-b,
    prod = a*b,
    div = a/b
  )
  return(out)
}
myCalc(3,2)
myCalc(3,2)$plus


rm(list=ls())
ls()

myCum(100)  # error

source("myFunctions.R")  # include
myCum(100)
myCumProd()



