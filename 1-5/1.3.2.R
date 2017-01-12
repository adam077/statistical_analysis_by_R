#R中的分类数据结构

#读取学生成绩的数据
data <- read.csv('1.3.1.csv', fileEncoding='utf8');
#查看数
data
#查看第一列数据
data[, 1]
#把第一列数据转换为分类结构
data[, 1] <- factor(data[, 1]);
#查看第一列数据
data[, 1]

#作用一、统一映射为另一个标签数据
data[, 1] <- factor(
  data[, 1], 
  labels=c('三年一班', '三年二班', '三年三班')
);
#查看第一列数据
data[, 1]

#作用二、处理异常数据
data <- read.csv('1.3.2.csv', fileEncoding='utf8');
data
#作用一、统一映射为另一个标签数据
data[, 1] <- factor(
  data[, 1], 
  levels=c(1, 2, 3),
  labels=c('三年一班', '三年二班', '三年三班')
);
data

#转换成字符向量
as.vector(data[, 1]) 
#转换成数字向量
as.numeric(data[, 1]) 

#连续变量的离散化
score <- data[,3]
#切分成3组
score1 <- cut(score, breaks = 3) 
table(score1)
#切分成自己设置的组
score2 <- cut(score, breaks = c(90, 100, 110, 120, 130, 140)) 
table(score2)

#一个有序因子
scoreOrder <- ordered(
  score2, 
  labels = c('bad', 'ok', 'average', 'good', 'excellent')
)
scoreOrder
table(scoreOrder)

#可排序的离散分类结构
data <- read.csv('1.3.1.csv', fileEncoding='utf8');
data[, 1] <- ordered(
  data[, 1], 
  levels=c(1, 3, 2),
  labels=c('三年一班', '三年三班', '三年二班')
);
table(data[, 1])
#有序因子作用：按照我们制定的顺序排序
data[order(data[, 1]),]

data <- read.csv('1.3.1.csv', fileEncoding='utf8', stringsAsFactors=TRUE);
data[, 2]
