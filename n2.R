if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')

set.seed(1337)
dens.plot <- function(n = 1000, mean = 0, sd = 1, p.1 = 0.25, p.2 = 0.75)
{
  vec <- rnorm(n = n, mean = mean, sd = sd)
  dens <- density(vec)
  df <- data.frame(dens$x, dens$y)
  
  pp <- quantile(df$dens.x, c(p.1, p.2))
  
  
  ggplot(df,aes(dens.x, dens.y)) +
    geom_line() +
    geom_area(data = subset(df, dens.x < pp[1] & dens.x > min(dens.x)), 
              aes(dens.x, dens.y), fill = "lightblue", alpha = 0.7) +
    geom_area(data = subset(df, dens.x > pp[2] & dens.x < max(dens.x)), 
              aes(dens.x, dens.y), fill = "lightblue", alpha = 0.7) +
    geom_area(data = subset(df, dens.x < pp[2] & dens.x > pp[1]), 
              aes(dens.x, dens.y), fill = "red", alpha = 0.5) +
    geom_vline(xintercept = pp[1], linetype = 2) +
    geom_vline(xintercept = pp[2], linetype = 2)
}
dens.plot()
