#data2
### Viewing Data
## Listing Data
#attach ------------
attach(what)
newdf = data.frame(col1 = 1:3, col2=4:6)  # 2 colns
newdf
newlist = list(item1 = letters[1:5], item2=100:150)
newlist
item1; col1
attach(newdf)
attach(newlist)
item1
item2
col2
search()
detach(newdf)
detach(newlist)

#detach ---------
detach(name)
detach(package:name)
library(MASS)
ls()
search()
detach(package:MASS)
search()

#dir and list.files -------
dir(path ='.', pattern=NULL, all.files = FALSE, ignore.case = FALSE)
list.files(path='.', pattern=NULL, all.files = FALSE, ignore.case = FALSE)
dir()
dir('..')
dir(all.files = TRUE)
list.files()
list.files(path='..')
# pattern ?

#getwd ----------
getwd()

#head -----------
head(x, n=6L)  # no of elements to view 6
head(DNase)
head(DNase, n=3)
newmat = matrix(1:100, nrow=20, dimnames = list(letters[1:20]))
newmat
head(newmat, n=4)
head(newmat, n=-18) # all except last 18
head(newmat, n=-2) # all except last 2

#ls ------
ls(name, pos=-1, pattern, all.names=FALSE)
objects(name, pos=-1, pattern, all.names= FALSE)
ls()
ls(pattern='new*')
ls(pattern="^n")
ls(pattern='^n')
ls(pattern='^n|^u')

#rm / remove ----
rm(.., list= character(0), pos=-1)
remove(.., list=character(0), pos=-1)
ls(pos=2)

#search -------------
search()

#setwd ---------------
getwd()
setwd("/duwork/rWork/projects/gardener/essentialR")

#tail -------
tail(x, n=6L)
tail(DNase)
tail(DNase, n=2)
tail(DNase, n=-174)

#View ----------
View(x)
newvec = month.abb[1:6]
newdf = data.frame(col=1:3, col2=4:6)
newdf
newlist = list(item1 = letters[1:5], item2=100:110)
newlist
newmat = matrix(1:12, nrow=4, dimnames=list(letters[1:4], LETTERS[1:3]))
newmat
View(newvec)
View(newmat)
View(newdf)
View(newlist) # cannot be viewed by this command

#with ----------
with(x, expr)
newdf = data.frame(col1=1:3, col2=4:6)
newdf
newlist = list(item1=letters[1:5], item2=100:110)
newlist
col1
with(newdf, col1)
with(newlist, summary(item2))
with(newdf, mean(col2, na.rm=TRUE))

### Data Object Properties
## 
# attr ----------
attr(x, which, exact=FALSE)
attr(x, which, exact=FALSE) <- value
newdf = data.frame(col1=1:3, col2=4:6)
newdf
attributes(newdf)
attr(newdf, which='names')
attr(newdf, which='row.names')
attr(newdf, which='row.names') <- c('First', 'Second', 'Third')
attr(newdf, which='comment') <- c("Data with ammended attributes")
attributes(newdf)

attr(newdf, which='comment') <- NULL
attributes(newdf)

obj = 1:12
attr(obj, which='dim') <- c(3,4)
obj
class(obj)
attributes(obj)
attr(obj, which='dim') <- c(6,2)
obj
attributes(obj)

#attributes -------
attributes(obj)


#case.names ----
# case names for fitted model or row names for DF and Matrix objects
case.names(object)
newmat = matrix(1:12, nrow=3, dimnames=list(letters[1:3], LETTERS[1:4]))
newdf = data.frame(col1=1:3, col2=4:6, row.names = letters[1:3])
newmat; newdf
newlm = lm(col2 ~ col1, data=newdf)
case.names(newmat)
case.names(newdf)
case.names(newlm)
