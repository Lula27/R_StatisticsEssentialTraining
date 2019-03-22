# R Statistics Essential Training
# Ex03_06
# Robust statistics for univariate analyses

# See "A Brief Overview of Robust Statistics" by Olfa Nasraoui, at
browseURL("http://j.mp/12YPV5L")

# Or see the CRAN Task View on robust statistics at
browseURL("http://cran.r-project.org/web/views/Robust.html")

# Load data
?state.area
data(state.area)  # Gets error message - Why? Is it because this is stored as a vector and not a data frame?
area <- state.area  # But can save as vector
area
str(area)
hist(area)
boxplot(area)
boxplot.stats(area)
summary(area)

# Robust methods for describing center:
mean(area)  # NOT robust- meaning with outliers, distorted tremendously 
median(area) # Simplist robust measure of centure 

# Get data set & cut off outliers 
# Part left mirrors bell curve 
# Compare with median value - when mean = median -> symetrical 
mean(area, trim = .05)  # 5% from each end (10% total) 
mean(area, trim = .10)  # 10% from each end (20% total)
mean(area, trim = .20)  # 20% from each end (40% total) # suggested by researcher
mean(area, trim = .50)  # 50% from each end = median

# Robust methods for describing variation (spread in set):
sd(area)  # NOT robust - When SD > Mean, big problem 
mad(area)  # Median absolute deviation
IQR(area)  # Interquartile range (Can select many methods) - example of Ordinal statistic
fivenum(area)  # Tukey's hinges (similar to quartiles)

rm(list = ls())  # Clean up