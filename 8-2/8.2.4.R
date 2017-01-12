data <- read.csv("data.csv", fileEncoding='UTF-8');

library(sampling)

k <- length(levels(data$专业))
n <- nrow(data)/k;

s_index <- strata(data, stratanames="专业", method="srswor", size=rep(n, k))

sample_data <- data[rownames(s_index), ]

sub_datas <- split(sample_data, sample_data$专业)

Xt <- mean(sample_data$收入);

SSb <- 0;
SSw <- 0;

for(key in sub_datas) {
  income <- key$收入;
  xj <- mean(income);
  SSb <- SSb + (xj-Xt)^2;
  SSw <- SSw + sum((income-xj)^2)
}

SSb <- n*SSb;

MSb <- SSb/(k-1);
MSw <- SSw/(k*(n-1));

F <- MSb/MSw;

F 

config = 0.95;

pf(F, k-1, k*(n-1))

x <- seq(0, 5, length.out=1000);
y <- df(x, k-1, k*(n-1));

plot(
  x,
  y,
  col="red",
  type='l',
  xaxs="i", 
  yaxs="i",
  ylab='概率密度',
  xlab='样本值',
  main=paste("F(", k-1, ", ", k*(n-1), ")概率分布图形", sep="")
);
edge <- qf(config, k-1, k*(n-1))
abline(v=edge)
text(3.5, 0.05, 1-config)



oneway.test(收入~专业, data=sample_data, var.equal=T)










