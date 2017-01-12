#strsplit的案例
s <- "a	b	c";

#strsplit会返回一个List类型的数据
sList <- strsplit(s, "\t")

sList[[1]][2]
#可以使用unlist方法将List编程普通数组
ss <- unlist(sList)

ss[2]

#我们看看strsplit的使用场景，应该是这样子的
s2 <- c("a	b	c", "d	e	f");
s2List <- strsplit(s2, "\t")

s2s <- unlist(s2List)
#访问List数据结构的方式
s2List[[2]][2]

line <- "20111230000005\t57375476989eea12893c0c3811607bcf\t奇艺高清\t1\t1\thttp://www.qiyi.com/";

line;

clickLocation <- unlist(strsplit(line, "\t"))[4];

clickLocation <- strsplit(line, "\t")[[1]][4];

clickLocation;


keys <- c(NA);
values <- c(0);

kvDF <- data.frame(keys, values);

kvDF[1, ] <- c(1, 1);

kvDF[1, 2] <- kvDF[1, 2] + 1;

kvDF[2, ] <- c(2, 1);

clickLocation = 5;

ci <- which(kvDF[, 1]==clickLocation);

if(length(ci)>0) {
  #如果数据已经存在，那么将已经存在的数据加1
  kvDF[ci, 2] <- kvDF[ci, 2] + 1;
} else {
  #如果不存在，那么我们将统计值设置为1
  kv <- c(clickLocation, 1);
  i <- nrow(kvDF) + 1;
  #把它加入到最新的一行中
  kvDF[i, ] <- kv;
}
