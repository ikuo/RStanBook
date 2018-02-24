d <- read.csv(file = 'input/data-salary.txt')
res_lm <- lm(Y ~ X, data = d)
X_new <- data.frame(X=23:60)
conf_95 <- predict(res_lm, X_new, interval='confidence', level=0.95)
pred_95 <- predict(res_lm, X_new, interval='prediction', level=0.95)

conf.95 <- predict(res_lm, d, interval='confidence', level=0.95)
pred.95 <- predict(res_lm, d, interval='prediction', level=0.95)

library(ggplot2)
library(dplyr)
df <- data.frame(d, conf = conf.95, pred = pred.95)
df %>% ggplot(aes(x = X)) + geom_point(aes(y = Y)) +
  geom_line(aes(y = conf.fit), color = 'blue') +
  geom_ribbon(aes(ymin = pred.lwr, ymax = pred.upr), alpha = .3, fill = 'blue') +
  geom_ribbon(aes(ymin = conf.lwr, ymax = conf.upr), alpha = .3, fill = 'blue')

# 4.4.11
d_mcmc <- data.frame(a=ms$a, b=ms$b, sigma=ms$sigma)
