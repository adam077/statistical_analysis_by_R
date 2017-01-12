data <- read.csv("data1.csv", fileEncoding='UTF-8');

ra <- length(levels(data$地区));
rb <- length(levels(data$价格));

mean_all = sum(data$销量)/(ra*rb);

ya <- split(data$销量, data$地区)
sum_ya <- lapply(ya, sum)
mean_ya = unlist(sum_ya)/rb

yb <- split(data$销量, data$价格)
sum_yb <- lapply(yb, sum)
mean_yb = unlist(sum_yb)/ra

St <- sum((data$销量-mean_all)^2);

Sa <- rb*sum((mean_ya-mean_all)^2)
Sb <- ra*sum((mean_yb-mean_all)^2)

#注意，不要这样子写，对于双重求和运算，
#直接运算是出错的，要乖乖地写双重循环语句
#Se <- sum((data$销量 - mean_ya - mean_yb + mean_all)^2)

Se <- 0;
data_m <- matrix(data$销量, rb, ra);
for(i in 1:ra) {
  for(j in 1:rb) {
    Se <- Se + (data_m[j, i] - mean_ya[i] - mean_yb[j] + mean_all)^2
  }
}
Se

#或者如果想偷懒，根据定理直接写也行：
#Se <- St - Sa - Sb

fe <- (ra-1)*(rb-1)
ft <- ra*rb - 1;
fa <- ra - 1;
fb <- rb - 1;

MSa <- Sa/fa;
MSb <- Sb/fb;
MSe <- Se/fe;

Fa <- MSa/MSe;
Fb <- MSb/MSe;

Fa
Fb

data.aov <- aov(销量~地区+价格, data=data)

summary(data.aov)
