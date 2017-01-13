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
