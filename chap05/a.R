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
