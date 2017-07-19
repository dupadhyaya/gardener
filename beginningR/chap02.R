# Chapter -2 : Starting Out - Becoming Familiar with R ####
# What you will learn in this chapter
# 
# How to use R for simple math
# How to store results of calculations for future use
# How to create data objects from the keyboard, clipboard, or external data files
# How to see the objects that are ready for use
# How to look at the different types of data objects
# How to make different types of data objects
# How to save your work
# How to use previous commands in the history
# This chapter builds some familiarity with working with R, beginning with some simple math and culminating in importing and making data objects that you can work with (and saving data to disk for later use).

#calculator
3+9 + 12 - 7

12 + 17/2 -3/4 + 2.5

(12+17/2 - 3/4) + 2.5

pi * 2^3 -sqrt(4)  # 2^3 > 2 cube

abs(12-17*2/3 - 9)

factorial(4)

log(2, 10)
log(2, base=10)
log10(2)

log(2)
exp(0.6931472)

log10(2)
10^0.3103

# R uses radians instead of degrees
sin(45 * pi /180)

asin(0.7071068) * 180 /pi


# Storing Results

ans1 = 23 +14/2 - 18 + (7 + pi *2)
ans1

ans2 = 13 + 11 + (17 - 4/7)
ans2
ans1 + ans2 /2 

ans3 = ans2 + 9 -2 + pi
ans3

ans4 = 3 + 5
ans4

ans5 = ans1 + ans2
ans5

ans3 + pi / ans4 -> ans6
ans6


# Entering Data
data1 = c(1,3,5,7,8)
data1
data2 = c(10,11,12,data1)
data2
our.text = c('item1', 'item2')
our.text
day1 = c('mon', 'tue','wed')
day2 = c(day1, our.text)
day2
day3 = c(day1, data1)
day3
our.data = scan()
our.data

day2 = scan(what = 'character')
day2

data3 = scan()
data3

data4 = scan(what='character')
data4

data5 = scan(sep=',')
data5

data6 = scan(sep=',', what='char')
data6

data7 = scan(file='beginningR/textdata.txt')
getwd()
dir()
list.files()
dir('beginningR')
data7


data8 = scan(file.choose(), what='char', sep='')
data8
# Scan is for simple vector not for big structure files
# 