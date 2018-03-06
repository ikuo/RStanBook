library(rstan)

d <- read.csv('../input/data-ss2.txt')
T <- nrow(d)
data <- list(T=T, T_pred=8, Y=d$Y)
stanmodel <- stan_model(file='ex2.stan')
fit <- sampling(stanmodel, data=data, iter=4000, thin=5, seed=1234)

save.image('../output/result-ex2.RData')
library(ggmcmc)
ggmcmc(ggs(fit, inc_warmup=TRUE, stan_include_auxiliar=TRUE),
       file='../output/fit-traceplot-ex2.pdf', plot='traceplot')

library(dplyr)
ms <- rstan::extract(fit)
T_all <- dim(ms$mu_all)[2]
df.est <- data.frame(qtl = t(apply(ms$mu_all, 2, quantile, prob = c(.05, .5, .95))), t=1:T_all)
ggplot(d, aes(x=X,y=Y)) + geom_point() + geom_line() +
  geom_line(data=df.est, aes(x=t, y=qtl.50.)) +
  geom_ribbon(data=df.est, aes(x=t, y=qtl.50., ymin=qtl.5., ymax=qtl.95.), alpha=0.3)
