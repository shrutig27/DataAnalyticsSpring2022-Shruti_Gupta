install.packages("readxl")
install.packages('tidyverse')
library(tidyverse)
library(readxl)
library(ggplot2)
library(caret)
library(rpart)
library(randomForest)
library(rpart)
library(rpart.plot)
df = read_excel("/Users/shruthigupta/Downloads/rollingsales_brooklyn.xls", skip = 4)
View(df)
summary(df)
str(df)

sqft = c(df$`GROSS SQUARE FEET`)
year = c(df$`YEAR BUILT`)

summary(sqft)
summary(year)
plot(sqft~year, data = df, xlim = c(1800,2050), ylim = c(1000,70000))
??plot
p = df$`SALE
PRICE`
IQR(p)
summary(p)
box_plot = ggplot(p)

View(df)
attach(df)
plot(df$`GROSS SQUARE FEET`, df$`SALE
PRICE`)
plot(df$`LAND SQUARE FEET`, df$`SALE
PRICE`)

sale = df$`SALE
PRICE`
gross = df$`GROSS SQUARE FEET`
land = df$`LAND SQUARE FEET`
multreg = lm(sale~ gross + land, data = df)
summary(multreg)

#kmeans
install.packages("stats")
install.packages("dplyr")
install.packages("ggplot2")
install.pages("ggfortify")

library(stats)
library(dyplr)
library(ggplot2)
library(ggfortify)

wssplot = function(data, nc=15, seed=1234){
  wss = (nrow(data)-1)*sum(apply(data,2,var))
  for(i in 2:nc){
    set.seed(seed)
    wss[i] = sum(kmeans(data, centers =i)$withinss)
  }
  plot(1:nc, wss, type ="b", xlab = "Number of clusters", ylab = "within groups of sum fo squares")
}
wssplot(df)

tree = rpart(sale ~ gross+land)
a = data.frame(gross =c(3000), land = c(4000))
result = predict(tree, a)
print(result)


neighborhood = df$NEIGHBORHOOD
zip = df$`ZIP CODE`

tree = rpart(sale ~ neighborhood+zip)
a = data.frame(neighborhood =c("BATH BEACH"), zip = c(11238))
result = predict(tree, a)
print(result)

rpart.plot(tree)