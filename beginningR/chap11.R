# Chapter -11 : More about Graphs ####
# What you will learn in this chapter
# 
# How to add error bars to existing graphs
# How to add legends to plots
# How to add text to graphs, including superscripts and subscripts
# How to add mathematical symbols to text on graphs
# How to add additional points to existing graphs
# How to add lines to graphs, including mathematical expressions
# How to plot multiple series on a graph
# How to draw multiple graphs in one window
# How to export graphs to graphics files and other programs
# This chapter builds on the earlier chapter on graphics (Chapter 7) and also from the previous chapter on regression. It shows you how to produce more customized graphs from your data. For example, you learn how to add text to plots and axes, and how to make superscript and subscript text and mathematical symbols. You learn how to add legends to plots and how to add error bars to bar charts or scatter plots. Finally, you learn how to export graphs to disk as high-quality graphics files, suitable for publication.


# Adding Elements to Existing Plots ---------------------------------------

# Error Bars - show sd, se by using segments
#segments(x_start, y_start, x_end, y_end)
bf # 3 sample columns
(bf.m = apply(bf,2, mean, na.rm=T)) # Mean
(bf.sd = apply(bf,2, sd, na.rm=T)) # SD
# Calculating Length = Sum / Mean
(bf.s = apply(bf,2, sum, na.rm=T)) # Sum
(bf.l = bf.s/bf.m) # Length
# length(bf$Grass[!is.na(bf$Grass)])
# length(bf$Heath[!is.na(bf$Heath)])
# length(bf$Arable[!is.na(bf$Arable)])

str(bf)
# Std Error se = sd/n
(bf.se = bf.sd / bf.l)
bf.se
bf.m + bf.se

max(bf.m + bf.se)
(bf.max = round(max(bf.m + bf.se) + 0.5 , 0))
(bp = barplot(bf.m, ylim=c(0,bf.max)))
# positions of the bars on the x axis 0.7, 1.9 3.1
# this can be used as x values in segments
segments(x0=bp, y0=bf.m + bf.se, x1=bp, y1=bf.m - bf.se)
# x0,y0 - from ; x1,y1 - to
segments(x0, y0, x1 = x0, y1 = y0,
         col = par("fg"), lty = par("lty"), lwd = par("lwd"),
         ...)
# draw cross bars
segments(x0=bp-.3, y0=bf.m + bf.se, x1=bp+0.5, y1=bf.m + bf.se, col='red') # top cross
segments(x0=bp-.4, y0=bf.m - bf.se, x1=bp+0.2, y1=bf.m - bf.se, col='blue' , lty=2) # bottom cross
box()
title('Main Title', xlab='xlabel', ylab='y label')
abline(h=seq(2,10,2), lty=2, col='pink')
abline(h=0, col='brown', lwd=5, lty=1)

# Adding Legends
bird
barplot(bird)
barplot(bird, beside=T)
barplot(bird, beside=T, legend=T)
barplot(bird, beside=F, legend=T, args.legend = list(x='right', bty='n'))
barplot(bird, beside=F, legend=T, args.legend = list(x='top', bty='y'))

palette()
palette(gray(seq(0.5,1,len=6)))
palette()
palette(rainbow(seq(0.5,1,len=6)))
palette()
palette('default')
palette()

barplot(bird, beside=F, legend=T, args.legend = list(x='top', bty='y'), col=palette())
barplot(bird, beside=F, col=palette())
legend(x='topright',legend=rownames(bird))
legend(x='topright',legend=rownames(bird), fill=palette())
?legend
?rainbow
# Color Palettes
rainbow(n, s = 1, v = 1, start = 0, end = max(1, n - 1)/n, alpha = 1)
heat.colors(n, alpha = 1)
terrain.colors(n, alpha = 1)
topo.colors(n, alpha = 1)
cm.colors(n, alpha = 1)

barplot(bird, beside=T, col=palette())
barplot(bird, beside=T, col=rainbow(10,1), legend=T)
barplot(bird, beside=T, col=heat.colors(10,1), legend=T)
barplot(bird, beside=T, col=terrain.colors(10,1), legend=T)
barplot(bird, beside=T, col=topo.colors(10,1), legend=T) # topo
barplot(bird, beside=T, col=cm.colors(10,1), legend=T) # blues & pinks
barplot(bird, beside=T, col=gray(seq(0.5,1,len=7)), legend=T)

# Legend -----------
?legend
legend(x, y = NULL, legend, fill = NULL, col = par("col"),
       border = "black", lty, lwd, pch,
       angle = 45, density = NULL, bty = "o", bg = par("bg"),
       box.lwd = par("lwd"), box.lty = par("lty"), box.col = par("fg"),
       pt.bg = NA, cex = 1, pt.cex = cex, pt.lwd = lwd,
       xjust = 0, yjust = 1, x.intersp = 1, y.intersp = 1,
       adj = c(0, 0.5), text.width = NULL, text.col = par("col"),
       text.font = NULL, merge = do.lines && has.pch, trace = FALSE,
       plot = TRUE, ncol = 1, horiz = FALSE, title = NULL,
       inset = 0, xpd, title.col = text.col, title.adj = 0.5,
       seg.len = 2)

# Adding Text to Graphs -------------
plot(count ~ speed, data=fw, xlab='', ylab='')
title(xlab=expression('Speed ms'^-1)) # super
title(ylab=expression('Count ' ['per net']))  # sub
title(main ='Superscript \n and \n Subscript')  # top
title(sub ='Superscript \t and \t Subscript') # bottom
title(ylab= expression(count[per ~ net]))
title(xlab= expression(Speed[~ ms^1]))

# Changing Typeface
plot(count ~ speed, data=fw, xlab='', ylab='')
title(xlab=expression(italic(' Xlabel ')))
title(ylab=expression(bold(' Xlabel ')), col.ylab='red')

?title
print(expression('Speed ms'^-1))

plot(cars, main = "") # here, could use main directly
title(main = "Stopping Distance versus Speed")
plot(cars, main = "")
title(main = list("Stopping Distance versus Speed", cex = 1.5,
                  col = "red", font = 3))
title(xlab=list('X Label', cex=2, col='green', font=4))
## Specifying "..." :
plot(1, col.axis = "sky blue", col.lab = "thistle")
title("Main Title", sub = "sub title",
      cex.main = 2,   font.main= 4, col.main= "blue",
      cex.sub = 0.75, font.sub = 3, col.sub = "red")


x <- seq(-4, 4, len = 101)
y <- cbind(sin(x), cos(x))
matplot(x, y, type = "l", xaxt = "n",
        main = expression(paste(plain(sin) * phi, "  and  ",
                                plain(cos) * phi)),
        ylab = expression("sin" * phi, "cos" * phi), # only 1st is taken
        xlab = expression(paste("Phase Angle ", phi)),
        col.main = "blue")
axis(1, at = c(-pi, -pi/2, 0, pi/2, pi),
     labels = expression(-pi, -pi/2, 0, pi/2, pi))
abline(h = 0, v = pi/2 * c(-1,1), lty = 2, lwd = .1, col = "gray70")

# Axis orientation
# las= 0-parallel to axis, 1- horiz, 2- perpendicular, 3- vertical
plot(x=1:20, y=1:20, xaxt='n',yaxt='n') # remove axis only
plot(1:10, xaxt='n', ann=FALSE)  # remove labels also
plot(1:10, yaxt='n', ann=FALSE)
plot(1:10, xaxt='n', yaxt='n', ann=FALSE)

axis(2, las=1)
axis(2, las=0) # parallel to axis Default
axis(4, las=3)  # Vertical 
axis(2, las=1) # Horz
axis(1, las=2)  # perpendicular to axis
axis(1, las=3)  # vertical
axis(1, las=0) # parallel to axis Default

# Margins
plot(1:10)
#mar = c(bottom, left, top, right)  # template
mar = c(5,4,4,1)
opt = par(mar=c(8,6,4,2))
par(opt)

# Character Expansion
# cex=n plotting character, cex.axis=n, cex.lab=n axis labels, cex.names=n labels, cex.main=n Main Plot title
plot(1:10)
plot(1:10, pch=2, cex=2)
plot(1:10, pch=2, cex=2 , cex.axis=2, cex.lab=2.5, main='Main Title', cex.main=2)
plot(1:10, pch=2, cex=2 ,  sub='sub Title', cex.sub=2)

# Adding text to Plot Area
# Label points, state stats results
text(x,y, labels=...., pos=1(under), 2(left), 3(above), 4(right))
plot(1:10,1:10, pch=3, cex=1.5)
text(4,4, 'Centered on Point', col='red') # color
text(3,3, ' Under Point -1', pos=1, cex=2)# text magn
text(5,5, ' Left Point -2', pos=2, font=2) # font type
text(6,6, ' Above Point -3', pos=3, offset=.2) # offset char width
text(7,7, ' Right Point -4', pos=4, srt=5) # with rotation

# Locator
plot(1:10,1:10, pch=3, cex=1.5)
locator(1) # click on the map
?locator
locator(n = 512, type = "n", ...) # points to locate, type- (l,o) join them
locator(n=4, type = 'l')
locator(n=3, type = 'o')
text(locator(1),' print this text ')
text(locator(1),' print this text ', pos=3)  # at left/right/abov/below


# Add text in Plot Margins
#mtext(text, side=3, line=0, font=1, adj=0.5..)
# side = 1,2,3,4 = B,L,T,R
#Offset by line = 0,1 outer, + outwards, - inward
plot(1:10,1:10, pch=3, cex=1.5)
mtext('mtext(side=1, line=-1)', side=1, line=-1)
mtext('mtext(side=2, line=-1)', side=2, line=-1, font=3)
mtext('mtext(side=3, line=3)', side=3, line=3, font=4)
mtext('mtext(side=3, line=-2)', side=3, line=-2, font=2)
mtext('mtext(side=4, line=-2)', side=4, line=-2, font=2, cex=2)
mtext('mtext(side=4, line=+1)', side=4, line=+1, font=2, cex=1, col='red')
mtext('mtext(side=4, line=0)', side=4, line=0, font=2, cex=1, col='blue')
mtext('mtext(side=4, line=0, adj=0)', side=4, line=0, adj=0, cex=1, col='green')
mtext('mtext(side=4, line=0, adj=0,las=1)', side=4, line=0, adj=1, las=1, col='green')
# las - orientation of text wrt margin
# Mathematical Expressions
# 
plot(1:10,1:10, type='n')
opt = par(cex=1.5)
text(1,1, expression(hat(x))) 
text(4,4, expression(hat(y))) 
text(2,2, expression(alpha==x)) 
text(3,3, expression(beta==x)) 
text(4,4, expression(frac(x,y))) 
text(5,5, expression(sum(x))) 
text(6,6, expression(sum(x^2)))
text(7,7, expression(bar(x)==sum(frac(x(i),n),i==1,n)))
text(8,8, expression(sqrt(x)))
text(9,9, expression(sqrt(x,3)))
opt = par(cex=1)
text(2,4, expression(italic(x^2)))
text(3,6, expression(x %+-% y + x %/% y + x %up% y + infinity), col='red')
text(5,8, expression( italic(test) + plain(test) + alpha ~ omega + Alpha ~ Omega + 180*degree + x ~ y), col='blue', cex=1.5)

# Try out exercise Pg 357
#Make y axis labels horizontal and names of bar larger than std
(grass.m = tapply(grass$rich, grass$graze, FUN=mean))
(grass.sd = tapply(grass$rich, grass$graze, FUN=sd))
(grass.l = tapply(grass$rich, grass$graze, FUN=length))
(grass.se = grass.sd/ sqrt(grass.l))
(grass.max = round(max(grass.m + grass.se)+ 0.5, 0))
# basic Plot
bp = barplot( grass.m, ylim= c(0, grass.max))
title(xlab='Treatment', ylab=' Spicies Richness')
# Error Points
segments(bp, grass.m + grass.se, bp, grass.m - grass.se, lwd=2)
# add hats  - upper and then lower
segments(bp-0.1, grass.m+grass.se, bp+0.1, grass.m+grass.se, lwd=2)
segments(bp-0.1, grass.m-grass.se, bp+0.1, grass.m-grass.se, lwd=2)

# Try out Pg 381

bp = barplot ( grass.m, ylim = c(0,grass.max), las =1, cex.names = 2)
segments(bp,grass.m + grass.se, bp, grass.m - grass.se, lwd=2)
segments(bp - 0.1 ,grass.m - grass.se, bp + 0.1, grass.m - grass.se, lwd=2)
segments(bp - 0.1 ,grass.m + grass.se, bp + 0.1, grass.m + grass.se, lwd=2)

title(ylab= expression ( Richness-per-m^2))
title(xlab= expression (Treatment (cutting)))
text(bp, grass.m - 0.5, as.character(grass.m))
result = 't = 4.8098\ndf = 5.411\np = 0.0039'
text(locator(1), result, font=3)

mtext('Mean values', side=4)
box()

# Adding points to an existing graph
?points
#points(x, y = NULL, type = "p", ...)
fwi
# predictor speed , response next 2 colns - 2 y axis
plot(sfly ~ speed, data= fwi, pch=21, ylab='Abundance', xlab='Speed')
points(mfly ~ speed, data = fwi, pch=24, col='red')
legend(x= 'topright', legend=c('Stonefly', 'Mayfly')
       ,pch=c(21,24), col=c('black','red'), bty='n' )
lines(sfly ~ speed, data=fwi)  # data should be sorted
# try it out Pg 384
plot(sfly[order(speed)] ~ sort(speed), data=fwi, pch=21,col='blue')
points(mfly[order(speed)] ~ sort(speed), data=fwi, pch=23,col='red')

lines(sfly[order(speed)] ~ sort(speed), data =fwi, col='green', lwd=2)
lines(mfly[order(speed)] ~ sort(speed), data =fwi, col='purple', lwd=3)
legend(x='topright', legend=c('Stonefly', 'Mayfly'), pch=c(21,23), col=c('blue','red'), bty='n')
# Another way  .. sort data before
fwi2 = fwi[order(fwi$speed),]
plot(sfly ~ speed, data=fwi2, pch=21,col='blue')
points(mfly ~ speed, data=fwi2, pch=23,col='red')

lines(sfly ~ speed, data =fwi2, col='green', lwd=2)
lines(mfly ~ speed, data =fwi2, col='purple', lwd=3)

# Another way
#https://www.r-bloggers.com/r-single-plot-with-two-different-y-axes/
#
plot.new()
par(mar = c(5,5,2,5))  # set margins areas to accomdate legends
plot(sfly ~ speed, data=fwi2, pch=21,col='blue')
lines(sfly ~ speed, data =fwi2, col='green', lwd=2)
# label data points
library(calibrate)
textxy(fwi2$speed, fwi2$sfly, labs = paste0('(',fwi2$speed,',',fwi2$sfly,')'), dcol='green', cx=.5, offset=.8)
?textxy
#textxy(X, Y, labs, m = c(0, 0), cex = 0.5, offset = 0.8, ...)

par(new = T)
with(fwi2, points(mfly ~ speed, pch=24, col='magenta'))

#with(fwi2, points(mfly ~ speed, pch=24, axes=F, xlab=NA, ylab=NA, cex=1.2, col='magenta'))

with(fwi2, lines(mfly ~ speed, data = fwi2, col='purple', lwd=3))

axis(side = 4, col= 'purple')
mtext(side = 4, line = 3, 'Mfly Values')
# Label Data Points
text(fwi2$speed, fwi2$mfly, labels = paste0('(',fwi2$speed,',',fwi2$mfly,')'), col='purple', cex=.9, offset=10 )

# Adding Various Lines to Graphs --------------
# Straight Lines
?abline
abline(a = NULL, b = NULL, h = NULL, v = NULL, reg = NULL,
coef = NULL, untf = FALSE, ...)
# a-slope, b-intercept, h-horz, v - vertical, coefficients, 
# abline( lm(response ~ predictor), data= ..)
# abline(h= );  abline(v=..) ; abline(a=.., b=..)
plot(sfly ~ speed, data=fwi2, ylim=c(0,30), xlim=c(0,10))
abline(lm(sfly ~ speed, data=fwi2))
#horizontal lines
abline(h=seq(5,30,5), lty=2, col='gray50')
abline(h=mean(fwi2$sfly), lwd=3, col='red')
text(4,mean(fwi2$sfly)+2,expression(italic('Mean of Sfly')), offset=1, col='red')

# pg 386
abline(v=1:9,lty=2,col='green')
abline(a=0,b=1, lty=3, lwd=1.8, col='blue' )
abline(a=0,b=1:5, lty=3, lwd=1.8, col='blue' ) # Not working
c1 = lm(mfly ~ speed, data=fwi2)
abline(coef=c1, col='purple')  # Not working

# Curved Lines 
?lines
lines(x, y = NULL, type = "l", ...)
plot(cars)
lines(stats::lowess(cars))

bbel
bbel.lm
plot(abund ~ light, data = bbel)
lines(bbel$light, bbel$abund, col='green', lwd=2)
lines(bbel$light, fitted(bbel.lm), col='red', lwd=3)
# same as lines(fitted(bbel.lm) ~ light, data=bbel, col='blue')
# better lines using spline
lines(spline(bbel$light, fitted(bbel.lm)), col='purple', lwd=4)

# plot points along the line
plot(abund ~ light, data = bbel, type='n')
lines(spline(bbel$light, fitted(bbel.lm))
      , type='b', pch=16, lty=3, col='purple', lwd=4)

#
plot(abund ~ light, data = bbel, type='n')
lines(bbel$light, bbel$abund, type='b', col='green', lwd=2)
text(bbel$light, bbel$abund,labels=paste0('value',1:length(bbel$abund)))

# another type
plot(abund ~ light, data = bbel, type='n')
lines(bbel$light, bbel$abund, type='o', col='green', lty=1, lwd=2,pch=21)
lines(bbel$light, bbel$abund+1, type='l', col='red', lty='solid', lwd=2, pch=15)
lines(bbel$light, bbel$abund+2, type='n', col='gray', lwd=2)  # no line
lines(bbel$light, bbel$abund+3, type='b', col='blue', lty=4 ,lwd=2, pch='+')  # no line

title(main = 'Fitted Polynomial regression')


# Plotting Mathematical Expressions
?curve
curve(expr, from = NULL, to = NULL, n = 101, add = FALSE,
      type = "l", xname = "x", xlab = xname, ylab = NULL,
      log = NULL, xlim = NULL, ...)
plot(log)
plot(log, from=1, to=1e3)  # x = 1 to 1000
curve(log10, from=1, to = 1e3, add=T, lty=3, col='red')
curve(log, from=1, to=1e3, log='xy')
curve(log, from=1, to=1e3, log='x')
curve(log, from=1, to=1e3, log='y')
curve(log, from=1, to=1e3)
curve(sin,from= -pi*2,to=pi*2, lwd=1.5, ylab='Function', ylim=c(-1,1.5))
abline(h=0,col='red')
curve(cos,from=-pi*2, to=pi*2, lwd=2, add=T, col='blue')
abline(v=c(-pi*2,-pi*3/2,-pi,-pi/2,0,pi/2,pi,pi*3/2,pi*2), col='green')
legend(x='topright', legend=c('Sine','Cosine'), lty=c(2,3)
       ,lwd = c(1.5,1), bty='n', col=c('red','blue'))
title(main='Sine and Cosine Functions')

# Complex Functions
pn = function(x) x + x^2
pn
pn(c(1,2,3)) # 1+1^2, 2+2^2, 3+3^2
pn(1) ;pn(2) ;pn(3)
bbel.lm
# use this formula
pn = function(x) -2.0048 +  2.0601 * x  + -0.043 * x^2 
pn 
pn(1)
curve(pn, from=0, to=50, lwd=2, lty=3, ylab='Function')
curve(pn, from=0, to=40, lwd=2, lty=3, ylab='Function')
title(main= expression(y==-2.0048 +  2.0601 * x  + -0.043 * x^2 ))

# Add short segments of lines 
?segments
segments(x0, y0, x1 = x0, y1 = y0,
         col = par("fg"), lty = par("lty"), lwd = par("lwd"),
         ...)
segments(1,1, 15,15, col='red', lwd=2)
# Adding Arrows to an Existing Graph
?arrows
arrows(x0, y0, x1 = x0, y1 = y0, length = 0.25, angle = 30,
       code = 2, col = par("fg"), lty = par("lty"),
       lwd = par("lwd"), ...)
arrows(1,1, 5,5, angle=45, col='blue')
arrows(bp, bf.m + bf.se, bp, bf.m - bf.se, length = 0.1, angle=90, code=3)
# angle 90 to draw error graphs, code=3 set heads at both ends
fw
plot(count ~ speed, data=fw, pch='.')
(s = seq(length(fw$speed)-1))
arrows(fw$speed[s], fw$count[s], fw$speed[s+1], fw$count[s+1], length=0.15
       , angle=20, lwd=2, col='green', code=2)
text(fw$speed[s], fw$count[s], labels = s)
# data to be sorted order or else
# fws = fw[order(fw$speed, decreasing=T),]
arrows(fw$speed[s], fw$count[s], fw$speed[s+1], fw$count[s+1], length=0.15
       , angle=50, lwd=1, col='red', code=1)
arrows(fw$speed[s], fw$count[s], fw$speed[s+1], fw$count[s+1], length=0.15
       , angle=50, lwd=1, col='blue', code=3)

# Matrix Plots
# Multiple Series on one graph
?matplot
matplot(x, y, type = "p", lty = 1:5, lwd = 1, lend = par("lend"),
        pch = NULL,
        col = 1:6, cex = NULL, bg = NA,
        xlab = NULL, ylab = NULL, xlim = NULL, ylim = NULL,
        ..., add = FALSE, verbose = getOption("verbose"))

matpoints(x, y, type = "p", lty = 1:5, lwd = 1, pch = NULL,
          col = 1:6, ...)

matlines (x, y, type = "l", lty = 1:5, lwd = 1, pch = NULL,
          col = 1:6, ...)
ivert # two colns
spd  # single coln
matplot(spd, ivert)  # 1- sfly, 2-mfly
matplot(spd, ivert, type='b', pch=1:2, col=c('red','blue'), lty=2:3
        , xlab='Speed', ylab=' Invertebrate Count')
legend(x = 'topright', legend=c('sfly','mfly'), bty='n', pch=1:2, col=c('red','blue') )
legend(x = 'topleft', legend=c('sfly','mfly'), bty='n', pch=1:2, col=1:2 )

# Multiple Plots in 1 Windows
mfrow = c(nrows, ncols)
mcols = c(nrows, ncols)
opt = par(mfrow = c(2,2))  # 2 rows & 2 cols
plot(Length ~ BOD, data=mf, main='Plot1')
plot(Length ~ Algae, data=mf, main='Plot2')
plot(Length ~ Speed, data=mf, main='Plot3')
plot(Length ~ NO3, data=mf, main='Plot4')

# Plots by Columns
opt = par(mfcol=c(2,2))
plot(Length ~ BOD, data=mf, main='Plot1')
plot(Length ~ Algae, data=mf, main='Plot2')
plot(Length ~ Speed, data=mf, main='Plot3')
plot(Length ~ NO3, data=mf, main='Plot4')

# Skipping Plots
opt = par(mfcol=c(2,2))
plot(Length ~ BOD, data=mf, main='Plot1')
plot.new()
plot.new()
plot(Length ~ NO3, data=mf, main='Plot4')
par(opt)

plot.new()
# Directly to Plot area
par(mfg=c(2,2))
plot(Length ~ BOD, data=mf, main='Plot1')
par(mfg=c(1,2))
plot(Length ~ Speed, data=mf, main='Plot3')
par(mfg=c(1,1))
plot(Length ~ BOD, data=mf, main='Plot1')
par(opt)
?par #par can be used to set or query graphical parameters.
opt

op <- par(oma=c(5,7,1,1))
par(op)

# Splitting the Plot Windows into Unequal Sections
?split.screen
#split.screen defines a number of regions within the current device 
#which can, to some extent, be treated as separate graphics devices
split.screen(figs=c(rows, cols))
split.screen(figs = c(2,1))  # 2 areas aval
screen() # current area
screen(2)
split.screen(figs=c(1,2))
close.screen()
screen(2)
plot(Length ~ Algae, data = mf, main='Plot2')
screen(1)
plot(Length ~ BOD, data = mf, main='Plot1')
close.screen(n=1:12)

op <- par(oma=c(5,7,1,1))
par(op)
close.screen(n=1:12)
split.screen(figs=c(1,2))
screen(2)
plot(Length ~ Algae, data = mf, main='Plot2')
screen(1)
plot(Length ~ BOD, data = mf, main='Plot1')

# Next way
op <- par(oma=c(5,7,1,1))
par(op)
close.screen(n=1:12)
split.screen(figs=c(2,1))
# increase Height of Plot area
screen(2)
plot(Length ~ Algae, data = mf, main='Plot2')
screen(1)
plot(Length ~ BOD, data = mf, main='Plot1')

# Next way
op <- par(oma=c(5,7,1,1))
par(op)
close.screen(n=1:12)
split.screen(figs=c(2,1))
screen()
screen(2)
split.screen(figs=c(1,2))
close.screen() # check how many parts you have - 4 now
# increase Height of Plot area
screen(2)
plot(Length ~ Algae, data = mf, main='Plot2')
screen(1)
plot(Length ~ BOD, data = mf, main='Plot1')
# erase bottom plot
opt = par(bg='white')
erase.screen(n=2)
par(opt)
screen(3)
plot(Length ~ Speed, data = mf, main='Plot3')
screen(4)
plot(Length ~ NO3, data = mf, main='Plot4')
close.screen(n=3:4) # to remove splits
# it will show how many left
close.screen()
close.screen(all.screens = T)
close.screen()  # none available now

# Copy & Paste to Move Graphs
# Resizing Windows
?windows  # for windows
windows(width, height, pointsize, record, rescale, xpinch, ypinch,
        bg, canvas, gamma, xpos, ypos, buffered, title,
        restoreConsole, clickToConfirm, fillOddEven,
        family, antialias)
windows(height, width, bg)
??quartz  # for Mac

?X11  # for linux
x11(width, height, pointsize, bg, gamma, xpos, ypos, title)
windows(width=7, height=6, bg='green')
plot(1:10,1:10,main='Testing Size of Plot')

# Saving
?png
png(filename = "Rplot%03d.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"), antialias)
jpeg(filename = "Rplot%03d.jpg",
     width = 480, height = 480, units = "px", pointsize = 12,
     quality = 75,
     bg = "white", res = NA, family = "", restoreConsole = TRUE,
     type = c("windows", "cairo"), antialias)
tiff(filename = "Rplot%03d.tif",
     width = 480, height = 480, units = "px", pointsize = 12,
     compression = c("none", "rle", "lzw", "jpeg", "zip", "lzw+p", "zip+p"),
     bg = "white", res = NA, family = "", restoreConsole = TRUE,
     type = c("windows", "cairo"), antialias)

?pdf #pdf starts the graphics device driver for producing PDF graphics.

pdf(file = if(onefile) "Rplots.pdf" else "Rplot%03d.pdf",
    width, height, onefile, family, title, fonts, version,
    paper, encoding, bg, fg, pointsize, pagecentre, colormodel,
    useDingbats, useKerning, fillOddEven, compress)
pdf(file='Rplot%03d,pdf',width=6,height=7,bg='yellow',colormodel = 'gray')
windows(width=7, height=6, bg='green')
plot(1:10,1:10,main='Testing Size of Plot')

# Copy a Graph from Screen to Disk File --------------


# Making a New Graph Directly to a Disk File



# Create a device using appropriate driver

# Issue Graphics command eg boxplot, barplot

# Add additional Graphics eg title(), axis, abline

# Finish the plot by command
dev.off()

# Try it out
# For best results, make a trial plot on the screen
plot(sfly ~ speed, data=fwi, main='Scatter Plot', pch=16, cex=2, las=1)
abline(h=mean(fwi$sfly), lty=3, lwd=2)
abline(v=mean(fwi$speed), lty=3, lwd=2)
abline(lm(sfly ~ speed, data=fwi), lty=2, col='blue')
text(max(fwi$speed), mean(fwi$sfly) + 0.5, 'Mean Sfly', pos=2, font=3)
text(mean(fwi$speed), max(fwi$sfly), pos=4,srt=270,'Mean Speed', font=3)
#
windows(width=7, height=7)
# redraw the graph
png(file='7in300dpi.tif', height=2100, width=2100, res=300, bg='white')
dev.off()
# create a png with 150 dpi low resolution, larger size
png(file='7in150dpi.tif', height=2100, width=2100, res=150, bg='green')
# Graph commands
dev.off()
# create a png with 600 dpi  smaller size, more packing of dots
png(file='7in600dpi.png', height=2100, width=2100, res=600, bg='gray')
# Graph commands
dev.off()


# Multiple Plots to PDF
pdf(file='plot.pdf')
par(mfrow=(c(1,3)))
plot(1:10)
plot(rnorm(10))
plot(rnorm(10))
dev.off()

#
library(plyr)
pdf("plots.pdf", width = 7, height = 7)
?d_ply
d_ply(df, .(z), failwith(NA, function(x){plot(x$y,main=unique(z))}), .print=TRUE)
dev.off()

#https://www.r-bloggers.com/automatically-save-your-plots-to-a-folder/
#http://stackoverflow.com/questions/7534606/save-multiple-graphs-one-after-another-in-one-pdf-file
#