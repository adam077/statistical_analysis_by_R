data <- read.csv('1.3.1.csv', fileEncoding='utf8', stringsAsFactors=FALSE);

#排序方法1
#必须选择一列
sort(data)
#正序
sort(data[, 3])
#倒序
sort(data[, 3], decreasing = TRUE)

#排序方法2
#返回的是，排在对应的位置的，是原来的位置的第几个
order(data[, 3])

order(data[, 3], decreasing = FALSE)

data[order(data[,3], decreasing = TRUE), ]

#计算数据两两间的距离
distV <- dist(data[,3])

distV <- dist(data[,3], diag=TRUE)

distV <- dist(data[,3], diag=TRUE, upper=TRUE)

#直接访问，是访问不到数据的，要转换
distV[2, 3];

#转换为矩阵
distM <- as.matrix(distV)

colnames(distM) <- data[, 2];
rownames(distM) <- data[, 2];

distM;

distM[2, 3];
