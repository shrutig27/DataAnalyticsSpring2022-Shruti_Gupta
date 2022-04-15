EPI_data <- read.csv("/Users/shruthigupta/Documents/GitHub/DataAnalyticsSpring2022-Shruti_Gupta/CSVs/EPI_data2010.csv", skip=1)
#or
#EPI_data <- read.xlsx(”<path>/2010EPI_data.xlsx")
# Note: replace default data frame name – cannot start with numbers!
View(EPI_data)
#
attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array

#other data
GRUMP_data <- read.csv("/Users/shruthigupta/Desktop/Data Analytics/GPW3_GRUMP_SummaryInformation_2010.csv")

