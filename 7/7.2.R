#感性地认识R中的t值的置信区间

df <- 24;

#生成一个序列，从-5到5
x <- seq(-5, 5, length.out=100);
#获取t分布对应的x值的概率
y <- dt(x, df);

#绘图
plot(
  x, y,
  col="red", type='l',
  ylab='P', xlab='X',
  main="t分布"
);

#置信度的设置
config = 0.95;
#绘画出置信度下的占比区间
(1-config)/2

lEdge <- qt((1-config)/2, df)

abline(v=0)
abline(v=lEdge)
abline(h=dt(lEdge, df))
text(-4, 0.02, (1-config)/2)
text(-1, 0.1, 0.5-(1-config)/2)
#右边区间
rEdge <- qt(1-(1-config)/2, df)
#添加垂直线和横线
abline(v=rEdge)
text(4, 0.02, (1-config)/2)
text(1, 0.1, 0.5-(1-config)/2)

print(paste("置信区间为：[", lEdge, ", ", rEdge, "]", sep=""))



#如何计算t值
data <- c(
  25.8,24.6,26.1,22.9,25.1,
  27.3,24,  24.5,23.9,26.2,
  24.3,24.6,23.3,25.5,28.1,
  24.8,23.5,26.3,25.4,25.5,
  23.9,27,  24.8,22.9,25.4
);

#样本均值：
data_mean <- mean(data);
#样本量
data_sample <- length(data);
#标准差
data_sd <- sd(data);
#标准误
data_sm <- sd(data)/sqrt(data_sample);

u <- 24.3;

t <- (data_mean-u)/data_sm

#p值的计算方式
#p值：一种概率，出现观察样本以及更极端情况的概率

#单边
1 - pt(t, df)

#双向累计概率
p <- 2*(1-pt(t, df))


