#生成一个序列，从-5到5
x <- seq(-5, 5, length.out=100);
#获取标准正态分布对应的x值的概率
y <- dnorm(x, 0, 1);

#绘图
plot(
  x, y,
  col="red", type='l',
  ylab='P', xlab='X',
  main="标准正态分布"
);

#置信度的设置
config = 0.95;
#绘画出置信度下的占比区间
(1-config)/2

lEdge <- qnorm((1-config)/2)

abline(v=0)
abline(v=lEdge)
abline(h=dnorm(lEdge))
text(-4, 0.02, (1-config)/2)
text(-1, 0.1, 0.5-(1-config)/2)
#右边区间
rEdge <- qnorm(1-(1-config)/2)
#添加垂直线和横线
abline(v=rEdge)
text(4, 0.02, (1-config)/2)
text(1, 0.1, 0.5-(1-config)/2)

print(paste("置信区间为：[", lEdge, ", ", rEdge, "]", sep=""))





#p值的计算方式
#p值：一种概率，出现观察样本以及更极端情况的概率

#设置u值
u <- -2;
#u小于0的单向累计概率
pnorm(u)

u <- 2;
#u大于0的单向累计概率
1-pnorm(u)

#双向累计概率
p <- 2*(1-pnorm(u))


