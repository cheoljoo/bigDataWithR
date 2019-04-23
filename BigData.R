# [1st Day] -------------------

??logarithm

log(x = 4,base = 2)


# when you run , press ctrl+enter after selecting multiple lines.
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



# example ---------------------------------------------------------
# ctrl + shift + R : create section (bookmark)  - bottom of this window


# make a project

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

# d3.js --------------------------------

# Load package (팩키지 설치, 연결)
install.packages("networkD3")
library(networkD3)

# Load data (데이터 읽어오기)  : libaray에 내장되어져있는 data
data(MisLinks)
data(MisNodes)

# Plot (그림 그리기)
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8,Nodesize = "size",legend =TRUE )


# Load package
library(networkD3)

# Create fake data
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)

# Plot
simpleNetwork(networkData)


# P28
# Load package (팩키지 설치, 연결)
library(networkD3)

# Load data (데이터 읽어오기)
getwd()
MyLinks <- read.csv("data/MyLinks.csv")
MyNodes <- read.csv("data/MyNodes.csv")

# Plot (그림 그리기)
forceNetwork(Links = MyLinks, Nodes = MyNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8,Nodesize = "size",legend =TRUE )


# Load package (팩키지 설치, 불러오기)
install.packages("leaflet")
library(leaflet)
leaflet() %>% 
  addTiles() %>%
  addMarkers(lng=126.98, lat=37.54,popup='anyPlace')

leaflet() %>% 
  setView(lng=126.98,lat=37.54,zoom=12) %>% 
  addTiles() %>% 
  addProviderTiles(providers$Stamen.Toner) 


# [R} leaflet으로 google에서 찾아서 image를 찾아라.  들어가면 소스가 있을 확률이 높다.]


#library
library(leaflet)

# Create 10 markers (Random points)
data=data.frame(long=sample(seq(-150,150),10) ,  lat=sample(seq(-50,50),10) , val=round(rnorm(10),2) , name=paste("point",letters[1:10],sep="_")  ) 

# Show a marker at each position
m=leaflet(data = data) %>% addTiles() %>% addMarkers(~long, ~lat, popup = ~as.character(name))
# addTiles: 지도를 그림

m   # 여기 assign만한 m을 수행시켜주어야 그림이 나온다.



# R language ----------------

# 강의 자료도 R로 html을 만들었다.

# lecture 1 : data structure : vector ----------------------

# vector 는 c(...) 함수 로 만들어준다.  숫자나 문자의 나열
x <- c(1,2,3,4,5)
x

x <- 1:100
x

x[5]

x[1,5]  # error
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
x <- x[x>15]    # 방법2 : length(x [x>15] )
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


# character vector
c("s","a","n",1)   # 숫자도 문자로 변형..

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






# lecture 2 : matrix -----------------------

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


mat <- matrix(1:25,nrow=5) ; mat

mat <- matrix(1:25,nrow=5, byrow = TRUE) ; mat

ind <- matrix(c(1,3,2,2,3,1), nrow=3,byrow=TRUE); ind   # 뽑고 싶은 정보의 위치만 matrix로 만들면 된다.
mat[ind]
dim(mat)
length(mat)
 
v <- 1;9
length(v)
dim(v)



matrix(1:30,nrow = 5)



# list --------------------

# list라는 것은 여러가지의 다른 타입의 data를 넣기를 원할때 사용한다.

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
class(lst[1])
class(lst[2:3])
lst[[4]]   # [[ ]] 대괄호를 2개를 하면 특정 변수의 값을 추출한다.
lst[[4]][3]

# matrix의 2,3번째 행만을 뽑는다.
lst[[5]][2:3, ]


# 함수에 argument를 list로 주고 받는다.


reg <- lm(Sepal.Width ~ Sepal.Length, data = iris) ; reg
reg$coefficients
reg$coefficients[0]
reg$coefficients[1]
reg$fitted.values

# 추가하고 싶을때
lst$aaa <- 1:10
lst

lst$aaa <- NULL    # 삭제 가느
lst

lst$mat[ ,2] <- lst$mat[,2] * 3 # [,2]에 3을 곱해준다.
lst


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

head(iris)
iris$Species
iris$Species
iris$Sepal.Length[20]
iris$Sepal.Width
iris
names(iris)
dim(iris)

species <- levels(iris$Species)
species
# species["Levels"]
# mean(iris$Sepal.Length )


species <- levels(iris$Species)
names(iris)
species
species[2]
length(species)

library(dplyr)
summary(iris)
virginica <- filter(iris, iris$Species == "virginica")
head(virginica) # This dispalys the first six rows
mean(virginica$Sepal.Width)
tapply(iris$Sepal.Length, iris$Species,mean)
tapply(iris$Sepal.Width, iris$Species,mean)
tapply(iris$Petal.Length, iris$Species,mean)
tapply(iris$Petal.Width, iris$Species,mean)
tapply(iris$Sepal.Length, iris$Species,sd)
tapply(iris$Sepal.Width, iris$Species,sd)
tapply(iris$Petal.Length, iris$Species,sd)
tapply(iris$Petal.Width, iris$Species,sd)


result <- 0
nn <- names(iris)[1:4]
nn
nn[2]
#iris[nn[2]]
for(s in nn){
  s    # 이렇게 하면 화면에는 찍지 않는다.
}
for(s in nn){
 print(s)
}
for(s in nn){
  m<- tapply(iris[[s]], iris$Species,mean)
  cat("Mean of " ,s , "\n")
  print(m)
  sd<- tapply(iris[[s]], iris$Species,sd)
  cat("Standard Variant of " ,s , "\n")
  print(sd)
}

cnt <- 1
for(j in 1:150){
  cnt[j] <- iris$Sepal.Width[j]
}
cnt


mySum <- function( x1=1, x2=2){
  out <- x1^3 + x2^3
  return(out)
}
mySum()
mySum(100,22)



# [2nd Day] --------------------

# 복습  -----------------
# ctrl + O
# ctrl + C
# ctrl + M
# alt + -

head(iris)

read.csv("data/a.csv")
getwd()

install.packages("ggplot2")
library(ggplot2)  # 오른쪽의 packages안에서 check를 해두면 기본적으로 library를 load해주게 된다.

ggplot(iris,aes(Sepal.Length,Sepal.Width)) + geom_point() + geom_line()

x <- c(1,2,3,4,5,6)
x[c(2,4)]
4:6
seq(1,5)
seq(1,100,by=3)
seq (1,length=10 , by = 5)

rep (x,3)
rep (x, each =3)

aa <- c("orange","banana",'apple')   # 문자를 선택한후에 ' 을 눌러주면 앞뒤에 자동으로 붙는다.

paste("X",1:5)

x + 2
x[4:5] <- x[4:5]*100 ; x

# NA , Inf , NaN
is.na()
length()

mat <- matrix(1:30,ncol=5,byrow=T)  ; mat
mat[2:4, ]
mat[ , 3, drop=F]
dim(mat)
nrow(mat)  #dim(mat)[1]
ncol(mat)  #dim(mat)[2]
class(dim(mat))

mat <- matrix(1:30,ncol=5,byrow=T)  ; mat
ind <- matrix(c(1,3,2,4,3,5),nrow=3,byrow=T) ; ind
mat[ind]

lst <- list(
  name = "kevin",
  age=30
)

lst[1:2]
lst[[1]]
lst[[1:2]] # error
lst$name
lst["name"]
lst[["name"]]
class(lst[2])
length(lst[4])  # 안의 변수의 갯수    1
length(lst)     # 안의 변수의 갯수    2
lst[[1]][1]


# data.frame ------------------------
head(iris)   # data.frame은 list의 특수한 형태 이며 , matrix의 문법도 먹는다.

df <- data.frame(
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

dim(df)
nrow(df)
ncol(df)

length(df)    # matrix에서는 15이지만, list에서는 3

summary(df)
summary(iris)

# 엑셀에 빈칸이 있을때는 이것을 NA로 읽어온다.
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


# for loop & if  ----------------------------

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


# lecture 20 : download -----------------
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


# smartbind in r ------------------
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
# tibble is different type with data.frame. So we change type wi as.data.frame funciton
all <- as.data.frame(read_xlsx("data/exl.xlsx", sheet=1))  # all <-  data.frame()
for(sh in 2:3){
  data <- as.data.frame(read_xlsx("data/exl.xlsx", sheet=sh))
  print(data)
  all <- smartbind(all , data)
}
all
write.csv(all, "data/all.csv" , na="")

# column 수가 모두 같을때는 , smartbind대신 rbind 를 써도 된다.


list.files("data","*.csv")



# function --------------------------

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

source("myFunctions.R")
myCum(100)
myCumProd()



# lecture 4 : ggplot2 --------------------

head(iris,4)

# 내일 width , length만 넣으면 어떤 품종인지를 찾아줌.

library(ggplot2)
# Sepal.Length Sepal.Width Petal.Length Petal.Width Species
ggplot(iris, aes(Sepal.Length,Sepal.Width)) + geom_point()
g <- ggplot(iris, aes(Sepal.Length,Sepal.Width))   # canvas: before drawing the point
g + geom_point()
g + geom_line()
g + geom_point() + geom_line()

# color as Species
# aes is related to the data  (data:iris's variables)
ggplot(iris, aes(Sepal.Length,Sepal.Width,color=Species)) + geom_point(size=5,alpha=0.5)

# change the point size accroding to Sepal.Length
ggplot(iris, aes(Sepal.Length,Sepal.Width,color=Species,size=Sepal.Length)) + 
  geom_point(alpha=0.5)

# 품종에 따라 그림을 쪼갠다.
ggplot(iris, aes(Sepal.Length,Sepal.Width,color=Species,size=Sepal.Length)) +
   geom_point(alpha=0.5) +
   facet_wrap( ~ Species , nrow=2)
# 만약 범주형 변수가 2개이면 facet_grid 로 격자형으로 그릴수 있다.


# ggplot2 cheat sheet :  https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
# ggplot2 libary : https://plot.ly/ggplot2/

# different shape according to kinds & change the title of X axis
ggplot(iris, aes(Sepal.Length,Sepal.Width,color=Species,size=Sepal.Length,shape = Species)) +
  geom_point(alpha=0.5) +
  facet_wrap( ~ Species , nrow=2) +
  xlab("SL")

# ~을 언제 붙여야 할지는 문법이라고 보고 외워라. 실제로는 vars(이름)  을 ~ 이름  으로 간단히 사용하는 것으로 보인다.



# 구글에서 그림을 보고 찾아서 해당 소스를 찾아 사용한다.

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width,fill=Species,color=Species,size=Sepal.Length)) +
  geom_boxplot(outlier.shape=8)

install.packages("MASS")
library(MASS)
head(birthwt,3)
# low age lwt race smoke ptl ht ui ftv  bwt
# race 같은 것은 숫자로 인식하여 연속형으처 처리하는데 ,우리는 string으로 인식하기를 원함.
# str : structure로 각 변수의 type이 무엇으로 되어져있는지 확인해야함. 
str(birthwt)
library(ggplot2)
ggplot(birthwt, aes(race,bwt)) +
  geom_boxplot()
#   factor라는 함수로 연속형을 범주형으로 변경해주어야 한다.
ggplot(birthwt, aes(factor(race),bwt, color=factor(race))) +
  geom_boxplot()
ggplot(birthwt, aes(factor(race),bwt, color=race)) +
  geom_boxplot()
# 흡연 여부에 따라
ggplot(birthwt, aes(factor(smoke),bwt, color=factor(smoke))) +
  geom_boxplot()

# 초기에 이렇게 바꿔두면 나중에 factor로 변환할 필요가 없다.  미리 바꿔두는게 편리하다.
birthwt$race <- as.factor(birthwt$race)
birthwt$smoke <- as.factor(birthwt$smoke)
str(birthwt)
ggplot(birthwt, aes(smoke,bwt, color=smoke)) +
  geom_boxplot()


# lecture 4 : 1.6.3에 색에 대한 표도 모두 적어두었음.
ggplot(faithful, aes(waiting)) +
  geom_histogram(bins=20, color='red' , fill='orange') # 막대수가 20개


# iris로 sepal.length를 histroygram으로 그릴 것
head(iris,4)
ggplot(iris,aes(Petal.Length, fill = Species)) +
  geom_histogram(bins=20,color="blue",alpha=0.7)
# virginica가 Petal Length가 제일 큰 품종이라는 것을 쉽게 볼수 있다. 

ggplot(iris,aes(Petal.Width, fill = Species)) +
  geom_histogram(bins=20,color="blue",alpha=0.7)

# aes_string으로 사용하면 변수명을 string으로 넣을수 있다.
ggplot(iris,aes_string('Petal.Width', fill = 'Species')) +
  geom_histogram(bins=20,color="blue",alpha=0.7)

# loop를 돌면서 자동으로 만들어줌. ggsave()를 이용하면 저장도 할수 있다.
nn <- names(iris)[1:4]
for(i in nn){
  g <- ggplot(iris,aes_string(i, fill = 'Species')) +
    geom_histogram(bins=20,color="blue",alpha=0.7)
  ggsave(paste0(i,".png"))
  print(g)
}


# line plot 으로 시계열 차트 : 연도별로 날씨를 나타내는 데이터
data <- read.csv("data/climate.csv")
head(data)
nrow(data)
# Source Year Anomaly.1y Anomaly.5y Anomaly.10y Unc.10y
ggplot(data,aes(Year,Anomaly.1y)) + geom_line(color='blue')

# 새로운 선도 같이 추가하고 싶을때
ggplot(data,aes(Year,Anomaly.1y)) + 
  geom_line(color='blue') +
  geom_line(aes(Year,Anomaly.10y,color='red'))

install.packages("tidyr")
library(tidyr)
# 여기서는 gather 라는 함수를 사용할수 있게 한다.   여러개의 data를 모으는데 이용하는 것으로 보인다. 



# data를 직접 입력 ,  no를 Cheart옆에 annotation을 달고 싶다.
dfn <- read.table(header=T, text='
                                  supp dose length
                                    OJ  0.5  13.23
                                    OJ  1.0  22.70
                                    OJ  2.0  26.06
                                    VC  0.5   7.98
                                    VC  1.0  16.77
                                    VC  2.0  26.14'
)
dfn$no <- 1:6
dfn
ggplot(dfn,aes(dose,length,color=supp)) + geom_line() + geom_point() +
  geom_text(label=rownames(dfn))




# bar plots
ggplot(iris,aes(Species,Sepal.Length)) + geom_bar(stat='identity')


# 동적인 그림 만들기
install.packages("plotly")
library(ggplot2)
library(plotly)
g <- ggplot(iris,aes(Petal.Length,Petal.Width,size=Species,color=Species)) +
  geom_point(alpha=0.7)

ggplotly(g)



# data 변환 (long)  ---------------------
head(iris,2)  
# variable 에 각 field들의 이름이 들어가 있어야지만, 이 variable을 보고 fill 값에 넣어 누적되는 값들을 다른 색으로 구분할수 있다.
# Wide Data : Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# long data : Species , var(위의 2가지) , value (실제 값) 으로 길게 쭉 들어가져있다.
#  long data이 장점 pivot을 작업하기 좋다.   하나의 변수에 값들이 모여져있어야 한다.
# wide -> long으로 변환하는 것이 tidyr::gather 이다.
#   Data/long_data.csv 로 전조
install.packages("tidyr")
library(tidyr)
# gather , spread
# 여기서는 gather 라는 함수를 사용할수 있게 한다.   
# 여러개의 data를 모으는데 이용하는 것으로 보인다.

wide <- read.csv("data/wide_data.csv")
head(wide)
dim(wide)
long <- gather(wide, month , sales, 2:13); long
gather(wide, month , sales, -1)
gather(wide, month , sales, -업종)
write.csv(long, "data/long_data.csv")
spread(long,month,sales)




head(iris)
long <- gather(iris,var,value,1:4)
long
ggplot(long,aes(Species,value,fill=var)) + geom_bar(stat='identity', position = "fill")
ggplot(long,aes(Species,value,fill=var)) + geom_bar(stat='identity', position = "dodge")

long[long$Species != "setosa", ]
long[long$var != "Petal.Width", ]
# [ row,column ]   row is except , and column is all .  행이 맞는 것만 하고 , 열은 뒤의 것 쭉 : [ 2, ] 이렇게 하면 2행 모두 출력 


data <- read.csv("data/climate.csv")
head(data)
long <- gather(data,var,value,3:6)
long
# Source Year Anomaly.1y Anomaly.5y Anomaly.10y Unc.10y
ggplot(long,aes(Year,value,color=var)) + geom_line()
ggplot(long[long$var != "Unc.10y" , ],aes(Year,value,color=var)) + geom_line()




# advanced chart -----------------
install.packages("wordcloud2")
library(wordcloud2)
head(demoFreq)
wordcloud2(data=demoFreq,minSize = 10,shape="star")

install.packages("KoNLP")
# KoNLP를 이용한 한국어 형태소 분석 - 브런치
# https://brunch.co.kr/@mapthecity/9




# [3rd Day] --------------------------

# Rmarkdown : web page 만들기 --------------------
# File -> New -> Markdown 을 누른다.  HTML을 선택한다.
# 생성된 untitled file을 edit한다.
# 내용의 --- --- 외는 없앤다.``
# markdown의 문법대로 입력을 한다.
# Knit button을 누르는 것이 수행하는 것이다. 
# 옆의 Viewer창에 띄우기 위해서는 Preview in Viewer Pane 

# R의 결과를 report를 위해서는 
# ```{r}
# ```
# 를 입력

# 확장자도 꼭 Rmd 로 가지고 있어야 Knit 버튼이 생기며 , 이것을 해야 R 을 실행한 결과도 같이 얻을수 있다.
# example : BigData.Rmd

# output: html_document 을 word_document로 바꾸면 word file이 생성된다.
# ggplotly 같은 것을 사용할때는 word로 바꾸는데 제약이 있다.

# find "markdown cheat sheet in Rstudio"



# data handling ------------------------

# 우리가 data handling을 할때
# 원하는 column은 선택한다 ( select)
# 조건에 맞는 값들만을 뽑아내는 행단위 filter 작업을 하며,  (filter)
# 새로운 변수를 만들기도 한다. (mutate)
# 그룹핑을 하는 것을 (group_by)
# 평균을 구하는 (summarize)
# 정렬 (arrange)
# 총 6개가 우리가 하는 작업의 대부분이다.

library(dplyr)
# select , filter, mutate , group_by , summarize , arrange    like SQL
select(iris,1,3,4)
select(iris,4:5)
select(iris,-5)
select(iris,-Species)
dim(iris)
filter(iris,Species != 'setosa')
filter(iris,Species != 'setosa' , Sepal.Length > 6)
filter(iris,Species != 'setosa' , Sepal.Length > 6,Petal.Length > 4.5)
filter(iris,Species != 'setosa' , Sepal.Length > 6 & Petal.Length > 4.5)
mutate(iris,new = Sepal.Length*100, new2 = Petal.Length*1000)
# 기억하라 . ifelse
mutate(iris,size = ifelse(Sepal.Length > 5, "big","small"))
mutate(iris,meanT = mean(Sepal.Length))   # 의미가 없는 것이다. 각 값에 들어가버린다.
summarise(iris,N = n(), meanSL = mean(Sepal.Length))  # n()로 갯수를 보여줄수 있다.
summarise(iris,meanSL = mean(Sepal.Length) , sumPL = sum(Petal.Length))
gIris <- group_by(iris,Species)
summarise(gIris,meanSL = mean(Sepal.Length) , sumPL = sum(Petal.Length) , sdPL = sd(Petal.Length))
arrange(iris,Sepal.Length)
arrange(iris,-Sepal.Length)  # 내림차순
arrange(iris,Species)
arrange(iris,desc(Species))

# chain operator ------------------------
# ctrl + shift + m (M) %>% 이라는 것으로  수행한 결과를 다음 것의 첫번째 패러미터로 입력된다.
iris %>% head()
iris %>% head() %>% summary()
iris %>%  select(1,3,5) %>% head() %>% 
    filter(Sepal.Length > 5) %>% head()

iris %>%  select(1,3,5) %>% 
  filter(Sepal.Length > 3) %>% 
  mutate(size = ifelse(Petal.Length >= 1.4,"big","small")) %>% 
  group_by(Species,size)

library(tidyr)
iris %>% gather(var,value,-5) %>% group_by(var,Species) %>% summarise(mean = mean(value))
iris %>% gather(var,value,-5) %>% group_by(var,Species) %>% summarise(mean = mean(value)) %>% spread(var,mean)
ir <- iris %>% gather(var,value,-5) %>% group_by(var,Species) %>% summarise(mean = mean(value) , sd = sd(value))
ir
ir %>% spread(var,mean)  # 이건 당연히 sd가 추가되어서 spread할때 생각한 것과 다름
ir %>% select(-sd) %>% spread(var,mean) 
ir %>% select(-mean) %>% spread(var,sd) 

# iris 데이터에서 1,2,4,5 변수를 선택하고,
# versicolor가 아닌 품종만 선택하여
# Petal.Width 값이 1보다 크면, big , 작으면 small 이라는 size 변수를 새로 만들어
# 각 품종별 , size별 Sepal.Length의 평균을 계산하시오.
iris
iris %>%  select(-3) %>%  
filter(Species != 'versicolor') %>% 
mutate(size = ifelse(Petal.Width > 1, "big","small")) %>% select(1,4,5) %>% 
 gather(var,value,1) %>%   # 없어도 됨.
group_by(size,Species) %>% 
summarise(mean = mean(value))

iris %>%  select(-3) %>%  
  filter(Species != 'versicolor') %>% 
  mutate(size = ifelse(Petal.Width > 1, "big","small")) %>% select(Species, size,Sepal.Length) %>% 
  group_by(Species,size) %>% 
  summarise(mean = mean(Sepal.Length))

iris %>%   
  filter(Species != 'versicolor') %>% 
  ggplot(aes(Sepal.Length,Sepal.Width,color = Species)) + geom_point()

# lab 1 : SKT big data ---------------------
# SKT Big Data Hub에 접속하면 데이터를 받을 수 있다.


# structure를 보고 type이 맞는지 확인 하고 변ㄱ
data <- read.csv("data/SKT_DELIVERY.csv")
dim(data)
names(data)
head(data)
str(data)
data$시간대 <- as.factor(data$시간대)
str(data)
levels(data$요일) <- c('월','화','수','목','금','토','일')
str(data)

# data 탐색 (대략적으로 어떻게 분포되어져있는지 확인)
summary(data)


# level 확인
levels(data$시군구)인   # 25개 구 
levels(data$읍면동)  # 224개동 확ㅇ


View(data)    # 엑셀 형식으로 보여줌.  옆의 Environment의 data를 누르는 것과 같은 듯


# data 상세 분석 

## + 시군구별 통화건수를 구하시오----------------------------------
data %>% group_by(시군구) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum) %>% 
  head()

library(ggplot2)
data %>% group_by(시군구) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum) %>% 
  ggplot(aes(시군구,sum)) + geom_bar(stat='identity', fill='skyblue') + coord_flip()
  
# + 요일별 통화건수를 구하시오--------------------
data %>% group_by(요일) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum) %>% 
  head()

library(ggplot2)
data %>% group_by(요일) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum) %>% 
  ggplot(aes(요일,sum)) + geom_bar(stat='identity', fill='skyblue')

# + 업종별 통화건수를 구하시오-----------------
data %>% group_by(업종) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum) %>% 
  head()

library(ggplot2)
data %>% group_by(업종) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum) %>% 
  ggplot(aes(업종,sum)) + geom_bar(stat='identity', fill='skyblue') + coord_flip()
   # 그림에서는 업종이 먼저이지 arrange를 했다고해서 sum의 기준으로 나오지 않는다.


# my homework 소트된 순으로 막대 그래프 보이게------------------
  # https://rstudio-pubs-static.s3.amazonaws.com/7433_4537ea5073dc4162950abb715f513469.html

  # x$name <- factor(x$name, levels = x$name[order(x$val)])

t <- data %>% group_by(업종) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum)
# factor 변환시 levels를 다시 정의할수 있다.
t$업종 <- factor(t$업종, levels = t$업종[order(t$sum)])
ggplot(t,aes(업종,sum)) + geom_bar(stat='identity', fill='skyblue') + coord_flip()
  # ok

# 한번에 하는 또 다른 방법 : reorder
ggplot(t,aes(reorder(업종, -sum) ,sum)) + geom_bar(stat='identity', fill='skyblue') + coord_flip()

# + forloop :string으로 넣기 위해서는 tidyr에 대해서는  뒤에 _ 만 붙는 함수를 사용하면 된다.     ---------------
library(ggplot2)
data <- read.csv("data/SKT_DELIVERY.csv")
for(var in names(data)[2:6]){
  out <- data %>% group_by_(var) %>% summarise(sum = sum(통화건수)) %>% arrange(-sum)
  g <- ggplot(out,aes_string(var,'sum')) + geom_bar(stat='identity', fill='skyblue') + coord_flip()
  print(g)
}


# + 각 요일별로 업종 특성이 다른가?  (단변량  ,이변량 분석)
ibrary(ggplot2)
data %>% group_by(요일,업종) %>% summarise(sum = sum(통화건수)) %>% arrange(요일,-sum) %>% 
  ggplot(aes(요일,sum,fill=업종)) + geom_bar(stat='identity', position="fill")
    # 요일까지 비중으로 모자이크 차트   (바둑판처럼 x의 크기가 요일의 비중 )


# + 각 구별로 업종 특성이 다른가?
ibrary(ggplot2)
data %>% group_by(시군구,업종) %>% summarise(sum = sum(통화건수)) %>% arrange(시군구,-sum) %>% 
  ggplot(aes(시군구,sum,fill=업종)) + geom_bar(stat='identity', position="fill") + coord_flip()
# 요일까지 비중으로 모자이크 차트   (바둑판처럼 x의 크기가 요일의 비중 )




# lecture 4 : heatmap : 비슷한 것을 모아준다. --------------
# 비슷한데 왜 비슷한지 (이유) 까지 차트를 보고 알수 있다.  clustering의 원리 
heatmap(scale(as.matrix(mtcars)), scale = "none")
# 거리계산을 하기 위해서 각 변수의 값의 scale이 달라서 scale() 함수를 사용하여 표준화를 시켜준 것이다. 

# lecture 4 : Dynamic Time series chart
## double click하면 원래의 scale로 돌아오
install.packages("dygraphs")
library(dygraphs)
lungDeaths <- cbind(mdeaths,fdeaths)
dygraph(lungDeaths ,width = 800)
dygraph(lungDeaths ,width = 800) %>% dyRangeSelector()



# lecture 4 : ribbon chart
library(ggplot2)
data <-read.csv("data/climate.csv")
head(data)
ggplot(data,aes(Year,Anomaly.10y)) +
  geom_line(color='red') +
  geom_ribbon(aes(ymin = Anomaly.10y-0.2, ymax = Anomaly.10y+0.2),alpha = 0.2) +
  geom_line(color='red')
    # line을 뒤에 그려준 이유는 앞의 line은 뒤의 ribbon이 덮어 쓴다.



# machine learning  ----------------------
  #  변수 중요도도 구할수 있다.
  # iris 는 Petal로 분류하면 훨씬 잘 분류 가능 (그림으로 볼때)
install.packages("randomForest")

library(randomForest)

md <- randomForest(Species ~ . , 
                   data = iris,
                   ntree = 300)

md

md$importance

new <- data.frame(
  Sepal.Length = 5,
  Sepal.Width =3,
  Petal.Length = 1,
  Petal.Width = 0.2
)

new

predict(md,new,type='prob')


# regression model
reg_md <- randomForest(Petal.Length ~ . , 
                   data = iris,
                   ntree = 200)

reg_md


# reference site -----------------
# https://awesome-r.com/






# [4th day] --------------------------


##  이상하게 여기 시계열은 잘 안됨.   나중에 필요할때 봅시당.
# time series grapho ----------------------
date <- as.date (as.character(data@Date) , "%d-%m-%Y")
  # 이렇게 date로 변환을 해주어야 한다. 
library(xts)
mcData <- xts(mktCap,date)    # date형태로 넣어야함.
mcData
class(mcData)   # inut을 xts format으로 넣어주어야 한다고함.
dygraph(mcData,width=80) %>% dyRangeSelector()



# AI -----------------
# A.I. Experiments : Visualizing High-Dimensional Space (YouTube)


# PCA plot Dimension : 2차원 (다차원) 상에 classification을 시켜 보여줌 (비슷한 것들끼리 모아줌)
  # 차원을 줄여서 보여주기 원할때
  # 차원을 줄여주면 noise reduction이 자동으로 이루어진다. (불필요한 변수들이 줄어들수 있다.)
    # 모형이 안정적으로 나오는 효과가 있다. 
  # unsupervised example (일단 분류를 해보자)

# machine learning
  # 제일 중요한 것 : overfitting
  # 2번째로 중요한 것 : feature engineering
    # ex. 감기 걸릴 확률을 예측할때 날씨라는 변수를 어떻게 입력하는 것이 좋을까?
    # 우리의 상식을 이용하여 변수르 만들어 넣는다. (날씨를 그냥 넣기만 한다고 알아서 하지 못한다. 일교차가 감기와 연관이 있음을 경험으로 알고 있으므로 이것을 이용한다. )
    # machine learning에서 변수 를 설정해주어야한다. 최근 주가 를 넣기만 하면 되는 것이 아니라,  변화율 같을 것으로 뭔가 변화를 계산해서 넣어주어야 한다.
    # 우리의 주식에 대한 가설들을 모형에 반영하려면 , 이런 가설들을 반영하는 데이터들을 변환하여 넣어주어야 한다. (변수 변환이 엄청 중요)
    # 변수 변환은 자동으로 해줄수가 없다. 
    # 공정의 경우는 현장 전문가의 머리속의 노하우를 통하여 어떻게 변환하는게 좋을지의 가설을 얻을수 있다.

# feature engineering in deep larning
  # youtube.com/watch?v=aircAruvnKk
  # 반복적으로 새로운 변환된 변수들을 만들어주면서 최종적으로 linear engineering 을 하게 되는 것이다.
  # 숫자 맞추기 예

# Supervised machine learning
    # 4가지인가를 모두 설명함..
  # K-Nearest Neighbors (KNN)
  # Decisiton Tree
  # Random Forest & Gradient Boost Machine  : 제일 좋음.
  # Super Learner


# 질문 :deep learning에서는 학습한후의 데이터양은 얼마나 되고, 그 데이터와 비교하는 것이 실시간으로 가능한가?





# lecture 7 : caret ---------------------------
# 입력하는 데이터 포맷을 통일화시켜서 243개의 다른 모형들도 사용하게 하는 caret package이다.

install.packages("caret")
install.packages("kernlab")
install.packages("rpart")
install.packages("e1071")
install.packages("ellipse")
install.packages("tidyr")
install.packages("randomForest")

library(caret)
library(kernlab)
library(rpart)
library(e1071)
library(ellipse)
library(tidyr)

data <- iris
N <- nrow(data)

ind <- sample(1:N , 0.7*N)
ind

train <- data[ind, ]
test <- data[-ind, ]
dim(train)
dim(test)

head(train)
str(train)
summary(train)

library(ggplot2)
library(tidyr)
train %>% gather(var,value,-5) %>% 
  ggplot(aes(var,value)) + geom_boxplot()


x <- train[ , 1:4]
y <- train[ ,5]
featurePlot(x =x , y=y , plot="ellipse")
featurePlot(x =x , y=y , plot="box")

scales <- list(x = list(relation = "free"), y = list(relation = "free"))
scales
featurePlot(x = x, y = y, plot = "density", scales = scales)

# ML -------------------------
# caret : https://topepo.github.io/caret/model-training-and-tuning.html
  # 6. Available Models
# 한글 : https://lovetoken.github.io/r/machinelearning/2017/04/23/caret_package.html


library(randomForest)

control <-  trainControl(method = "cv", number=10)
metric <- "Accuracy"

# a) linear algorithms
set.seed(7)
fit.lda <- train( Species ~ . , 
                  data = train, 
                  method = "lda", 
                  metric = metric, 
                  trControl = control)
fit.lda


# b) rf : random forest
fit.rf <- train( Species ~ . , 
                 data = train, 
                 method = "rf", 
                 metric = metric, 
                 trControl = control)
fit.rf

# c) knn
fit.knn <- train( Species ~ . , 
                  data = train, 
                  method = "knn", 
                  metric = metric, 
                  trControl = control)
fit.knn

# d) svm
fit.svm <- train( Species ~ . , 
                  data = train, 
                  method = "svmLinear", 
                  metric = metric, 
                  trControl = control)
fit.svm


# Model comparison ---------------------

# summarize accuracy of models
results <- resamples(list(
  lda = fit.lda, 
  #cart = fit.cart, 
  knn = fit.knn, 
  #svm = fit.svm, 
  rf = fit.rf))
summary(results)
dotplot(results)




# parameter tunning ------------------

knn.Grid <-  expand.grid(k=seq(1,50,by=2))
knn.Grid

knn.Fit2 <- train(Species ~ ., 
                  data = train, 
                  method = "knn", 
                  trControl = control, 
                  ## Now specify the exact models 
                  ## to evaluate:
                  tuneGrid = knn.Grid)
knn.Fit2

plot(knn.Fit2)   # 가장 좋은 모형을 knn.Fit2가 가지고 있습니다. 





# Model performance ----------------------
# test에 대해서도 맞는지 확인 필요
# 45개의 나머지 test data를 넣어주는 것이다.

pred <- predict(knn.Fit2, test)
pred

confusionMatrix(pred , test$Species)


# varialbe importance ----------------

fit.rf$finalModel$importance
# 불순도 지표 : Gini 지표   - 어떤 변수를 쪼갰을때 개선이 잘 되었는지?




# number image -----------------
# random forest로 classification 가능 (ML이 아니다.)
# 위치정보로 문제가 될수 있어 , ML의 CNN을 사용하면 위치까지 고려되어 문제를 풀게 된다.
train <- read.csv("data/mnist_train.csv")
#test <- read.csv("data/mnist_test.csv")

dim(train)
#dim(test)
str(train)
# label 이 int 인데 그냥 돌리면 regression을 하려고함.
train$label <- as.factor(train$label)

library(randomForest)

train1 <- train[1:5000, ]
md <- randomForest(label ~ .,
                   data=train1,
                   ntree=200)
md

test <- train[5001:10000, ]
pred <- predict(md,test)
library(caret)
confusionMatrix(pred,test$label)






















# practice -----------------
data <- read.csv("data/practice.csv")
head(data)
str(data)

library(randomForest)
library(tidyr)
library(dplyr)

train <- data %>% select(Target,7:15)

md <- randomForest(Target ~ .,
                   data=train,
                   ntree=200)
md


library(randomForest)

control <-  trainControl(method = "cv", number=10)
metric <- "Accuracy"

# a) linear algorithms
set.seed(7)
fit.lda <- train( Target ~ . , 
                  data = train, 
                  method = "lda", 
                  metric = metric, 
                  trControl = control)
fit.lda


# b) rf : random forest
fit.rf <- train( Target ~ . , 
                 data = train, 
                 method = "rf", 
                 metric = metric, 
                 trControl = control)
fit.rf

# c) knn
fit.knn <- train( Target ~ . , 
                  data = train, 
                  method = "knn", 
                  metric = metric, 
                  trControl = control)
fit.knn

# d) svm
fit.svm <- train( Target ~ . , 
                  data = train, 
                  method = "svmRadial", 
                  metric = metric, 
                  trControl = control)
fit.svm


# Model comparison ---------------------

# summarize accuracy of models
results <- resamples(list(
  lda = fit.lda, 
  #cart = fit.cart, 
  knn = fit.knn, 
  svm = fit.svm, 
  rf = fit.rf))
summary(results)
dotplot(results)


# varialbe importance ----------------

fit.rf$finalModel$importance
# 불순도 지표 : Gini 지표   - 어떤 변수를 쪼갰을때 개선이 잘 되었는지?



# Model performance ----------------------
# test에 대해서도 맞는지 확인 필요
# 45개의 나머지 test data를 넣어주는 것이다.

pred <- predict(knn.Fit2, test)
pred

confusionMatrix(pred , test$Species)


