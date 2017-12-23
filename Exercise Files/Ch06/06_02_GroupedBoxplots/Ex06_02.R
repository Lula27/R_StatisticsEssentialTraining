# R Statistics Essential Training
# Ex06_02
# Creating grouped boxplots using archival data - collected over 300 years ago grading artists 


# Load data
# Use dataset "painters" from the package "MASS
require(MASS)
?painters

data("painters")
painters


# Draw boxplots of outcome (Expression) by group (School)
# Basic version - not very helpful so fancy it up! 
boxplot(painters$Expression ~ painters$School)

# Get back to this - pick up for later
rm(list = ls())
dev.off()
