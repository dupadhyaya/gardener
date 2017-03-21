# Data Frames
df <- data.frame(x = 1:3, y = c("a", "b", "c"))
str(df)
df
str(df)

df <- data.frame(
  x = 1:3,
  y = c("a", "b", "c"),
  stringsAsFactors = FALSE)
str(df)

cbind(df, data.frame(z = 3:1))
rbind(df, data.frame(x = 10, y = "z"))

#When combining column-wise, the number of rows must match, 
#but row names are ignored. When combining row-wise, both the number and 
#names of columns must match. Use plyr::rbind.fill() to combine data frames
#that don’t have the same columns.
#http://adv-r.had.co.nz/Data-structures.html

bad <- data.frame(cbind(a = 1:2, b = c("a", "b")))
str(bad)

good <- data.frame(a = 1:2, b = c("a", "b"),
                   stringsAsFactors = FALSE)
str(good)

# Special Colns
df <- data.frame(x = 1:3)
df$y <- list(1:2, 1:3, 1:4)
df
str(df)

dfl <- data.frame(x = 1:3, y = I(list(1:2, 1:3, 1:4)))
str(dfl)
#I() adds the AsIs class to its input, but this can usually be safely ignored.

dfm <- data.frame(x = 1:3, y = I(matrix(1:9, nrow = 3)))
str(dfm)

# Search
head(mtcars)
mtcars[mtcars$mpg>25.0,]
mtcars[rownames(mtcars) == 'Fiat 128',]
mtcars[mtcars$gear == 4,]
mtcars[rownames(mtcars) == '^M',]
mtcars[grep("^M", rownames(mtcars), ignore.case=T),]
mtcars[grep("^4", mtcars$gear), ]
subset(mtcars, carb == '2')
subset(mtcars, hp==110)
