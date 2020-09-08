library(oibiostat)
data("famuss")

pacman::p_load(ggplot2)

p2 <- ggplot(data = famuss, mapping = aes(x = actn3.r577x, fill = race)) +
  theme_minimal() + colorspace::scale_fill_discrete_qualitative() + theme(legend.position = "bottom")
p2 + geom_bar(position = "stack")
p2 + geom_bar(position = "dodge")


pacman::p_load(ggmosaic)
colnames(famuss)
str(famuss)
ggplot(data = famuss) +
  geom_mosaic(aes(x = product(race, actn3.r577x),
                  fill = race), na.rm=TRUE) #+
  # labs(x = "Is it rude recline? ",
       # title='f(DoYouRecline | RudeToRecline) f(RudeToRecline)')

ggplot(data = famuss) +
  geom_mosaic(aes(x = product(race, actn3.r577x),
                  fill = race, conds=product(sex)),
              na.rm=TRUE, divider=mosaic("v")) #+
  # labs(x = "Is it rude recline? ", title='f(DoYouRecline, RudeToRecline| Gender)')


library(ggmosaic)
#> Loading required package: ggplot2
data("fly")
ggplot(data = fly) +
  geom_mosaic(aes(x = product(rude_to_recline), fill=do_you_recline))

head(fly)
colnames(fly)
# install.packages("devtools")
devtools::install_github("haleyjeppson/ggmosaic")

library(ggmosaic)



# quartet -----------------------------------------------------------------


library(datasets)
data("anscombe")

mydata=with(anscombe,data.frame(xVal=c(x1,x2,x3,x4), yVal=c(y1,y2,y3,y4), group=gl(4,nrow(anscombe))))
aggregate(.~mygroup,data=mydata,mean)
aggregate(.~mygroup,data=mydata,sd)
library(ggplot2)
ggplot(mydata,aes(x=xVal, y=yVal)) + geom_point() + facet_wrap(~mygroup)

dev.off()

##-- now some "magic" to do the 4 regressions in a loop:
ff <- y ~ x
mods <- setNames(as.list(1:4), paste0("lm", 1:4))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  ## or   ff[[2]] <- as.name(paste0("y", i))
  ##      ff[[3]] <- as.name(paste0("x", i))
  mods[[i]] <- lmi <- lm(ff, data = anscombe)
  print(anova(lmi))
}

## See how close they are (numerically!)
sapply(mods, coef)
lapply(mods, function(fm) coef(summary(fm)))

library(magrittr)
summary(mods[[1]]) %>% names

lapply(mods, function(fm) summary(fm)$r.squared^0.5)

cor(anscombe$x1, anscombe$y1)

## Now, do what you should have done in the first place: PLOTS
op <- par(mfrow = c(2, 2), mar = 0.1+c(4,4,1,1), oma =  c(0, 0, 2, 0))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  plot(ff, data = anscombe, col = "red", pch = 21, bg = "orange", cex = 1.2,
       xlim = c(3, 19), ylim = c(3, 13))
  abline(mods[[i]], col = "blue")
  text(15,4,sprintf("r = %0.2f",summary(mods[[i]])$r.squared^0.5))
}
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)
par(op)





# NHANES ------------------------------------------------------------------

library(openintro)
data(COL)
library(oibiostat)
data(nhanes.samp.adult.500)

dev.off()


library(openintro)
data(COL)
library(oibiostat)
data(nhanes.samp.adult.500)

plot(nhanes.samp.adult.500$Height,
     nhanes.samp.adult.500$Weight,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "Weight (kg)")
points(nhanes.samp.adult.500$Height,
       nhanes.samp.adult.500$Weight,
       cex = 1.3,
       col = COL[1])
mtext("Height (cm)", 1, 1.9)

t1 <- nhanes.samp.adult.500$Height[480]
t2 <- nhanes.samp.adult.500$Weight[480]
lines(c(t1, t1), c(-10, t2),
      lty = 2,
      col = COL[4])
lines(c(-10, t1), c(t2, t2),
      lty = 2,
      col = COL[4])
points(t1, t2,
       pch = 19,
       cex = 1.3,
       col = COL[4, 3],)

data("nhanes.samp.adult.500")
nhanes.dat <- nhanes.samp.adult.500[,c("Height","Weight","BMI")]
nhanes.dat <- na.omit(nhanes.dat)
fit <- lm(Weight~Height, data = nhanes.dat)
lines(nhanes.dat$Height,
      fit$fitted.values,col="red")
text(190,50, sprintf("r = %0.2f",summary(fit)$r.squared^0.5))



plot(nhanes.samp.adult.500$Height,
     nhanes.samp.adult.500$BMI,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "BMI")
points(nhanes.samp.adult.500$Height,
       nhanes.samp.adult.500$BMI,
       cex = 1.3,
       col = COL[1])
mtext("Height (cm)", 1, 1.9)

t1 <- nhanes.samp.adult.500$Height[480]
t2 <- nhanes.samp.adult.500$BMI[480]
lines(c(t1, t1), c(-10, t2),
      lty = 2,
      col = COL[4])
lines(c(-10, t1), c(t2, t2),
      lty = 2,
      col = COL[4])
points(t1, t2,
       pch = 19,
       cex = 1.3,
       col = COL[4, 3],)
fit <- lm(BMI~Height, data = nhanes.dat)
lines(nhanes.dat$Height,
      fit$fitted.values,col="red")
text(190,50, sprintf("r = %0.2f",summary(fit)$r.squared^0.5))







