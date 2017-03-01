# Cars Data Set

#library(help = "datasets")
cars2 = cars
summary(cars2)
head(cars2)
str(cars2)
range(cars2$dist)  # cars can stop in 2 ft to 120 ft

cars2.lm = lm(formula = dist ~ speed, data = cars2)
summary(cars2.lm)
names(cars2.lm)
cars2.lm$coefficients
plot(dist ~ speed, data=cars2) # plot
abline(lm(dist ~ speed, data=cars2), col='red') # best fit line

(estdist =-17.5691 + 3.9324 * mean(cars2$speed))  # Coeff - Estimate


# Residuals
cars2$predict = cars2.lm$fitted.values
cars2$residuals = cars2$dist - cars2.lm$fitted.values
cars2$residuals # Dist values in data and Dist values from predicted model
cars2
plot(cars2.lm)
plot(cars2$residuals)
plot(cars2$predict, cars2$residuals)
cars2

mean((cars2$predict - 42.98)^2)

cars2.lm$coef ; coef(cars2.lm)  # coefficients
confint(cars2.lm) # confidence interval
cars2.lm$fitted.values ; cars2.lm$fitted ; fitted(cars2.lm)  # all are same values from model

cars2.lm$call # model relationship




set.seed(122)

speed.c = scale(cars$speed, center=TRUE, scale=FALSE)
str(speed.c)
