library(ISLR)
library(MASS)
library(boot)
set.seed(1)

train = sample(392,196)
lm.fit = lm(mpg~horsepower, data = Auto, subset = train)
attach(Auto)
mean((mpg-predict(lm.fit, Auto))[-train]^2)

lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

set.seed(2)
train = sample(392,196)
lm.fit <- lm(mpg~horsepower, data = Auto, subset = train) 
mean((mpg-predict(lm.fit,Auto))[-train]^2)

m.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train) 
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train) 
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

#------K-Fold-------------------------------------------------
??cv.glm
set.seed(17)
cv.error.10 = rep(0,10) 
for(i in 1:10){
  glm.fit = glm(mpg ~ poly(horsepower, i), data = Auto)
  cv.error.10[i] = cv.glm(Auto,glm.fit, K=10) $delta[1] 
  }
cv.error.10
#----Random Forest--------------------------------------------
install.packages("randomForest")
library(randomForest)
data1 = read.csv(file.choose(), header = TRUE)
head(data1)
str(data1)

levels(data1$Condition)
summary(data1)

set.seed(100)
train = sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TSet = data1[train,]
VSet = data1[-train,]
summary(TSet)
summary(VSet)

model1 = randomForest(Condition~., data = TSet, importance = TRUE)
model1

model2 = randomForest(Condition~., data = TSet, ntree = 500, mtry = 6, importance = TRUE)
model2

predTrain = predict(model2, TSet, type = "class")
table(predTrain, TSet$Condition)


predValid = predict(model2, VSet, type="class")
table(predValid, ValidSetCondition)

importance(model2)
varImpPlot(model2)

a = c()
i = 5
for(i in 3:8){
model3 = randomForest(Condition~., data = TSet, ntree=500, mtry = i, importance = TRUE)
a[i-2] = mean(predValid == VSet$Condition)
}

a
plot(3:8,a)

library(rpart)
library(caret)
library(e10701)

model_dt = train(Condition ~., data = TSet, method = "rpart")
model_dt_1 = predict(model_dt, data = TSet)
table(model_dt_1, TSet$Condition)
mean(model_dt_1 == TSet$Condition)

model_dt_vs= predict(model_dt, newdata = VSet)
table(model_dt_vs, VSet$Condition)
mean(model_dt_vs == VSet$Condition)

