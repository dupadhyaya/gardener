# Data
#http://www.gardenersown.co.uk/education/lectures/Essential%20R%20support.htm#TOC
# Data types–Different kinds of data and converting one kind of data into another kind.
# Creating data–Commands for making data items from the keyboard.
# Importing data–Getting data from sources on disk.
# Saving data–How to save your work.
# Viewing data–Seeing what data you have in R.
# Summarizing data–Ways of summarizing data objects. Some of these commands will also appear in Theme 2: “Math and Statistics.”
# Distribution of data–Looking at different data distributions and the commands associated with them, including random numbers.

# array --------------
array(1:12)
array(1:12, dim=12)
array(1:12, dim=6)
array(1:12, dim=18)
array(1:24, dim=c(3,4,2))  # 3 dim 
array(1:12, dim=12, dimnames = list(LETTERS[1:12]))
array(1:12, dim=c(3,4) , dimnames = list(letters[1:3], LETTERS[1:4]))
array(1:24, dim=c(3,4,2), dimnames = list(letters[1:3], LETTERS[1:4], month.abb[1:2]))
month.abb[1:10] ; month.name[1:5] ;months.Date(Sys.Date())

# character --------------
character(length=0)
character(length=3)

# data.frame -----------------
data.frame(...., row.name=NULL, stringsAsFactors = default.stringsAsFactors())
abundance = c(12,15,17,11,15,8,9,7,9)
cutting = c(rep('mow',5), rep('unmow',4))
abundance; cutting
graze = data.frame(abundance, cutting)
graze
str(graze)
graze2 = data.frame(abundance, cutting, stringsAsFactors = F)
quadrat = c(paste('Q',1:9,sep=''))
quadrat
graze3 = data.frame(abundance, cutting, quadrat, row.names=3)
graze3
graze4 = data.frame(abundance, cutting, row.names=quadrat)
graze4
str(graze4)

# factor --------------
factor(x = character(), levels, labels = levels)
factor(c(rep(1,5), rep(2,4)))
factor(c(rep(1,5), rep(2,4)), labels=c('mow', 'unmow'))
factor(c(rep('mow',5), c(rep('unmow',4))))
factor(c(rep(1,5), rep(2,4)), labels=c('mow', 'unmow'), levels=c(2,1))

# integer -------------------
integer(length=0)  # no of items = 0
integer(length=6)

# list -----------------
# different types and lengths  list(...)
mow = c(12,15,17,11,15)
unmow = c(8,9,7,9)
(chars = LETTERS[1:5])
mylist = list(mow, unmow, chars)
mylist
(mylist = list(mow1=mow, unmow1=unmow, chars1=chars))

#logical ---------------------
logical(length=0)
logical(length=4)

#matrix ---------------
matrix(data=NA, nrow=1, ncol=1, byrow=FALSE, dimnames=NULL)
values = 1:12
matrix(values, ncol=3)
matrix(values, ncol=3, byrow=T)
(rnam = LETTERS[1:4])
(cnam = letters[1:3])
matrix(values, ncol=3, byrow=T, dimnames = list(rnam, cnam))

#numeric ----------------
numeric(length=2)  # has decimals also

#raw ------------
raw(length=3)

#table ----------

#ts -------------
ts(data=NA, start=1, end=numeric(0), frequency = 1, deltat = 1,
   ts.eps=getOption('ts.epd'), names=)
newvec = 25:45
ts(newvec, start=1965)  # annually
ts(newvec, start=1965, frequency=4)   # quartely
ts(newvec, start=1965, frequency=12)  # monthly

(mat= matrix(1:60, nrow=12))  # 12 months x 5 series data matrix
ts(mat, start=1955,frequency = 12)


#vector --------------
vector(mode='logical', length=0)
(v1= vector(mode='integer', length=5))
seq_along(v1)
# mode - list, character, raw

#as.xxxxxx Commands
x= c('Dhiraj', 'Ramesh')
as.character(x)
as.integer(x)
as.logical(x)
# as.  array, character, data.frame, factor, integer, list, logical, matrix
#  raw, table, ts, vector
sample = c(1.2, 2.4, 3.1, 4, 2.7)
as.integer(sample)
as.character(sample)
as.list(sample)
(matdata = matrix(1:12, ncol=4))
as.table(matdata)
as.data.frame(matdata)

# Testing Data Types -----------
## class ----------------
class(matdata)
class(sample)

## inherits -----------
# test class attribute
inherits(x, what, which=FALSE)
newmat = matrix(1:12, nrow=3)
class(newmat)
inherits(newmat, what = 'matrix')
inherits(newmat, what = 'data.frame')
is.data.frame(newmat)
inherits(newmat, what=c('table', 'matrix'), which=TRUE)
# position of match 1,2 :0 - no match
class(newmat) = c('table', 'matrix')
class(newmat)
inherits(newmat, what=c('table', 'list', 'matrix'), which=TRUE)

#is---------------
is(object, class2)
newmat= matrix(1:12, nrow=3)
class(newmat)
is(newmat, class2='matrix')
is(newmat, class2='list')
# add extra class to the object
class(newmat)= c('table','matrix')
is(newmat, class2='list')
is(newmat, class2='table')
# others - is.xx integer, factor, numeric, matrix

#c ----------------
# create data from keyboard 
c(....)

# gl ------------
# generate factor levels
gl(n,k, length=n*k, labels=1:n, ordered=FALSE)
gl(n=3, k=1)  # 3 levels, 1 of each
gl(n=3, k=3)
gl(n=3, k=3, labels=c('A','B','C'))  # use labels A, B, C
gl(n=3, k=3, labels=paste('Treat',1:3,sep=''))
factor(letters[1:20], labels = "letter")

gl(n=3, k=1, length=9)
gl(n=3, k=2, length=9)
gl(n=2, k=3, labels=c('Treat', 'Ctrl'))
gl(n=2, k=3, labels=c('Treat', 'Ctrl'), ordered=TRUE)
gl(n=3, k=3, length=8, labels=LETTERS[1:3], ordered=TRUE)

#interaction ---------------
# new factor using combination of other factors
interaction(...., drop=FALSE, sep=".")
load(file='./essentialR/Essential.RData')
# load("/duwork/rWork/projects/gardener/essentialR/Essential.RData")
summary(pw)
ls()
str(pw)
int = interaction(pw$plant, pw$water, sep='-')
int
levels(int)

# rep -----------
rep(x, times, length.out, each)
(newnum = 1:6)
(newchar = LETTERS[1:3])
rep(newnum)
rep(newnum,times=2) # 1 2 3 4 5 6 1 2 3 4 5 6
rep(newnum,each=2) # 1 1 2 2 . .
rep(newnum, each=2, length.out = 11)  # length of 11 
newchar
rep(newchar, times=2)
rep(newchar, times=c(2,3,4))
rep(newnum, times=1:6)
rep(c('mow','unmow'), times=c(5,4))

# rbind - later
# seq ---------------
seq(from=1, to=1, by = c((to - from)/ (length.out-1)), 
    length.out=NULL, along.with = NULL)
seq(from=1, to=12)
seq(from=1, to=24, by=3)  # by is interval
seq(from=1, by=3, length.out= 6)
seq_len(length.out = 6)

seq_along(along.with = 50:40) # ???
seq_along(along.with = c(5,4,3,2,7,8,2))
seq(from=1, to=10, along.with = c(1,1,1,1))
seq(from=1, to=10, along.with = c(1,1,1))
seq(from=1, to=10, along.with = 1:6)

# Creating Data from Keyboard 
#scan -------

#subsetting []------
object[elements]
#vectors & lists have 1 dim, matrix & DF have 2 dim [r,c]
mow = c(12,15,17,11)
mow  
mow[5] = 15
mow
unmow = c(8,9,7,9,NA)
unmow
mydf = data.frame(mow, unmow)
mydf
newdat = 6:1
newdat
length(mow);length(unmow);length(newdat)
mow[6]=unmow[6]=NA
mydf = data.frame(mow, unmow)
mydf

mydf[,3] = newdat
mydf

#cbind --------
col1=1:3
col2=4:6
newmat=cbind(col1,col2)
newmat
col3=7:9
cbind(newmat,col3)
cbind(col3, newmat, deparse.level = 0)
newdf = data.frame(col1,col2)
newobj = cbind(col3, newdf)
class(newobj)
newobj

#rbind ----------
rbind(..., deparse.level = 1)
#deparse.level=0 - do not use old names of row/col
row1 = 1:3
row2 = 4:6
row3 = 7:9
newmat = rbind(row1,row2,row3)
newmat

new.df = data.frame(col1=c(1:3), col2=c(4:6))
new.df
row3 = c(9,9)
rbind(new.df, row3)

#within ----------
within(data, expr) # opens up object temporarily
newlist = list(Ltrs= letters[1:5], Nmbrs = 100:110)
newlist
within(newlist, lNmbrs <- log(Nmbrs))

newdf = data.frame(col1 = 1:3, col2 = 4:6)
newdf
within(newdf, col1 <- -col2)
within(newdf, col3 <- col1 + col2)

#dput ---------
mow = c(12, 15, 17, 11, 15)
dput(mow, file='dput_vector.txt', control='all')

(newdf = data.frame(col1=1:3, col2=4:6))
dput(newdf, file='./essentialR/dput_frame.txt', control='all')

dget(file='./essentialR/dput_frame.txt')
structure(list(col1 = 1:3, col2 = 4:6), .Names = c("col1", "col2"
), row.names = c(NA, -3L), class = "data.frame")

#file.choose


newmat = matrix(1:20, ncol=5,dimnames = list(letters[1:4], LETTERS[1:5]))
newmat
write.table(newmat, file='./essentialR/myfile.txt')
write.table(newmat, file='./essentialR/myfile.csv', row.names = FALSE, sep=",")
write.table(newmat, file='./essentialR/myfile.tsv', row.names = FALSE,
            col.names=FALSE, sep="\t")
read.csv(file='./essentialR/myfile.csv')
read.table(file='./essentialR/myfile.txt', header=T, row.names = 1)
read.table(file='./essentialR/myfile.tsv', header=F, sep='\t')
read.delim(file='./essentialR/myfile.tsv', header=F)
read.table(file='./essentialR/myfile.tsv', header=F, sep='\t',
           col.names=LETTERS[11:15], row.names = letters[11:14])
