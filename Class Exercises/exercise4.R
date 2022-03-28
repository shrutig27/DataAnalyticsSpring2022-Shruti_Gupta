library(ISLR)
mtcars
#gets the first 6 things
head(mtcars)
#shows data in a compact way
str(mtcars)

View(mtcars)
model1 = lm(mpg~cyl + wt, data = mtcars)
model2 = lm(mpg~., data = mtcars)
model1
model2
plot(model1, pch=18, col = "red", which=c(4))
cooks.distance(model1)
cd = cooks.distance( model1 )
round(cd, 4 )

head(Hitters)
dim(Hitters)
is.na(Hitters)

hd = na.omit(Hitters)
dim(hd)
head(hd)

spm = lm(Salary~., data = hd)
summary(spm)

spmcd = cooks.distance(spm)
influential = spmcd[(spmcd > (3 * mean(spmcd, na.rm = TRUE)))]

influential

influentialpeople = names(influential)
