# seminar 05 ------------------

## __ machine learning  ----------------------
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
# 어떤 모듈들이 많이 사용되었는지?
# https://awesome-r.com/






# [4th day] --------------------------


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
  svm = fit.svm, 
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






