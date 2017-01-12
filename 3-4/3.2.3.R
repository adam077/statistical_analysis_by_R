data <- read.csv("startTime.csv")

#绘画QQ图
qqnorm(
  data[, 1],
  main="QQ图", 
  ylab="y", xlab="x"
); 
qqline(data[, 1]);
#QQ图判断法：查看我们的数据，是否绝大部分落在中间直线的附近

#夏皮罗–威克尔（Shapiro-Wilk）检验
shapiro.test(data[, 1])
shapiro.test(sample(data[, 1], 5000))
#当W接近于1，并且p小于0.05时，我们可以认为数据接近正态分布

#K-S检验
#要求、需要模拟一个和样本数据类似的样本
#      模拟样本生成方案：使用rnorm模拟出来一个正态分布即可
ks.test(
  data[, 1], 
  rnorm(10000, mean=mean(data[, 1]), sd=sd(data[, 1]))
)

nData <- rnorm(10000, mean=mean(data[, 1]), sd=sd(data[, 1]))
#当D接近于0，并且p大于0.05时，我们可以认为数据接近正态分布
ks.test(
  data[, 1], 
  as.integer(
    rnorm(10000, mean=mean(data[, 1]), sd=sd(data[, 1]))
  )
)
