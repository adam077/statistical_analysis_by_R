#搜狗实验室测试数据：
#http://www.sogou.com/labs/dl/q.html

#完整版数据下载
#链接: http://pan.baidu.com/s/1i3rl4xB 密码: u1ia

#访问时间
#用户ID
#[查询词]
#该URL在返回结果中的排名
#用户点击的顺序号
#用户点击的URL
data <- read.csv("SogouQ.mini", sep="\t", header=FALSE)
names(data) <- c("cTime", "id", "keyword", "sIndex", "cIndex", "URL");
##############随机抽样的案例##################################

qf <- file("SogouQ.reduced", open="r");
rowCount <- 0;
#从中读取一行
line <- readLines(qf, n=1);

while(length(line) != 0) {
  rowCount <- rowCount + 1;
  #读取下一行
  line <- readLines(qf, n=1);
}
print(rowCount)
close(qf)

#重设游标
qf <- file("SogouQ.reduced", open="r");
#抽取的比例
p <- 0.001;
c <- 0;
#重新开始读取
line <- readLines(qf, n=1);
while(length(line) != 0) {
  #获取一个大于0小于1的随机小数
  r <- runif(1, min = 0, max = 1);
  #判断随机数是否小于抽取比例，
  #写成 r>(1-p) 也是可以的
  if(r<p) {
    print(line);
    c <- c + 1;
  }
  #继续读取下一行
  line <- readLines(qf, n=1);
}

close(qf)