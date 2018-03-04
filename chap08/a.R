library(ggmcmc)

# model8-4
ggmcmc(ggs(fit4, inc_warmup=T, stan_include_auxiliar=T),
           file='output/fit-traceplot-4.pdf',
           plot='traceplot'
           )
