dataA <- read.csv("A.csv")
dataB <- read.csv("B.csv")

mA <- mean(dataA[, 1]);
mB <- mean(dataB[, 1]);

sdA <- sd(dataA[, 1]);
sdB <- sd(dataB[, 1]);

zA <- (65 - mA)/sdA;
zB <- (42 - mB)/sdB;
