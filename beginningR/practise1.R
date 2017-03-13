# Simple Linear Regressino
library(help='datasets')


#http://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R
summary(cars)  # Stopping distance at various speeds
str(cars)  # 50 rows and 2 colns
head(cars)
plot(cars)
plot(cars, col='blue', pch=20, cex=2, 
     main="Relationship between Speed and Stopping Distance for 50 Cars",
     xlab="Speed in mph", ylab="Stopping Distance in feet")

# regression model of stopping distance and speed
cars.lm = lm(dist ~ speed, data=cars)
mean(cars$dist)
summary(cars.lm)
names(cars.lm)
cars.lm$coefficients
plot(speed ~ dist, data=cars) # plot
abline(lm(speed ~ dist, data=cars), col='red') # best fit line
cars.lm$coef ; coef(cars.lm)  # coefficients
confint(cars.lm) # confidence interval
cars.lm$fitted.values ; cars.lm$fitted ; fitted(cars.lm)
cars.lm$call


?scale
set.seed(122)
speed.c = scale(cars$speed, center=T, scale=F)
speed.c
