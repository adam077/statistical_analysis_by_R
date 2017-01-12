#一个是33秒，排名5%，一个是43秒，排名23%

#从标准正态分布中，求出5%，23%百分位对应的z值是什么
z05_100 <- qnorm(0.05, mean=0, sd=1)
z23_100 <- qnorm(0.23, mean=0, sd=1)
#求解线性方程组
#z05_100 = (33 - _mean)/_sd   =>  z05_100*_sd + _mean = 33
#z23_100 = (43 - _mean)/_sd   =>  z23_100*_sd + _mean = 43
#求解线性方程组
r <- solve(
  matrix(
    c(z05_100, 1, z23_100, 1), 
    nrow = 2, ncol = 2, 
    byrow=TRUE
  ), 
  matrix(
    c(33, 43), 
    nrow = 2
  )
);
#进行验证
pnorm(33, mean=r[2, 1], sd=r[1, 1])
pnorm(43, mean=r[2, 1], sd=r[1, 1])
