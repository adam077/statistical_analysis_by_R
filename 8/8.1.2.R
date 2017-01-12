data <- read.csv("data.csv", fileEncoding='UTF-8');

tj_data <- data[data$专业=='统计学', ]
jr_data <- data[data$专业=='金融学', ]
gjmy_data <- data[data$专业=='国际贸易学', ]

t.test(tj_data$收入, jr_data$收入)
t.test(tj_data$收入, gjmy_data$收入)
t.test(jr_data$收入, gjmy_data$收入)
