library(ggplot2)

df <- data.frame(x = c(1L:12, 1L:12, 1L:12),
                 y = c(rnorm(12), rnorm(12, 2), rnorm(12)),
                 cnt = unlist(lapply(c("Poland", "Russia", "Germany"), rep, 12)))

df_borders <- data.frame(cnt = c("Poland", "Poland", "Russia", "Germany"),
                         start = c(1, 7, 1, 3),
                         end = c(2, 11, 5, 9),
                         type = c("A", "B", "B", "A"))

ggplot(df, aes(x = x, y = y)) +
  geom_segment(data = df_borders, 
               mapping = aes(x = start, xend = end, y = 0, 
                             yend = 0, color = type), size = 100) +
  geom_line() +
  guides(color = guide_legend(override.aes = list(size = 1))) +
  facet_wrap(~ cnt, ncol = 1)
