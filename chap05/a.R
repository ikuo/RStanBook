# 5.1.2

d <- read.csv(file='input/data-attendance-1.txt')

library("PerformanceAnalytics")
chart.Correlation(d)

d$A <- as.factor(d$A)

pairs(d)

library("psych")
pairs.panels(d)

# 5.1.7

library("ggmcmc")
ggmcmc(ggs(fit, inc_warmup=TRUE, stan_include_auxiliar=TRUE),
       file='output/fit-traceplot.pdf', plot='traceplot')

# 5.1.8
library(psych)
df <- data.frame(b1=ms$b1, b2=ms$b2, b3=ms$b3, sigma=ms$sigma, mu1=ms$mu[,1], mu50=ms$mu[,50], lp__=ms$lp__)
dev.new()
pairs.panels(df)
dev.off()
