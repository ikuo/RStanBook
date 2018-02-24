library(ggplot2)

source('generate-data.R')

d1 <- data.frame(group=1, Y=Y1)
d2 <- data.frame(group=2, Y=Y2)
d <- rbind(d1, d2)
d$group <- as.factor(d$group)

ggplot(data=d, aes(x=group, y=Y, group=group, col=group)) +
  geom_boxplot(outlier.size=0) +
  geom_jitter()
#ggsave(file='fig-ex1.png', plot=p, dpi=300, w=4, h=3)
