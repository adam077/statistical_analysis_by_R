data <- read.csv("startTime.csv")

#生成正态分布，需要两个元素，
#第一个是分布的均值
#第二个是分布的标准差
ztData <- rnorm(
  1000, 
  mean=mean(data[, 1]), 
  sd=sd(data[, 1])
)

hist(
  ztData,
  main="模拟正态分布直方图", 
  ylab="频率", xlab="x轴"
)
