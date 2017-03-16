# Next Selecting and Sampling Data pg 107

#[]-------------
# select / extract parts of object
newlist = list(Ltrs=letters[1:5], Nmbrs=100:150)
newlist
newlist[2]
newlist[1]

newdf = data.frame(col1=1:3, col2 = 4:6)
newdf
newdf[1]
newdf[2:3,1:2]
newdf[1:2,]
newdf[,-2]
newdf[-3,]
newdf[-(1:2),]

newnum = c(1.5, 2.3, 4.7)
newnum[-2]  # all except 2 item

newarr = array(1:12, dim=c(2,3,2))
newarr
newarr[,c(1,3),2]
newarr[,c(2,3),1]

#$------------
newlm$coefficients
names(newlm)
names(newdf)
newdf$col1
newdf
newdf$col2 = c(10,11,12)
newdf$col2

#droplevels -----------
droplevels(x,except,...)
#drop unused levels
data("InsectSprays")
str(InsectSprays)
levels(InsectSprays$spray)
table(InsectSprays$spray)
ISs = subset(InsectSprays, spray != 'C')
head(ISs)
str(ISs)
levels(ISs$spray)
table(ISs$spray)
ISd = droplevels(ISs)
table(ISd$spray)


#resample ---------Pg 112


