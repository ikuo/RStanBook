library(ggmcmc)

# model8-4
ggmcmc(ggs(fit4, inc_warmup=T, stan_include_auxiliar=T),
           file='output/fit-traceplot-4.pdf',
           plot='traceplot'
           )

## 8.4

library(psych)
library(dplyr)
library(ggmcmc)

df <- data.frame(d1) %>% inner_join(data.frame(d2))
pairs.panels(df)

#ggmcmc(ggs(fit, inc_warmup=T, stan_include_auxiliar=T),
#           file='output/fit-traceplot-model8-8.pdf',
#           plot='traceplot'
#           )