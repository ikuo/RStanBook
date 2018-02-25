library(rstan)
source('generate-data.R')

data <- list(N1=N1, N2=N2, Y1=Y1, Y2=Y2)
t1 <- Sys.time()
fit <- stan(file='ex5.stan', data=data, seed=1234)
t2 <- Sys.time()
t2 - t1

ms <- extract(fit)
prob <- mean(ms$mu1 < ms$mu2)  #=> 0.9457
