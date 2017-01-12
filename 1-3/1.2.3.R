#判断字符串中是否包含字符的例子
length(grep("天涯论坛", "欢迎来到天涯论坛！"))

#网页查询日记
qf <- file("SogouQ.reduced", "r");
#从中读取一行
line <- readLines(qf, n=1);
#抽取的比例
p <- 0.01;
key <- "电影";
c <- 0;
cc <- 0;
while(length(line) != 0) {
  #获取一个大于0小于1的随机小数
  r <- runif(1, min = 0, max = 1);
  if(length(grep(key, line))>0) {
    c <- c + 1;
    #二重判断，先过滤，再抽样
    if(r<p) {
      print(line);
      cc <- cc + 1;
    }
  }
  #继续读取下一行
  line <- readLines(qf, n=1);
}

close(qf)

