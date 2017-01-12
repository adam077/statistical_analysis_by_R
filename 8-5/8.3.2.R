data <- read.csv("data2.csv", fileEncoding='UTF-8');

ra <- length(levels(data$包装))
rb <- length(levels(data$广告策略))

t <- nrow(data)/(ra*rb)

ya <- split(data$销量, data$包装)
sum_ya <- lapply(ya, sum)
mean_ya <- unlist(sum_ya)/(rb*t)
mean_ya

yb <- split(data$销量, data$广告策略)
sum_yb <- lapply(yb, sum)
mean_yb <- unlist(sum_yb)/(ra*t)
mean_yb

mean_yab <- tapply(data$销量, list(data$包装, data$广告策略), FUN=mean);
mean_yab

mean_y <- sum(data$销量)/(ra*rb*t)
mean_y

St <- sum((data$销量-mean_y)^2);

Sa <- rb*t*sum((mean_ya-mean_y)^2)
Sb <- ra*t*sum((mean_yb-mean_y)^2)

Sab <- 0;
data_m <- matrix(mean_yab, rb, ra);
for(i in 1:ra) {
  for(j in 1:rb) {
    Sab <- Sab + (data_m[j, i] - mean_ya[j] - mean_yb[i] + mean_y)^2
  }
}
Sab <- Sab*t;

Se <- 0;
loop <- tapply(data$销量, list(data$包装, data$广告策略), FUN=list);
for(i in 1:length(loop)) {
  p <- loop[[i]]
  Se <- Se + sum((p - mean_yab[i])^2)
}

St
Sa+Sb+Sab+Se


fa <- ra-1;
fb <- rb-1;
fab <- fa*fb;
fe <- ra*rb*(t-1);
ft <- ra*rb*t -1;

MSa <- Sa/fa
MSb <- Sb/fb
MSab <- Sab/fab
MSe <- Se/fe;

Fa <- MSa/MSe
Fb <- MSb/MSe
Fab <- MSab/MSe

Fa
Fb
Fab

data.aov <- aov(销量~包装+广告策略+包装*广告策略, data=data)

summary(data.aov)
