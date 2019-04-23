# seminar 02 ------------------------

## lecture 4 : ggplot2 --------------------


### ___ point --------------------
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



### ___ boxplot --------------------

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


### ___ histogram --------------------

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
str(dfn)
ggplot(dfn,aes(dose,length,color=supp)) + geom_line() + geom_point() +
  geom_text(label=rownames(dfn))



### ___ dynamic plot --------------------
# 동적인 그림 만들기
install.packages("plotly")
library(ggplot2)
library(plotly)
g <- ggplot(iris,aes(Petal.Length,Petal.Width,size=Species,color=Species)) +
  geom_point(alpha=0.7)

ggplotly(g)




### ___ bar --------------------

# bar plots
ggplot(iris,aes(Species,Sepal.Length)) + geom_bar(stat='identity')





install.packages("tidyr")
library(tidyr)

head(iris)
long <- gather(iris,var,value,1:4)
head(long)
ggplot(long,aes(Species,value,fill=var)) + geom_bar(stat='identity', position = "fill") # 100분위
ggplot(long,aes(Species,value,fill=var)) + geom_bar(stat='identity', position = "dodge")

long <- long[long$Species != "setosa", ]
ggplot(long,aes(Species,value,fill=var)) + geom_bar(stat='identity', position = "dodge")
long[long$var != "Petal.Width", ]
# [ row,column ]   row is except , and column is all .  행이 맞는 것만 하고 , 열은 뒤의 것 쭉 : [ 2, ] 이렇게 하면 2행 모두 출력 


data <- read.csv("data/climate.csv")
head(data)
long <- gather(data,var,value,3:6)
head(long)
# Source Year Anomaly.1y Anomaly.5y Anomaly.10y Unc.10y
ggplot(long,aes(Year,value,color=var)) + geom_line()
ggplot(long[long$var != "Unc.10y" , ],aes(Year,value,color=var)) + geom_line()




#### ____ data 변환 (long)  ---------------------
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


### ___ advanced chart -----------------
install.packages("wordcloud2")
library(wordcloud2)
head(demoFreq)
wordcloud2(data=demoFreq,minSize = 10,shape="star")

install.packages("KoNLP")
# KoNLP를 이용한 한국어 형태소 분석 - 브런치
# https://brunch.co.kr/@mapthecity/9



