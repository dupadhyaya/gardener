# Data

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

