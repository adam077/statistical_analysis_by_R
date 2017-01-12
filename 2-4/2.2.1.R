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
  #获取URL所在的位置
  clickLocation <- unlist(strsplit(line, "\t"))[4]
  if(is.na(clickLocation)) {
    clickLocation <- 0;
  } else {
    rowCount <- rowCount + 1;
  }
  vSum <- vSum + as.double(clickLocation);
  
  #读取下一行
  line <- readLines(qf, n=1);
}
#关闭文件连接
close(qf)

#打印总和
print(vSum);

#打印出总行数
print(rowCount)

mean <- vSum/rowCount;

print(mean);

#计算耗时
costTime <- proc.time()-ptm;
#打印耗时
print(costTime)