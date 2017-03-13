# Chapter -9 : Manipulating Data and Extracting Components ####
# What you will learn in this chapter
# 
# How to create data frames and matrix objects ready for complex analyses
# How to create or set factor data
# How to add rows and columns to data objects
# How to use simple summary commands to extract column or row information
# How to extract summary statistics from complex data objects
# This chapter builds on the previous one. Now that you have seen how to define more complex analytical situations, you learn how to make and rearrange your data so that it can be analyzed more easily. This also builds on knowledge gained in Chapter 3. In many cases, when you have carried out an analysis you will need to extract data for certain groups; this chapter also deals with that, giving you more tools that you will need to carry out complex analyses easily.
# 

# Various ways to create data items - c(), scan(), read.table()
mow ; unmow
load('Beginning.RData')

mow; unmow
length(mow) = length(unmow)  # same length
unmow= c(unmow,20)
grassy
grassy = data.frame(mow,unmow)
grassy
names(grassy)  # coln names
names(grassy) = c('mown','unmown')
names(grassy)  # coln names
grn = paste0('r',1:6)
grn
row.names(grassy) =grn
grassy

# stack in IV DV format
stack(grassy)  # some NA values seen, coln names changed
na.omit(stack(grassy))  # omit NA values

# Another method to stack esp with multiple variables
trt = c(rep('mow',length(mow)), rep('unmow',length(unmow)))
trt
rich = c(mow, unmow) # 1vector with values
rich
data.frame(rich, trt)
grass.dat = na.omit(data.frame(rich, trt))
grass.dat

# Matrix Objects ----------------
mow ; unmow
length(mow)= length(unmow) # match the lengths
rbind(mow,unmow)  # colnnames are not set

rich
length(rich)
matrix(rich, ncol=2)
matrix(rich, nrow=2)
matrix(rich, nrow=2, byrow=T)
t(matrix(rich, nrow=2, byrow=T))
matrix(rich, ncol=2)

# Creating / Setting Factors
rich ; graze
length(graze)
grass.df = data.frame(rich,graze)  # unequal length
length(graze) = length(rich)
grass.df = data.frame(rich,graze)
grass.df
grass.df = na.omit(data.frame(rich,graze))
grass.df
str(grass.df)
grass.df$graze = as.factor(grass.df$graze)
class(graze)
graze
graze.f = factor(na.omit(graze))
graze.f
nrow(grass.df)
grass.df= rbind(grass.df, c(14,'unmow'))
grass.df$graze2 = graze.f
grass.df
row.names(grass.df) = 1:length(grass.df$graze)
grass.df
str(grass.df)

remove(list=ls())
load('Beginning1.RData')
rich; graze
grass.df = data.frame(rich,graze)
grass.df
str(grass.df)
graze
graze.f = factor(graze)
graze.f
grass.df$graze2 = graze # add another coln, link to a vector
str(grass.df)
grass.df # 2 colnw have same values but 1 is a factor
# make this also a factor
grass.df$graze2 = factor(graze)
str(grass.df)  # now both are factors
grass.df$graze2 = factor(grass.df$graze2) # another way
grass.df = data.frame(grass.df, graze2 = graze)  # created as factor
str(grass.df)

graze
levels(graze)
graze.f
levels(graze.f)
# Assigning names and levels to vector
graze.nf = c(rep(1,5),rep(2,4))
graze.nf
levels(graze.nf)[1] = 'mown'
levels(graze.nf)[2] = 'unmown'
graze.nf
levels(graze.nf)
class(graze.nf)

# Another way
remove(graze.nf)
graze.nf = factor(c(rep(1,5), rep(2,4)))
#graze.nf = factor(c(1,1,1,1,1,2,2,2,2))
graze.nf
levels(graze.nf) = list(mown=1, unmown=2)
graze.nf

# Another Way
remove(graze.nf)
graze.nf = c(1,1,1,1,1,2,2,2,2)
graze.nf
factor(graze.nf, labels=c('mown','unmown'))

# Another way
graze
nlevels(graze)
graze.f
nlevels(graze.f)

# Checking data type  ? see if the objects are created
class(graze)
class(graze.f)
nlevels(graze.nf)
class(graze.nf)
graze.nf
as.numeric(graze.nf) # factor to numeric
nlevels(as.numeric(graze.nf))  

#Making Replicate Treatment Factors ---------------
#rep(what, times)
trt = factor(c (rep('mow',5), rep('unmow',4)))
trt
# Balanced design
factor( rep (c('mow','unmow'), each=5))
factor( rep (c('mow','unmow'), times=5))
# gl command :: gl(n,k,length=n*k, labels=1:n)
gl(2,5,labels=1:2)  # 2 Levels
gl(3,5,labels=1:3)  # 3 Levels
gl(2,6,labels=c('mow','unmow'))  # 2 character  Levels
gl(2,1,10,labels=c('mow','unmow'))  # 2 character  Levels
gl(2,2,10,labels=c('mow','unmow'))  # 2 character  Levels

# Exercise ---- Nummbers predict categories-----------
higher = c(12,15,17,11,15)
lower = c(8,9,7,9)
middle = c(12,14,17,21,17)
delay = c(higher, lower,middle) # Join the vectors
delay
length(delay)
cutting = c(rep('mow',5), rep('unmow',4), rep('sheep',5)) # first predictor
length(cutting)
time = gl(2,1,length=14, labels=c('early','late'))
#time = rep(gl(2,1,length=5, labels=c('early','late')),3)[-10]
time
length(time)
flwr = data.frame(delay, cutting, time)
flwr

# Adding Rows or Columns
grassy
grazed
grassy$grazed = grazed
grassy
Midstrip = c(10,10,12)
grassy['Midstrip',] = Midstrip
grassy
grassy0 = grassy[-6,-3]
grassy0
grazed
grassy = grassy0
grassy$grazed = grazed
grassy  # unequal rows
grassy['Midstrip',] = NA  # add blank row
grassy
grassy$grazed = grazed # now added
grassy

# Adding more rows 
grassy= grassy0
grassy
grassy[6:10,] = NA
grassy  # added new rows.. see row names
row.names(grassy) = c(row.names(grassy)[1:6],'A','B','C','D') # change rownames of 7 to 10
grassy

# Matrix
grassy.m
grassy.m0 = grassy.m[,-3]
grassy.m0
grazed = grazed[-6]
cbind(grassy.m0, grazed)

# Summarising data --------------
fw
colMeans(fw)
rowMeans(fw)
colSums(fw)
rowSums(fw)

rowSums(mf)
rowSums(bf)
colSums(bf)  # sum NA becoz of NA values 
colSums(bf,na.rm=T)
str(mf)
colMeans(mf[-5])
colMeans(mf[1:3])
colMeans(mf[c(1,3,5)])
sites
mfnames = c(rep('Taw',5), rep('Torridge',5), rep('Ouse',5), rep('Exe',5), rep('Lyn',5))
mfnames
mf$site = factor(mfnames)
str(mf)

rowsum(mf[1:5], group=mf$site)
rowsum(mf[-6], group=mf$site)
rowsum(mf[1], group=mf$site)

bird
grp = c(1,1,1,2,2,3)
rowsum(bird,grp)
grp = c('black','color','color', rep('brown',3))
rowsum(bird,grp)
grp
rowsum(bird[,1:4], bird[,5]) # part of matrix last coln a grouping
unique(bird[,5])

# Apply Command 1- row, 2 - coln
mf[1:6]
mf[1:5,]
mf[1:5]
mf[,1:5]

apply(mf[,1:5],2,median)
apply(mf[,1:3],2,sum)
apply(mf[1:5],2,median)  # Both are same
apply(mf[1:3,],1,sum)   #  rowwise sum doesnot work.. some are character
apply(mf[1:3],1,sum)   # This works. only 1 to 3 colns are summed up all rows
apply(mf[1:10,c(1,3,5)],1,sum)   # This works. 1 to 10 rows, 1,,3,5 colns summed rowwise

# Tapply - summarise using a grouping variable
#tapply(X, INDEX, FUN=NULL)
mf$Length
tapply(mf$Length, mf$site)
tapply(mf$Length, mf$site,FUN=sum)
str(mf)
str(pw)  # plant and water are factors
pw$plant ; pw$water
tapply(pw$height, INDEX=pw$plant, FUN=mean)
tapply(pw$height, INDEX=list(pw$plant, pw$water), FUN=mean)
pw.tab = tapply(pw$height, INDEX=list(pw$plant, pw$water), FUN=mean)
str(pw.tab)
class(pw.tab)
pw.tab[1,1]
pw.tab
# if there are 3 indexes, it will become 3 dim array 
# with and attach can also be used
with(pw, tapply(height, plant, mean))
with(pw, tapply(height, list(plant, water), mean))
attach(pw)
tapply(height, plant, sum)
detach(pw)

# Aggregate - for subsets of data
#aggregate(x,by=list(..),FUN ...) # x to be meaninful variables whose fun can be done, by is list
head(mf)  # aggregate by site
aggregate(mf[1:5], by=list(mf$site), FUN=sum)
aggregate(Length  ~ site, data=mf, sum)  # formula syntax
aggregate(cbind(Length, Speed) ~ site, data=mf, sum)  # formula syntax
aggregate(. ~ site, data=mf, sum)  # formula syntax
aggregate(mf[1:5], by=list(mf$site), FUN=sum)
head(mf)
aggregate(Length ~ Algae * Speed , data=mf, mean)  # formula syntax
aggregate(Length ~ Algae  , data=mf, mean)  # formula syntax for every Length mean Algae

aggregate(Length ~ .  , data=mf, mean)  # formula syntax for every Length mean Algae
aggregate(Length ~ 1  , data=mf, mean)  # formula syntax for every Length mean Algae
aggregate(height ~ 1  , data=pw, mean)  # formula syntax
aggregate(height ~ .  , data=pw, mean)  # formula syntax

flwr$poa  # page 310
#poa = scan()
flwr$poa = c(8,  9, 11, 12, 10, 15, 17, 16, 16,  7,  8,  8,  5,  9)
aggregate(cbind(poa,delay) ~ cutting + time, data=flwr, mean)
aggregate(cbind(poa,delay) ~ cutting * time, data=flwr, mean)
aggregate(cbind(poa,delay) ~ ., data=flwr, mean)
aggregate(cbind(poa,delay) ~ 1, data=flwr, mean)
str(flwr)
apply(flwr[c(1,4)],2,mean)
tapply(flwr$poa, flwr$delay,mean)
tapply(flwr$poa, flwr$cutting,mean)
with(flwr, tapply(flwr$poa,INDEX=list(cutting, time),mean))
