# Practise 2
# Book Example Sales vs Sq Feet Area : x - sq ft, y - Sales
rm(list=ls())
options(digits=4)
x = c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1)
store = data.frame(area=x,sales=y)
str(store)
apply(store,2,mean)

store.lm1 = lm(sales ~ area, data=store)
summary(store.lm1)
# predict sales = 0.09645 + 1.6699 * area
with(data=store, plot(area, sales))
abline(store.lm1)

# Excel equivalent
store$storex = store$area - mean(store$area)
store$storey = store$sales - mean(store$sales)
store$ssxy = store$storex * store$storey
store$ssx2 = store$storex^2 

store$predicted = fitted.values(store.lm1)     
store
actualmeansales = mean(store$sales)
store$ssr = (fitted.values(store.lm1) - actualmeansales)^2 
store
store$sse = (store$sales - fitted.values(store.lm1))^2  
store
# Residual Value = Observed - Predicted
store$residuals = (store$sales - fitted.values(store.lm1))
store
store$stdresiduals = (store$residuals - mean(store$residuals))/sd(store$residuals)
store

(SSXY = sum(store$ssxy))
(SSX2 = sum(store$ssx2))
(b1 = SSXY/SSX2)
(b0 = mean(store$sales - b1 * mean(store$area)))
coef(store.lm1)
SSR = sum(store$ssr) # Explained Variation
SSE = sum(store$sse) # Unexplained Variation
(SST = SSR + SSE)   # Total Variation
(r2 = SSR/SST)  # Coeff of Determination
# 90.42 variation in sales is due to area
# Std Error of Estimate  Syx
(n = length(store$sales))
(Syx = sqrt(SSE/(n-2)))
b0;b1;r2;Syx
summary(store$residuals)
summary(store.lm1)


# Residual Analysis
plot(store$area, store$residuals)
# No relationship of residuals & area - Linear Model Acceptable
# Fulfills criteria of Linearity Assumptions 

# Normality - 
# Data collected over 1 period, not spread
# Test for auto correlation not required
qqnorm(store$residuals)
qqline(store$residuals)
#modest departure from normal is ok

# Equal Variance
plot(store$area, store$residuals)

#  t -test
(Sb1 = Syx/sqrt(SSX2))
(t = (b1 - 0)/ Sb1)  # 10.64
qt(.975,14-2)  # df = 14-2, CV at alpha .05, two tail test : 1 - .05/2
# t > qt : Reject Ho
# compare with summary of model p = 1.8e-07 < 0.05
summary(store.lm1)

# F-Test  F = MSR/ MSE : MSR = SSR/k; MSE = SSE/(n-k-1)
# k = no of IVs in the model
k=1; n=14
(MSR = SSR/k)
(MSE = SSE/(n-k-1))
(F = MSR/MSE)
qf(.95, df1=1, df2=12)  # One sided distribution alpha = 0.05
# Calcu F  > F from distribution : Reject Ho that there is no relation between area & sales
# There is significant relationship
summary(store.lm1) # Check F and p value

# Confidence Intervals --------------

summary(store.lm1)
confint(store.lm1)
# for area it varies from 1.34 to 2.01 : it is > 0 : there is relation of area & sales
