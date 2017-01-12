#读取数据
data<-read.csv('',sep='',fileEncoding = 'utf8')

#修改列名
names(data)

#排序与双排序
sort()#单
data[order(data[,1]),]
data[order(data[,1],data[,2]),]

#条件筛选
result=subset(df1,name=="aa" & sex=="f",select=c(age,sex))

#抽样
s<-sample(data[,1],50)
or
s<-sample(1:length(data[[1]]),50)
data[s,]

#典型抽样
library(sampling)
strata(data,stratanames='X1',size=c(5,10,25),method='srswor')

#在大数据中读取总行数并抽样大约0.1%的行(还要记录抽了多少行)
text_1<-file('',open='r',encoding = 'GB2312')
line<-readLines(text_1,n=1)
c<-0
p<-0.001
while(length(line)>0){
  r<-runif(1,min=0,max=1)
  if(r<p){
    print(line)
    c<-c+1
  }
  line<-readLines(text_1,n=1)
}
close(text_1)

#在大数据中查看多少行包含'电影'这个关键词，并抽取其中约1%查看
利用length(grep('i',c('iert','iasd','sd','wergi')))判断
并设双重游标纪录总数目和抽样数

#常量：LETTERS, letters, mon.abb, mon.name, pi

#去除因子化
as.character

#因子化后设置标签
labels=   在factor() 函数内部

#离散化
cut(c(),breaks = n)#会赋予level，改了labels后就能分组
cut(c(),breaks = c())

#有序因子
a<-c(1,1,2,2,1,3,3,2)
t<-ordered(a,levels=c(2,3,1))
order(t)#注意order返回的是t的第几个

#两两间的距离计算
a<-dist(c(1,2,3,5,9),diag=TRUE,upper=TRUE)
b<-as.matrix(a)
colnames(b)<-c(1,2,3,5,9)
rownames(b)<-c(1,2,3,5,9)

#计算大数据中点击搜索页面的统计（所有）

#当前时间
proc.time()


#重设游标
seek(data,where=0)

#正态分布
rnorm,dnorm,qnorm,pnorm

#检验正态分布
(1)qqnorm(data,main='',xlab = ,ylab = )
   qqline(data)
(2)shapiro.test(data)
(3)ks.test(data,as.integer(rnorm(10000,mean=mean(data),sd=sd(data)))
           
#z分数

#矩阵解决线性问题
33秒，5%；43秒，23%
solve(matrix(c(),c(2,2)),matrix(c(),c(2,1)))