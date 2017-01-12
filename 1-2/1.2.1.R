#读入学生成绩的数据
data <- read.csv("1.2.1.csv", stringsAsFactors = TRUE)
#按照班级先做一个排序
data <- data[order(data[,2]), ]

#进行随机抽样
rSample <- sample(1:nrow(data), 30, replace = FALSE)
#进行行抽取
sampleR <- data[rSample, ]

#install.packages("sampling")

library(sampling)
#进行典型抽样
strata(data, stratanames="class", size=c(5, 10, 15), method="srswor")
