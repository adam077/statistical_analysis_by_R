data <- read.csv("4.csv");

hist(
  data[, 2],
  main="价格直方图", 
  ylab="频次", xlab="价格"
);

#定义每次抽样的样本数
n <- 30
#定义统计数的统计函数
f <- mean;
#定义分布抽样的次数
times <- 1000;
#抽样后统计量保存的变量
sDatas <- c();
for(i in 1:times) {
  sData <- sample(data[, 2], n);
  sDatas <- append(sDatas, f(sData));
}

hist(
  sDatas,
  main="抽样分布直方图", 
  ylab="频次", xlab="价格均值"
)

#夏皮罗–威克尔（Shapiro-Wilk）检验
shapiro.test(sDatas)

#均值为样本的均值
nMean <- mean(data[, 2])
#标准差为样本的标准差除以根号n
nSd <- sd(data[, 2])/sqrt(n);

ks.test(
  sDatas, 
  rnorm(times, mean=nMean, sd=nSd)
)