# R Statistics Essential Training
# Ex04_06_Solution
# Transforming skewed data
# Goal: pull in data so you can proceed to do standard least square analysis without losing data
# Note: If you have a strong positive skew, log transformation is useful. 
# If you have a strong negative skew, square transformation (power up) may be useful - just do the opposite of positive skew. 

# Import data
xskew <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch04\\04_05_Challenge\\xskew.csv")
xskew
x <- xskew[, 2]  # to access second variable, select all rows & second column
hist(x)

# Square data  
x2 <- x^2
hist(x2) # still has left skew
boxplot(x2) # outliers are still there 

# 4th power
x4 <- x^4 # Notice how it more or less mirros a normal distribution. 
hist(x4)
boxplot(x4) # Outliers are now gone! 

rm(list = ls())  # Clean up
