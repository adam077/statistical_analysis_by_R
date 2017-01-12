x <- seq(0, 5, length.out=1000);
y <- df(x, 10, 10);

plot(
  x,
  y,
  ylim = c(0, 2),
  col="orange",
  type='l',
  xaxs="i", 
  yaxs="i",
  ylab='概率密度',
  xlab='样本值',
  main="不同自由度下，F分布的图形"
);

lines(x, df(x, 20, 20), col="green")
lines(x, df(x, 40, 40), col="blue")
lines(x, df(x, 80, 80), col="red")

legend(
  "topright",
  legend=paste("dfb=",c(10, 20, 40, 80)," dfw=",c(10, 20, 40, 80), sep=""), 
  lwd=1, 
  col=c("orange", "green","blue","red")
)
