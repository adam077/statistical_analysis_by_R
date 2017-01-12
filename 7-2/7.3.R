data <- read.csv("data.csv", fileEncoding="UTF8", stringsAsFactors=FALSE);

ds <- split(data, data$gender)

boy <- ds$男生
girl <- ds$女生

boy_df <- nrow(boy);
girl_df <- nrow(girl);

df <- boy_df-1 + girl_df-1

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


boy_mean <- mean(boy$comsume)
girl_mean <- mean(girl$comsume)

boy_sd <- sd(boy$comsume)
girl_sd <- sd(girl$comsume)

boy_s = boy_sd/sqrt(boy_df)
girl_s = girl_sd/sqrt(girl_df);

t <- (boy_mean-girl_mean)/sqrt(boy_s^2 + girl_s^2)

t

#双向累计概率
p <- 2*(1-pt(t, df))
p

#一键式搞定两个独立样本的t检验
t.test(boy$comsume, girl$comsume)
