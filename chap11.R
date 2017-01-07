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
