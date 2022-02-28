EPI_data <- read.csv("~/Documents/GitHub/DataAnalyticsSpring2022-Shruti_Gupta/EPI_data2010.csv", skip = 1)
detach(EPI_data)
attach(EPI_data)
tf <- is.na(EPI)
E <- EPI[!tf]
summary = summary(EPI)
EPI_mean = getElement(summary, 4)
EPI_median = getElement(summary,3)
mode<-function(x){which.max(tabulate(x))}
EPI_Mode = mode(EPI)
#find the mean median mode of EPI and DALY

tf1 = is.na(DALY)
F = DALY[!tf]
summaryDALY = summary(DALY)
DALY_mean = getElement(summaryDALY, 4)
DALY_med = getElement(summaryDALY, 3)
DALY_mod = mode(DALY)

#histogram for epi and daly variable
boxplot(DALY, EPI)
boxplot(ENVHEALTH, ECOSYSTEM)

#generate boxplot for envhealth, ecosystem

#qqplot envhealth, ecosystem
qqplot(DALY, EPI)
qqplot(ENVHEALTH, ECOSYSTEM)

#View(EPI_data)
#find most important factor increasing the EPI in given region 
#I think that the ecosystem is the most important factor for EPI


#linear and least squares
#predict

boxplot(ENVHEALTH, DALY, AIR_H, WATER_H)
lmENVH = lm(ENVHEALTH~DALY+AIR_H+WATER_H)
lmENVH
summary(lmENVH)
cENVH = coef(lmENVH)

DALYNEW = c(seq(5,95,5))
AIR_HNEw = c(seq(5,95,5))
WATER_HNew =  c(seq(5,95,5))
new = data.frame(DALYNEW+ AIR_HNEw +WATER_HNew)

penv = predict(lmENVH, new, interval ="prediction")
cenv = predict(lmENVH, new, interval = "confidence")

#repeat for AIR_E, CLIMATE
tf2 = is.na(AIR_E)
H = AIR_E[!tf]
summaryair = summary(AIR_E)
air_mean = getElement(summaryair, 4)
air_med = getElement(summaryair, 3)
air_mod = mode(DALY)


tf3 = is.na(CLIMATE)
I = CLIMATE[!tf]
summaryc = summary(CLIMATE)
c_mean = getElement(summaryc, 4)
c_med = getElement(summaryc, 3)
c_mod = mode(DALY)




