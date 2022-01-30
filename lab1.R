EPI_data <- read.csv("~/Documents/GitHub/DataAnalyticsSpring2022-Shruti_Gupta/EPI_data2010.csv", skip = 1)
View(EPI_data)
attach(EPI_data)
tf <- is.na(EPI)
E <- EPI[!tf]
summary(EPI)
fivenum(EPI)
stem(EPI)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE) 
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(EPI)
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(EPI); qqline(EPI)
x <- seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

## DALY

DALY
tf1 <- is.na(DALY)
summary(DALY)
fivenum(DALY)
stem(DALY)
hist(DALY)
hist(DALY, seq(0., 95., 1.0), prob=TRUE) 
lines(density(DALY,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(DALY)
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(DALY); qqline(DALY)
y <- seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), y, xlab = "Q-Q plot for t dsn")
qqline(y)

## WATER H
WATER_H
tf2 <- is.na(WATER_H)
summary(WATER_H)
fivenum(WATER_H)
stem(WATER_H)
hist(WATER_H)
hist(WATER_H, seq(0., 100., 1.0), prob=TRUE) 
lines(density(WATER_H,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(WATER_H)
plot(ecdf(WATER_H), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(WATER_H); qqline(WATER_H)
z <- seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), z, xlab = "Q-Q plot for t dsn")
qqline(z)

## EXERCISE 2

boxplot(EPI,DALY)
qqplot(EPI,DALY)

EPILand <- EPI[!Landlock]
##Land that' isn't landlocked

Eland <- EPILand[!is.na(EPILand)]
hist(Eland)
summary(Eland)
hist(Eland, seq(30., 95., 1.0), prob = TRUE)
lines(density(Eland,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(Eland)
plot(ecdf(Eland), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(Eland); qqline(Eland)
a <- seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), a, xlab = "Q-Q plot for t dsn")
qqline(a)

EPI_South_Asia <- EPI[GEO_subregion == "South Asia"]
