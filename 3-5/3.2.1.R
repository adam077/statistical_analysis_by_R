data <- read.csv("startTime.csv")

mean(data[, 1])
sd(data[, 1])

hist(
  data[, 1], prob=TRUE, 
  main="开机时间频率直方图", 
  ylab="频率", xlab="开机时间（秒）"
)

lines(density(data[, 1]), col="red")
