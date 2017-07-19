# Chapter -1 : Introducing R ####
# http://www.gardenersown.co.uk/education/lectures/Beg%20R%20support.htm
# What you will learn in this chapter
# 
# Discovering what R is
# Getting to the R program
# Installing it on your computer
# Starting to run the program
# Using the help system and finding help from other sources
# Obtaining additional libraries of commands
# In this chapter you see how to get R and install it on your computer. You also learn how to access the built-in help system and find out about additional packages of useful analytical routines that you can add to R.

# R is open source Statistical env modeled after S & SPlus
# Started by Robert Gentleman & Ross Ihaka

help.start()

# R Website : www.r-project.org

help("+")
?"+"
??"ifelse"

apropos("ifel")


# command packages loaded by default
search()
library(timeSeries)
search()
detach(package:timeSeries)
search()
