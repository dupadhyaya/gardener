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

# Pie Charts ----------------
data11
pie(data11)
data8
pie(x=data11,labels=data8)
?pie
pie(x=data11,labels=data8, radius=.9)
box()
pie(x=data11,labels=data8, clockwise = F)
pie(x=data11,labels=data8, init.angle = 100,clockwise = T) # first label at 100 degrees
pie(x=data11,labels=data8, init.angle = 0,clockwise = T)
pie(x=data11,labels=data8, density=33, angle=30) # slope of shading lines with density
pie(x=data11,labels=data8, density=5, angle=100) # slope of shading lines with density
s=seq(10,80,10)
(s=seq(60,90,5))

?seq
c(paste('gray0',seq(0,9,1),sep=""),'gray10','gray11','gray12')
pie(x=data11,labels=data8, col=c(paste('gray',s,sep="")))
pie(x=data11,labels=data8, col=c('gray40','gray50','gray60','gray70','gray80')) # select colors from pool in sequence, repeat
pie(x=data11,labels=data8, col=c('red','green','blue'), cex = 1.2)
pie(x=data11,labels=data8, , cex = 1.2)
?pie
pie(c(Sky = 78, "Sunny side of pyramid" = 17, "Shady side of pyramid" = 5),
    init.angle = 315, col = c("deepskyblue", "yellow", "yellow3"), border = FALSE)
n <- 200
pie(rep(1, n), labels = "", col = rainbow(n), border = NA,
    main = "pie(*, labels=\"\", col=rainbow(n), border=NA,..")

require(grDevices)
pie(rep(1, 24), col = rainbow(24), radius = 0.9)

pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
names(pie.sales) <- c("Blueberry", "Cherry","Apple", "Boston Cream", "Other", "Vanilla Cream")
pie(pie.sales) # default colours
pie(pie.sales, col = c("purple", "violetred1", "green3","cornsilk", "cyan", "white"))
pie(pie.sales, col = gray(seq(0.4, 1.0, length = 6)))
pie(pie.sales, density = 10, angle = 15 + 10 * 1:6)
pie(pie.sales, clockwise = TRUE, main = "pie(*, clockwise = TRUE)")
segments(0, 0, 0, 1, col = "red", lwd = 2)
text(0, 1, "init.angle = 90", col = "red")
segments(0, 0, 1, 1, col = "red", lwd = 2)
segments(0, 0, 2, 1, col = "red", lwd = 2)
segments(0, 1, 1, 1, col = "red", lwd = 2)
segments(1, 1, 1, 1, col = "red", lwd = 2)
?segments



# Segments
x <- stats::runif(12); y <- stats::rnorm(12)
i <- order(x, y); x <- x[i]; y <- y[i]
plot(x, y, main = "arrows(.) and segments(.)")
## draw arrows from point to point :
s <- seq(length(x)-1)  # one shorter than data
arrows(x[s], y[s], x[s+1], y[s+1], col= 1:3)
s <- s[-length(s)]
segments(x[s], y[s], x[s+2], y[s+2], col= 'pink')

# Cont'd
bird
pie(bird[,1],col=pc)  # coln 1 
mf[1,1:5]
pie(x=mf[1,1:5]) # error x values must be positive
pie(x=as.matrix(mf[1,1:5]))
pie(x=as.matrix(mf[1,1:5]),labels=names(mf),col=pc)
str(mf)

# Cleveland Dot Charts
data11 ; data8
dotchart(data11, labels=data8)
dotchart(bird)
bird
dotchart(t(bird))
str(bird)
class(bird)
t(bird)
?dotchart
dotchart(x, labels = NULL, groups = NULL, gdata = NULL,
         cex = par("cex"), pt.cex = cex,
         pch = 21, gpch = 21, bg = par("bg"),
         color = par("fg"), gcolor = par("fg"), lcolor = "gray",
         xlim = range(x[is.finite(x)]),
         main = NULL, xlab = NULL, ylab = NULL, ...)
dotchart(bird, labels= names(bird), bg='green')
dotchart(bird, color='gray30')
dotchart(bird, gcolor='black',pch=18)
dotchart(bird, lcolor='red', cex=.8)
dotchart(bird, gcolor='blue', xlab='Bird Counts', ylab='Bird Type') # in this ylab has not effect
# Group data
dotchart(bird, gdata=colMeans(bird), gpch=16, gcolor='red')
mtext('Grouping = mean left/bottom', side=3,adj=0)
mtext('Grouping = mean right/top', side=1,adj=1) # side 0, 1
?mtext
mtext(text, side = 3, line = 0, outer = FALSE, at = NA,
      adj = NA, padj = NA, cex = NA, col = NA, font = NA, ...)
