ptm <- proc.time()

#先初始化数据框
#初始化数据框可以使用NA值，
#因为接下来我们可以使用na.omit()方法方便地删除它
keys <- c(NA);
values <- c(0);
kvDF <- data.frame(keys, values);

#因为这个是测试案例
#我只测试一百万行的数据
qf <- file("SogouQ.mini", open="r");

#记录总共的行数
rowCount <- 0;
#开始读取第一行
line <- readLines(qf, n=1);

#一直读取到最后一行
#最后一行的判断标准时什么呢？
#就是读取出来的行，长度为0，那么就是最后一行了
while(length(line) != 0) {
  rowCount <- rowCount + 1;
  #获取点击位置所在的列
  clickLocation <- unlist(strsplit(line, "\t"))[5]
  
  ci <- which(kvDF[, 1]==clickLocation);
  
  if(length(ci)>0) {
    #如果数据已经存在，那么将已经存在的数据加1
    kvDF[ci, 2] <- as.double(kvDF[ci, 2]) + 1;
  } else {
    #如果不存在，那么我们将统计值设置为1
    kv <- c(clickLocation, 1);
    i <- nrow(kvDF) + 1;
    #把它加入到最新的一行中
    kvDF[i, ] <- kv;
  }
  
  #读取下一行
  line <- readLines(qf, n=1);
}
#关闭文件连接
close(qf)

#打印出总行数
print(rowCount)
#删除空值
kvDF <- na.omit(kvDF);

maxValue <- max(as.integer(kvDF[, 1]))
minValue <- min(as.integer(kvDF[, 1]))
range <- maxValue - minValue;
print(range);

#计算耗时
costTime <- proc.time()-ptm;
#打印耗时
print(costTime)