#Landlock
EPILand<-EPI[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
#
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)

