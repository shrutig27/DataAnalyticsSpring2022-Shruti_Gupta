
coffee_data <- read.csv("~/Documents/GitHub/DataAnalyticsSpring2022-Shruti_Gupta/psd_coffee.csv")
View(coffee_data)
attach(coffee_data)
tf <- is.na(coffee_data)
summary(coffee_data)
fivenum(coffee_data$Value)
stem(coffee_data$Value)
hist(coffee_data$Value)
hist(coffee_data$Value, seq(30., 95., 1.0), prob=TRUE) 
lines(density(coffee_data$Value,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(coffee_data$Value)
plot(ecdf(coffee_data$Value), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(coffee_data$Value); qqline(coffee_data$Value)
x <- seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for coffee_data")
qqline(x)

#linear regression




#linear regression at different point of times



#kmeans analysis



