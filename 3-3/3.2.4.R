data <- read.csv("startTime.csv")

#转换为标准正态分布的方法
zData <- (data[, 1]-mean(data[, 1]))/sd(data[, 1])

mean(zData)
sd(zData)

hist(
  zData,
  main="开机时间频率直方图", 
  ylab="频率", 
  xlab="开机时间（秒）"
)

shapiro.test(sample(zData, 5000))
