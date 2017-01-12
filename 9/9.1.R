data <- read.csv('data.csv', fileEncoding='utf8')

#第一步，画出散点图，求x和y的相关系数
plot(data)
cor(data)

#第二步，拟合线性方程
x <- data$广告投入;
y <- data$销售额;
beta <- (sum(x*y) - nrow(data)*mean(x)*mean(y)) /
        (sum(x^2)-nrow(data)*mean(x)^2);
alpha <- mean(y) - beta*mean(x)
#拟合方程
y2 <- alpha + beta*x;

#第三步、画出拟合方程
abline(alpha, beta);

#第四步、求重相关系数
cor(y, y2)
#求判定系数
cor(y, y2)^2

#第五步、求解问题
alpha + beta*c(50, 40, 30)

#R中自带的求解一元一次线性方程的函数
lm_model <- lm(销售额~广告投入, data=data)
summary(lm_model)

p_data <- data.frame(广告投入=c(50, 40, 30))

predict(lm_model, p_data)
