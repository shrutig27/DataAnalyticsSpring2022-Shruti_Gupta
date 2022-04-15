install.packages("kknn")
library('mlbench')
require(kknn)
data(Ionosphere)
Ionosphere.learn <- Ionosphere[1:200,]
Ionosphere.valid <- Ionosphere[-c(1:200),]
fit.kknn <- kknn(class ~ ., Ionosphere.learn, Ionosphere.valid)
table(Ionosphere.valid$class, fit.kknn$fit)
(fit.train1 <- train.kknn(class ~ ., Ionosphere.learn, kmax = 15, 
	kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1))
table(predict(fit.train1, Ionosphere.valid), Ionosphere.valid$class)
(fit.train2 <- train.kknn(class ~ ., Ionosphere.learn, kmax = 15, 
	kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 2))
table(predict(fit.train2, Ionosphere.valid), Ionosphere.valid$class)


data(iris)
m <- dim(iris)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE, 
	prob = rep(1/m, m)) 
iris.learn <- iris[-val,]
iris.valid <- iris[val,]
iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1,
	kernel = "triangular")
summary(iris.kknn)
fit <- fitted(iris.kknn)
table(iris.valid$Species, fit)
pcol <- as.character(as.numeric(iris.valid$Species))
pairs(iris.valid[1:4], pch = pcol, col = c("green3", "red")
	[(iris.valid$Species != fit)+1])

