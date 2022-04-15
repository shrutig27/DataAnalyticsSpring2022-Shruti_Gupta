#compare to kknn?

library(kknn)
spam_kknn <- kknn(spam~., train, test, distance = 1,
             kernel = "triangular")
summary(spamkknn)
# etc....
# other distances and kernels!!
