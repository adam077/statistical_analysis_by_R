data <- read.csv("data.csv", fileEncoding='UTF8');

plot(data$收入, xlab="学生序号", ylab="收入", main="蓝色为每个专业均值，红色为全部样本均值")

abline(v=20.5)

abline(v=40.5)

r_agg <- aggregate(data$收入, by=list(data$专业), FUN=mean)

lines(c( 1, 20), rep(r_agg[1, 2], 2), type="l", col="blue")

lines(c(21, 40), rep(r_agg[2, 2], 2), type="l", col="blue")

lines(c(41, 60), rep(r_agg[3, 2], 2), type="l", col="blue")

abline(h=mean(data$收入), col="red")
