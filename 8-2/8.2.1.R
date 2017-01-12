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

oneway.test(收入~专业, data=sample_data, var.equal=T)
