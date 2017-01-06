# Chapter -10 : Regression and Linear Modeling ####
# 
# What you will learn in this chapter
# 
# How to carry out linear regression (including multiple regression)
# How to carry out curvilinear regression using logarithmic and polynomials as examples
# How to build a regression model using both forward and backward stepwise processes
# How to plot regression models
# How to add lines of best-fit to regression plots
# How to determine confidence intervals for regression models
# How to plot confidence intervals
# How to draw diagnostic plots
# This chapter is all about regression. It builds on earlier chapters and covers various aspects of this important analytical method. You learn how to carry out basic regression as well as complex model building and curvilinear regression. It is also important because it illustrates some useful aspects of R (for example, how to dissect results). The later parts of the chapter deal with graphical aspects of regression, such as how to add lines of best-fit and confidence intervals.
# 

#Simple Regression
fw # DF with 2 columns
cor.test(~count + speed, data = fw)
lm(count ~ speed, data = fw) # response on the right of ~

fw.lm = lm(count ~ speed, data=fw)
summary(fw.lm)
# p values is same as of cor.test
names(fw.lm) # components / info which can be extracted
fw.lm$coefficients
fw.lm$coef # same abbreviated but unique
coef(fw.lm)
confint(fw.lm)   # Confidence Interval of Coefficients bo & b1 at .95
confint(fw.lm, parm=c('(Intercept)','speed'),level=.95)
confint(fw.lm, parm=c('(Intercept)','speed'),level=.90)

# Fitted values / Predict
fitted(fw.lm)
fw$count
fitted(fw.lm) - fw$count  # this is difference predicted & actual values

# Residuals 
residuals(fw.lm)

# Formula
formula(fw.lm) # for the model 
fw.lm$call

# Best fit Model - produce same graphs approx
plot(fw$speed, fw$count) # count is DV, speed is IV
plot(~ speed + count, data = fw)
plot(count ~ speed, data = fw) # DV- IV
plot(formula(fw), data= fw)

# Line of best fit
abline(a=coef(fw.lm[1], b= coef(fw.lm[2])),col='blue') # clumsy
abline(lm(count ~ speed, data=fw), col='red', lty=3, lwd=4) # easy to understand
abline(coef(fw.lm), lwd=5)  # simplest

# Exercise
str(cars)
# regression model of stopping distance and speed
head(cars)
help(cars)
cars.lm = lm(dist ~ speed, data=cars)
summary(cars.lm)
names(cars.lm)
cars.lm$coefficients
plot(speed ~ dist, data=cars) # plot
abline(lm(speed ~ dist, data=cars), col='red') # best fit line
cars.lm$coef ; coef(cars.lm)  # coefficients
confint(cars.lm) # confidence interval
cars.lm$fitted.values ; cars.lm$fitted ; fitted(cars.lm)
cars.lm$call


# Similarity between lm() and aov()
#aov() special case of lm
str(pw) ; names(pw)
head(pw)
(pw.aov = aov(height ~ water, data = pw))
(pw.lm = lm(height ~ water, data = pw))
summary(pw.aov)  # ANOVA special form of lm
summary(pw.lm)   # Regression
anova(pw.lm)  # looks like aov now
# generally aov used for ANOVA and lm for Linear Modeling

# Multiple Regression
# Formula Syntax and Regression Modeling
# y ~ x
# y ~ 1 + x # explicit intercept
# y ~ 0 + x # Linear regression without intercept
# y ~ -1 + x
# y ~ x - 1
# log(y) ~ x1 + x2 # Multiple regression
# y ~ poly(x, 2) # Polynomial regression of y on x with degree 2
# y ~ 1 + x + I(x^2)
# y ~ X + poly(x,2) # y with model matrix 
# y ~ A # One way analysis of variance
# y ~ A + x # Single cls with classes determined by A and covariate x
# y ~ A + B
# y ~ A + B + A:B
# y ~ B %in% A
# y ~ A/B
# y ~ (A + B + C) ^2
# y ~ A * B * C - A:B:C
# y ~ A * x
# y ~ A/x
# y ~ A/(1 + x) - 1

# Model Building - Fwd Stepwise regression , Backward Deletion
# Fwd Stepwise Regression
mf ; str(mf)
# look for predictive variable with largestgg correlation with response var
cor(mf)
# Response variable - Length ; Cor between BOD and Lenght is max; Begin
mf = as.data.frame(mf)
mf.lm = lm(Length ~ BOD, data = mf)
mf.lm
plot(Length~BOD, data=mf)
abline(lm(Length~BOD, data=mf))
str(pb) ; names(pb)  # another data set with many variables
cor(pb$count,pb)  # select 1 variable with other variables

# Model building with Intercept
(mf.lm = lm(Length ~ BOD , data = mf))
(mf.lm = lm(Length ~ 1 , data = mf))  # only intercept term
# now use add1() to see which predictor variable is the best to add next
add1(mf.lm, scope=mf)  # scope - candidates for inclusion
str(mf)
# select attribute with lowest AIC ie BOD here
(mf.lm = lm(Length ~ BOD , data = mf))  
add1(mf.lm, scope=mf)  # next attribute - speed
(mf.lm = lm(Length ~ BOD + Speed, data = mf))  

summary(mf.lm) # Speed is no statistically significant ; check before adding
(mf.lm = lm(Length ~ BOD , data = mf))  # repeat without Speed
add1(mf.lm, scope=mf, test='F')  # next attribute - check sign
# none are significant as Pr > 0.05

#-----------------------------------------------------------------
# Removing Terms with Backwards Deletion drop1
(mf.lm = lm(Length ~ . , data = mf)) # full model with all variables
formula(mf.lm)
drop1(mf.lm, test='F') # check which variable can be removed, check for sign
# Lowest AIC - NO3 or Algae
(mf.lm = lm(Length ~ Speed + NO3 + BOD, data=mf))
drop1(mf.lm, test='F') # check which variable can be removed, check for sign, lowest AIC NO3
(mf.lm = lm(Length ~ Speed + BOD, data=mf))
drop1(mf.lm, test='F') # remove Speed
(mf.lm = lm(Length ~ BOD, data=mf))
drop1(mf.lm, test='F') # remove none

# Comparing Models --------------------------------------------------------

mf.lm1 = lm(Length ~ BOD, data = mf)  # single term
mf.lm2 = lm(Length ~ ., data = mf)   # multiple terms
anova(mf.lm1, mf.lm2)
# there is no difference between them. adding more variables has not made diff
# More models can be included for comparison. if addition of variables do not bring
# significane, use model with least variables

# Exercises ----------------------------
str(mtcars)
(mtcars.lm = lm(mpg ~ 1, data = mtcars))
add1(mtcars.lm, scope=mtcars, test ='F') # least AIC - wt
(mtcars.lm = lm(mpg ~ wt, data = mtcars))
summary(mtcars.lm) # wt is significant

add1(mtcars.lm, scope=mtcars, test ='F') # least AIC - cyl 
(mtcars.lm = lm(mpg ~ wt + cyl, data = mtcars))
summary(mtcars.lm) # all are significant

add1(mtcars.lm, scope=mtcars, test ='F') # no more significant
# Best Model
(mtcars.lm = lm(mpg ~ wt + cyl, data = mtcars))
summary(mtcars.lm) # all are significant

pairs(mtcars)
cor(mtcars$mpg, mtcars)  # wt, cyl is highest corr


# Curvilinear Regression --------------------------------------------------
# Not straight Line
y = m1x1 + m2x2 + m3x3 +.. +c
y = m * log(x) + c 
y = m1x + m2x2 + m3x3 + mnxn + c
# Log Regression
pg
plot(growth ~ nutrient, data = pg) # not linear but log
(pg.lm = lm(growth ~ log(nutrient), data=pg))
summary(pg.lm)
abline(pg.lm) # ??

# Polynomial Regression
bbel ; str(bbel)
plot(abund ~ light, data=bbel) # like a polynomial
(bbel.lm = lm(abund ~ light + I(light^2), data = bbel))
summary(bbel.lm)

# Plotting Lienar Models & Curve Fitting
plot(Length ~ BOD, data = mf)
# Lines - abline(), lines() - straight line
abline(mf.lm)

lines(mf$BOD, fitted(mf.lm))

plot(growth ~ nutrient, data = pg)
lines(pg$nutrient, fitted(pg.lm))

plot(abund ~ light, data = bbel)
lines(bbel$light, fitted(bbel.lm))
lines(spline(bbel$light, fitted(bbel.lm)), col='red', lwd=2)

# Exercise Pg 350
(pg.lm = lm(growth ~ log(nutrient), data=pg))
summary(pg.lm)
plot(growth ~ nutrient, data=pg, ylab= ' Plant Growth', xlab= 'Nutrient Concentration')
lines(spline(pg$nutrient, fitted(pg.lm)), lwd=2, col='orange')
plot(growth ~ log(nutrient), data=pg, ylab='Plant Growth', xlab=' Log Nutrient')
abline(coef(pg.lm))


# Confidence Interval on Fitted Lines -------------------------------------
str(mf)
mf$BOD ; mf$Length
fitted(mf.lm) ; predict(mf.lm)  # are same

predict(mf.lm, interval='confidence') # matrix with 3 colun.
# fitted values, lower conf level, upper conf level ; default level=0.95
predict(mf.lm, interval='confidence', level=.90)

# Draw confidence Brands
prd = predict(mf.lm, interval='confidence', level=0.95) 
#prd = data.frame(prd, mf$BOD) # or use attach/ detach
prd = data.frame(prd)
prd$BOD = mf$BOD
head(prd)  # x or BOD values not in order
prd = prd[order(prd$BOD),]
head(prd)


plot(Length ~ BOD, data=mf)
text (mf$BOD, mf$Length,cex= 0.7, pos=3, col='red' , labels=paste(mf$BOD,mf$Length, sep=','))
lines(prd$BOD, prd$fit) # line of best fit
lines(prd$BOD, prd$lwr, lty=2) # lower conf line
lines(prd$BOD, prd$upr, lty=3) # upper conf line

# Log Regression
pg
plot(growth ~ nutrient, data= pg)
text (pg$nutrient, pg$growth,cex= 0.7, pos=3, col='red' , labels=paste0("(",pg$nutrient, ',',pg$growth,")"))

prd = predict(pg.lm, interval='confidence', level=0.95)
prd = data.frame(prd)
prd$nutrient = pg$nutrient # adding response/ predictor variable to range of DV
prd = prd[order(prd$nutrient, prd$fit),]
prd = prd[order(prd$nutrient),]
prd

lines(spline(prd$nutrient, prd$fit))
lines(spline(prd$nutrient, prd$lwr),lty=2)
lines(spline(prd$nutrient, prd$upr),lty=3)


# Diagnostic Plots --------------------------------------------------------
#plot(my.lm)

my.lm = lm(Length ~ BOD + Speed, data= mf)
plot(my.lm)

# Stepwise
plot(my.lm,1)
plot(my.lm,c(1,3))
plot(my.lm,4)
plot(my.lm,5)
plot(my.lm,3:6)

