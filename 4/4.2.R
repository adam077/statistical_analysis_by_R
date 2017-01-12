data <- read.csv("4.csv");

#定义每次抽样的样本数
s <- 30
#定义统计数的统计函数
f <- mean;
#定义分布抽样的次数
times <- 100;
#抽样后统计量保存的变量
sDatas <- c();

for(i in 1:times) {
  sData <- sample(data[, 2], s);
  sDatas <- append(sDatas, f(sData));
}

#计算标准误
sd(sDatas)/sqrt(length(sDatas))
