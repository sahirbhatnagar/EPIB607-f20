# library(openintro)
# data(COL)

# myPDF("myPlot.pdf")
# histPlot(mariokart$total_pr)
# dev.off()

# data("frog")
# d   <- frog$clutch.volume

# modified from
# https://github.com/OI-Biostat/oi_biostat_text/blob/master/ch_intro_to_data_oi_biostat/figures/frogBoxPlot/frogBoxPlot.R
library(oibiostat)
data("famuss")

d <- famuss$weight

# myPDF("frogBoxPlot.pdf", 6.1, 4,
#       mar = c(0, 4, 0, 1),
#       mgp = c(2.8, 0.7, 0))
boxPlot(d,
        ylab = 'weight (pounds)',
        xlim = c(0.3, 3),
        axes = FALSE,
        ylim = range(d))
axis(2)

df <- boxplot(d, plot = FALSE)

arrows(2, df$stats[1], 1.4, df$stats[1], length = 0.08)
text(2, df$stats[1], 'lower whisker', pos = 4)


arrows(2, df$stats[2], 1.4, df$stats[2], length = 0.08)
text(2, df$stats[2],
     expression(Q[1]~~'(first quartile)'), pos = 4)

arrows(2, df$stats[3], 1.4, df$stats[3], length = 0.08)
text(2, df$stats[3], 'median', pos = 4)

arrows(2, df$stats[4], 1.4, df$stats[4], length = 0.08)
text(2, df$stats[4],
     expression(Q[3]~~'(third quartile)'), pos = 4)

arrows(2, df$stats[5],
       1.4, df$stats[5], length = 0.08)
text(2, df$stats[5],
     'upper whisker', pos = 4)

# outliers midpoint
midpoint <- median(df$out)
for(i in df$out) {
  arrows(2, midpoint, 1.1, i - 0.2, length = 0.08)
}

text(2, midpoint, 'outliers', pos = 4)

points(rep(0.4, length(d[d<=df$stats[3]])), d[d<=df$stats[3]],
       cex = 1.3,
       col = COL[1, 3],
       pch = 1)
points(rep(0.4, length(d[d>df$stats[3]])), d[d>df$stats[3]],
       cex = 1,
       col = COL[4,3],
       pch = "-")




# categorical data --------------------------------------------------------

table(famuss$actn3.r577x)

library(sjPlot)
sjPlot::plot_frq(famuss$actn3.r577x)
barplot(table(famuss$actn3.r577x))


plot(famuss$height, famuss$weight,
     xlab = "Height (in)", ylab = "Weight (lb)", cex = 0.8)

ggplot2::qplot(famuss$height, famuss$weight,
               xlab = "Height (in)", ylab = "Weight (lb)", cex = 0.8)

ggplot2::ggplot(data = famuss, mapping = aes(x = height, y = weight)) +
  geom_point(size = 0.8, pch = 21)


cor(famuss$height, famuss$weight)
summary(lm(height ~ weight, data = famuss))


addmargins(table(famuss$race, famuss$actn3.r577x))
