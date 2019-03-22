# R Statistics Essential Training
# Ex04_01
# Examining outliers

# Categorical data
# Outlier is < 10%
# Worldwide shipments of smartphone OS
# in millions for 2013 Q1
OS <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch04\\04_01\\OS.csv", header = TRUE)
View(OS)
OS

# Outlier has proportion < .10 - get rid of smallest values 
# Either combine into "other" (if homogeneous) - often, want to avoid combining or delete
# Store in new dataset so you don't mess up the original 
OS.hi <- subset(OS, Proportion > 0.1)   # Select only those that are > 0.1 (10%) - to work with 
OS.hi

# Quantitative data
# See outliers in boxplots
require("datasets")
?rivers
data(rivers)  # Lengths of Major North American Rivers
hist(rivers)
boxplot(rivers, horizontal = TRUE)
boxplot.stats(rivers)
rivers.low  <- rivers[rivers < 1210]  # Remove outliers
boxplot(rivers.low, horizontal = TRUE)  # Has new outliers
boxplot.stats(rivers.low)
rivers.low2  <- rivers[rivers < 1055]  # Remove again
boxplot(rivers.low2)  # Still one outlier

rm(list = ls())  # Clean up
