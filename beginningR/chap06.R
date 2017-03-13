# Chapter -6 : Simple Hypothesis Testing ####
# What you will learn in this chapter
# 
# How to carry out some basic hypothesis tests
# How to carry out the Student’s t-test
# How to conduct the U-test for non-parametric data
# How to carry out paired tests for parametric and non-parametric data
# How to produce correlation and covariance matrices
# How to carry out a range of correlations tests
# How to test for association using chi squared
# How to carry out goodness of fit tests
# In this chapter you learn how to carry out some basic statistical methods such as the t-test, correlation, and tests of association. Learning how to do these is helpful for when you have to carry out more complex analyses and also illustrates a range of techniques for using R.
# Load Beginning.RData
data1;data2;data3

# 2 Sample t test with Unequal Variance
t.test(data2,data3) # Default 2 sample Welsch Test Default unequal Variance
t.test(data2, data3, var.equal = T) # Equal Variance
t.test(data2, mu=5) # 1 sample test

# Direction alternative = 'greater', 'less'
t.test(data2, mu=5,alternative = 'greater') # 1 sample test
t.test(data2, mu=5,alternative = 'less')
t.test(data2, mu=5,alternative = 'two.sided') # default

# Subset samples
grass
t.test(rich ~ graze, data=grass)
t.test(rich ~ graze, data=grass, subset=graze %in% c('mow','unmow'))


# Orchid Data
orchid
attach(orchid)
open-closed
t.test(open,closed)
detach(orchid)

with(orchid,t.test(open,closed, var.equal = T)) # equal variance
mean(open)
t.test(orchid$open, mu=5)

orchis
str(orchis)
t.test(flower ~ site, data=orchis)
t.test(open,mu=7)

orchis2
str(orchis2)
t.test(flower ~ site, data=orchis2, subset=site %in% c('open','closed'))
t.test(orchis2$flower[orchis2$site=='sprayed'], mu=3, alternate='greater')
with(orchis2, t.test(orchis2$flower[orchis2$site=='sprayed'], mu=3, alte='g'))



# T- Test
wilcox.test(data1, data2) # 2 sample Welsch Test Default unequal Variance
wilcox.test(data1, data2,exact = F)



