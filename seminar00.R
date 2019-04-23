# seminar 00 ------------------------
##  package install 및 d3.js 맞보기 -----------------------

## 우리가 package들만 잘 찾아서 사용하면 python에서처럼 쉽게 사용할수 있다. 
## 그 내용을 보여주는 예이다.

## __ d3.js --------------------------------


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

## __ Map : leaflet --------------------------------

#library
library(leaflet)

# Create 10 markers (Random points)
data=data.frame(long=sample(seq(-150,150),10) ,  lat=sample(seq(-50,50),10) , val=round(rnorm(10),2) , name=paste("point",letters[1:10],sep="_")  ) 

# Show a marker at each position
m=leaflet(data = data) %>% addTiles() %>% addMarkers(~long, ~lat, popup = ~as.character(name))
# addTiles: 지도를 그림

m   # 여기 assign만한 m을 수행시켜주어야 그림이 나온다.



## __ ggplot --------------------------------

install.packages("ggplot2")
library(ggplot2)  # 오른쪽의 packages안에서 check를 해두면 기본적으로 library를 load해주게 된다.

ggplot(iris,aes(Sepal.Length,Sepal.Width)) + geom_point() + geom_line()



