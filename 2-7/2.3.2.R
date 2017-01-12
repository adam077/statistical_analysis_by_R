ptm <- proc.time()

#保留总和
vSum <- 0;

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
  clickLocation <- unlist(strsplit(line, "\t"))[4]
  if(is.na(clickLocation)) {
    clickLocation <- 1;
  }
  vSum <- vSum + as.double(clickLocation);
  
  #读取下一行
  line <- readLines(qf, n=1);
}

#计算平均数
mean <- vSum/rowCount;

#重设游标
seek(qf, where=0);

#close(qf)
#qf <- file("SogouQ.mini", open="r");

line <- readLines(qf, n=1);

dSum <- 0;
while(length(line) != 0) {
  #获取点击位置所在的列
  clickLocation <- unlist(strsplit(line, "\t"))[4]
  if(is.na(clickLocation)) {
    clickLocation <- 1;
  }
  dSum <- dSum + (as.double(clickLocation)-mean)^2;
  
  #读取下一行
  line <- readLines(qf, n=1);
}
#关闭文件连接
close(qf)

variance <- dSum/rowCount
print(dSum);
print(variance);

#计算耗时
costTime <- proc.time()-ptm;
#打印耗时
print(costTime)
