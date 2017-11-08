# R Statistics Essential Training
# Ex04_01
# Examining outliers
# Goal: Remove outliers from categorical & quantitative dataset - focus on range where most of your data is
# By creating new dataset using select and subset 


# Load categorical dataset from Csv file - save as variable OS
# Categorical data
# Outlier is < 10%
# Worldwide shipments of smartphone OS
# in millions for 2013 Q1
OS <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch04\\04_01\\OS.csv", header = TRUE)
# Open in viewer 
View(OS) # Note - View is case sensitive - first letter must be capitalized 
OS # Look in console


# Very small dataset, just eyeball it 
# Outlier has proportion < .10
# Either combine into "other" (if homogeneous) - often, want to avoid combining or delete
# Store in new dataset so you don't mess up the original 
# Use subset(), store as OS.hi
?subset()
OS.hi <- subset(OS, Proportion > .10) 

rm(list = ls())



# Remove outliers for quantitative variables
# Quantitative data
# See outliers in boxplots
require("datasets")
?rivers


# load data & generate descriptive statistics (histogram, horizontal boxplot + stats on bxpl,)
data(rivers)
hist(rivers) # right skew - high outlier values 
boxplot(rivers, horizontal = TRUE)
boxplot.stats(rivers)

# remove outliers - store in new variable called hi.rivers & remove outliers (repeat one more time) - select & subset
# A. values smaller than 1210     B. values smaller than 1055
# Generate bxpl & bxpl stats 
smallRivers <- rivers[rivers < 1210]
boxplot(smallRivers, horizontal = TRUE) # Notice that there are still outliers - get rid of these 
boxplot.stats(smallRivers)

# Note - you want to use your original data set because you'll just be hacking off values from the trimmed version; just replicate & edit original 
smallerRivers <- rivers[rivers < 1055]
boxplot(smallerRivers, horizontal = TRUE)
boxplot.stats(smallerRivers)



