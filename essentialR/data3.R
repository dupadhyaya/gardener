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
