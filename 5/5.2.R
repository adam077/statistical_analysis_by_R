x <- c(4.89,5.99,5.89,6.22,4.79,
       5.47,4.5,6.61,4.25,6.67,
       4.46,4.5,6.97,5.39,4.56,
       5.03,2.54,5.27,4.48,4.05);

u0 <- 5;
se <- 1;

u <- (mean(x)-u0)/(se/sqrt(length(x)))

#置信度的设置

#例如95%的置信度，那么
#u值的置信区间为：
config = 0.95;
qnorm((1-config)/2)
qnorm(1-(1-config)/2)

#因为u落在置信区间内，因此我们不能拒绝原来的假设

#如果是60%的置信度，那么
#u值的置信区间为：
config = 0.60;
qnorm((1-config)/2)
qnorm(1-(1-config)/2)

config = 0.44;
qnorm((1-config)/2)
qnorm(1-(1-config)/2)

t.test(x)

2*dnorm(u)
#累计概率密度函数
pnorm
p <- 2*(1-pnorm(u))
