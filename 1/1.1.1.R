#读取数据
data <- read.csv("1.1.1.csv", sep=",", fileEncoding='utf8');
#查看数据
fix(data);

#描述性统计分析
s <- summary(data[, 3])

#多列的情况
data[, 4]<-data[, 3]*2

summary(data[, 3:4])

#修改列名
names(data) <- c(names(data)[1:3], 'score*2')

s <- summary(data[, 3:4])
#可以看到，多个列的summary，整合成为string了
s[, 1][1]

#单个的则不是
s <- summary(data[, 3])
s[['Min.']]

#summary加强版
summaryEx <- function(column) {
  s <- summary(data[, 3])
  #方差
  s[['var']] <- var(column);
  #标准差
  s[['sd']] <- sd(column);
  #s #直接写个s也可以替代下面的语句
  return (s);
}

s <- summaryEx(data[, 3])
s
