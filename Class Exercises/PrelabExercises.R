## Reading the file in 
library("readxl")
setwd("~/Desktop/Data Analytics")
getwd()
data <- read_excel("GPW3_GRUMP_SummaryInformation_2010.xls", sheet = "Continent Totals")
data()
View(data)
nrow(data)
ncol(data)
colnames(data)
str(data)
my_m <- as.matrix(data)
my_m
