# seminar 04 ------------------

## __ data handling ------------------------

# 우리가 data handling을 할때
# 원하는 column은 선택한다 ( select)
# 조건에 맞는 값들만을 뽑아내는 행단위 filter 작업을 하며,  (filter)
# 새로운 변수를 만들기도 한다. (mutate)
# 그룹핑을 하는 것을 (group_by)
# 평균을 구하는 (summarize)
# 정렬 (arrange)
# 총 6개가 우리가 하는 작업의 대부분이다.

rm(list = ls())
ls()

install.packages("dplyr")
library(dplyr)
# select , filter, mutate , group_by , summarize , arrange    like SQL
g <- select(iris,1,3,4);  head(g)

g <- select(iris,4:5); head(g)
g <- select(iris,-5); head(g)
g <- select(iris,-Species); head(g)
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

## __ chain operator ------------------------
# ctrl + shift + m (M) %>% 이라는 것으로  수행한 결과를 다음 것의 첫번째 패러미터로 입력된다.
# linux에서 pipe 입니다.  |
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

### ___lab 1 : SKT big data ---------------------
# SKT Big Data Hub에 접속하면 데이터를 받을 수 있다.

library(dplyr)

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
levels(data$시군구)  # 25개 구 
levels(data$읍면동)  # 224개동 확ㅇ


View(data)    # 엑셀 형식으로 보여줌.  옆의 Environment의 data를 누르는 것과 같은 듯


#### ____ data 상세 분석 

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



# lecture 4 : ribbon chart ------------
library(ggplot2)
data <-read.csv("data/climate.csv")
head(data)
# 질문 : 선의 위 , 아래로 사이즈가 다르지 않나요?
ggplot(data,aes(Year,Anomaly.10y)) +
  geom_line(color='red') +
  geom_ribbon(aes(ymin = Anomaly.10y-0.2, ymax = Anomaly.10y+0.2),alpha = 0.2) +
  geom_line(color='red')
# line을 뒤에 그려준 이유는 앞의 line은 뒤의 ribbon이 덮어 쓴다.

