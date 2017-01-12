#读取数据，所有平板电脑的价格
data <- read.csv("2.1.1.csv");

#频率直方图
hist(data[, 2], prob=TRUE, 
     main="频率直方图", 
     ylab="频率", xlab="价格")
lines(density(data[, 2]), col="red")

#频次直方图
hist(data[, 2], breaks=200, xlim=c(0,6000), 
     main="频次直方图", 
     ylab="次数", xlab="价格")

