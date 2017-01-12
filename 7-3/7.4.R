#喝减肥茶前体重（公斤）
X1 <- c(90,95,82,91,100,87,91,90,86,87,98,88,82,87)
#喝减肥茶后体重（公斤）
X2 <- c(63,71,79,73,74,65,67,73,60,76,71,72,75,62);

N <- length(X1);
df <- length(X1)-1;

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


X1_mean <- mean(X1);
X2_mean <- mean(X2);

X1_X2_sd <- sqrt((sum((X1-X2)^2)-sum(X1-X2)^2/N)/df);

t <- (X1_mean-X2_mean)/(X1_X2_sd/sqrt(N))

#双向累计概率
p <- 2*(1-pt(t, df))
p

#一键式搞定相依样本的t检验
t.test(X1, X2, paired=TRUE)
