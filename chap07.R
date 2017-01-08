# Chapter -7 : Introduction to Graphical Analysis####
# What you will learn in this chapter
# 
# How to create a range of graphs to summarize your data and results
# How to create box-whisker plots
# How to create scatter plots, including multiple correlation plots
# How to create line graphs
# How to create pie charts
# How to create bar charts
# How to move graphs from R to other programs and to save graphs as files on disk
# In this chapter you learn how to produce a range of graphs including bar charts, scatter plots, and pie charts. This is a “first look” at making graphs, but you return to this subject in Chapter 11, where you learn how to turn your graphs from merely adequate to simply stunning.

# Box Plot ----------------------------
fw
boxplot(fw)
boxplot(fw$speed)
boxplot(fw$count,fw$speed)

#Customise Box Plot
boxplot(fw$count,fw$speed, fw$speed)
boxplot(fw$count,fw$speed, names=c('Count','Speed'))
title('Box Plot of Count and Speed', xlab='Variables', ylab='Values')
# top is upto 1.5 IQR
boxplot(fw$count,fw$speed, names=c('Count','Speed'), range=0) # Extend till top
boxplot(fw$count,fw$speed, names=c('Count','Speed'), col='gray90'
        ,xlab='x label', ylab=' ylabel', main='Main Title')

grass
str(grass)  # graze has 2 factors
boxplot(rich ~ graze, data=grass) # plots = no of factors in graze
boxplot(rich ~ graze, data=grass, range=0)
title('Main Title')

# Horizontal Box Plot
boxplot(rich ~ graze, data=grass, horizontal= T)

with(bf, boxplot(Grass, Heath, Arable))
title(main='Main Title', xlab='Factors', ylab='Values')
with(bf, boxplot(Grass, Heath, Arable, names=c('Grass', 'Heath', 'Arable'))) # does not work
boxplot(bf$Grass, bf$Heath, bf$Arable, names=c('Grass', 'Heath', 'Arable'), col='lightblue')
boxplot(bf)
# boxplot( response ~ groupings)
boxplot(count ~ site, data=bfs)
str(bfs)

str(bf)
boxplot(bf[c(3,2,1)])
boxplot(bf[c(1,2,3)])  # change order of display
boxplot(bf[c("Grass","Heath")])

# Scatter Plot
fw
plot(x,y)
plot(fw)
plot(fw$count, fw$speed, title='', xlab='', ylab='')
plot(fw$count, fw$speed, xlab='', ylab='')
title('Main Title', xlab='X Label', ylab='Y Label')

plot(fw$count, fw$speed, pch=23)
plot(fw$count, fw$speed, pch='+', cex=3)
text(paste0(count,speed))

# Plotting symbols
plot(0:25,rep(1,26))
plot(0:25,rep(1,26),pch=0:25, cex=2)
text(1:25,0.95,as.character(0:25),cex=.8)
#text(1:25,1.05,paste0('(',1:25,',',rep(1,26),')'))

#text(1:25,seq(from=1,length.out=25,by=.05),paste0('(',1:25,',',1,')'))
text(1:25,seq(from=1.1,length.out=25,by=.005),paste0('(',1:25,',',1,')'),cex=.6)

#seq(from=1.1,length.out=25,by=.05)

# Setting Axis Limit ---------------
#ylim=c(start, end)
plot(x=1:25,y=rep(1,25),ylim=c(.5,2), xlim=c(0,25))
plot(x=1:25,y=rep(1,25),ylim=c(.5,2), xlim=c(0,25), pch=18,
     col=c('gray',seq(0,25,1)))
text(x=1:25,y=rep(1,25,labels=c(1:25)))
text(x=1:25,y=rep(1.2,25,labels=c(1:25)))
#ab =(c(1:25),seq(from=0.6,length.out=25,by=.05))
abline(v=c(1:25), h= seq(from=0.6,length.out=25,by=.05))
abline(a=1,b=.1) ; abline(a=1,b=c(.1,.3,.4))  # not working
abline(a=1,b=.01) ; abline(a=1,b=.1)
abline(a=1,b=.2) ; abline(a=1,b=.3)
for ( i in c(.01,.02,.03,.04,.05,.1,.2,.3,.4,.5)) abline(a=1,b=i)


plot.new()
plot(count,speed,data=fw)
lm(count ~ speed, data=fw)
abline(lm(count ~ speed,data=fw))
abline(v=10) ; abline(h=1.5)
abline(v=12, untf=FALSE)
text(12,5,'abline (v=12)',col='red',adj=c(0,-.1))

#abline(a = NULL, b = NULL, h = NULL, v = NULL, reg = NULL, coef = NULL, untf = FALSE, ...)

plot(1:10,1:10)
for ( i in c(0,1,2,3,4,5,6)) abline(a=1,b=i,lwd=i,lty=i,col=paste0('123',i))

#Pairs Plots Multiple Correlations ----------------
fw
plot(fw)
head(mf)
plot(mf)
pairs(mf) # same

#pairs(~ x + y + z, data=...)
pairs(~ Length + Speed + NO3, data=mf)
pairs(~ Length + Speed + NO3, data=mf, col='green', cex=2, pch='x')
pairs(~ Length + Speed + NO3, data=mf, col='green', cex=2, pch='x', cex.labels=3, font.labels=2)

# Lines Charts -------------------
str(Nile)
plot(Nile)
plot(Nile,type='l')
plot(Nile,type='p')
plot(Nile,type='o')
plot(Nile,type='c')
plot(Nile,type='n') # Nothing is plotted, only axis is drawn
with(mf,plot(Length, NO3, type='l'))  # Mess
with(mf[order(mf$Length),], plot(sort(Length), NO3, type='l'))

# Line Charts using Categorical Data
rain
rainfall
plot(rain,type='b')
plot(rainfall$rain, type='b')

plot(rain, type='b', axes=F, xlab='Month', ylab='Rainfall cm')
axis(side=1, at=1:length(rain), labels=month)
axis(side=2)
box()
