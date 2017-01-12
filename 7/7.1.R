x<-seq(-10, 10, length.out=1000)

plot(
  x, dt(x, 2, 0),
  col="red",
  xlim=c(-10, 10), ylim=c(0, 0.5),
  type='l',
  lwd=2,
  xaxs="i", yaxs="i",
  ylab='概率密度', xlab='样本值', main="t分布图形"
);

lines(x, dt(x, 6, 0), type='l', lwd=2, col="orange")
lines(x, dt(x, 30, 0), type='l', lwd=2, col="green")
lines(x, dnorm(x), type='l', lwd=2, col="black")

legend(
  "topright",
  legend=paste(
    "df=", c(2, 6, 30, 100)
  ), 
  lwd=1, 
  col=c("red", "orange", "green", "black")
)