x <- c(29, 21, 17, 17, 16);

y <- c(100, 110, 80, 55, 14);

pi <- x/sum(x)
ei <- sum(y)*pi

xChiSq <- sum((y-ei)^2/ei)

x <- seq(0, 60, 0.1);
curve(dchisq(x, 4), xlim = c(0, 60), lty=2, xlab="X", ylab="p(x)")

#找出在0.95的置信度下，右边边界的值
xRight <- qchisq(0.95, 4)
abline(v=xRight)

text(15, 0.05, ">95%")

points(xChiSq, dchisq(xChiSq, 4))

#求出出现0到卡方统计量的累计概率
pchisq(xChiSq, 4)
#求出出现卡方统计量到无穷的概率，也就是P值
1-pchisq(xChiSq, 4)

#一键式卡方检测
chisq.test(y, p=pi)
