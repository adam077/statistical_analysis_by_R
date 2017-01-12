#设置自由度
df <- 8;
Q <- c();
for(i in 1:1000) {

  Z <- rnorm(df);
  
  q <- sum(Z^2)
  Q <- append(Q, q)
}

#画出概率分布图
hist(Q, probability = TRUE)
#画出真实的卡方分布的概率曲线
x <- seq(0, 20, 0.1);
y <- dchisq(x, df)
lines(x, y)


x <- seq(0, 20, 0.1);

curve(dchisq(x, 2), 0, 20, ylab = "p(x)")
curve(dchisq(x, 4), add = TRUE, lty=2)
curve(dchisq(x, 6), add = TRUE, lty=3)
curve(dchisq(x, 8), add = TRUE, lty=4)
curve(dchisq(x, 10), add = TRUE, lty=5)
curve(dchisq(x, 12), add = TRUE, lty=6)
legend("topright", c('df=2', 'df=4', 'df=6', 'df=8', 'df=10', 'df=12'), lty=1:6, bty="n")

