data <- read.csv('data.csv', fileEncoding='utf8')

X <- data$等级;
Y <- log(data$资源);

plot(data$等级, data$资源)

#R中自带的求解一元一次线性方程的函数
lm_model <- lm(Y~X)
summary(lm_model)

a <- unlist(lm_model)[[1]]
b <- unlist(lm_model)[[2]]

x <- data$等级;
y <- exp(a)*(exp(b*x))

lines(data$等级, exp(a)*(exp(b*data$等级)))

data.model <- nls(
  资源 ~ A*exp(B*等级), 
  start=list(A=10, B=0.1), 
  data=data, 
  trace=T
)

summary(data.model)
