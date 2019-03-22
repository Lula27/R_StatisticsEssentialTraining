# R Statistics Essential Training
# Ex03_02
# Calculating descriptives - basic discriptive statisitcs for quantitative variables 


# LOAD DATASET - cars; look at structure; examine in enviorment 
datasets::cars
str(cars)
data(cars) # load in enviornment 

# CALCULATE DESCRIPTIVES 
# summary() - first whole data set; next for variable speed
summary(cars)
summary(cars$speed)

# Use Tukey's five-number summary: minimum, lower-hinge,
# median, upper-hinge, maximum. No labels.
?fivenum()

fivenum(cars$speed)

# Boxplot stats: hinges, n, CI, outliers
# Will appear very similar to Tukey's 5 number summary but with more detail
?boxplot.stats() 

boxplot.stats(cars$speed)
# $out = outliers; numeric(0) means there are no outliers 

# ALTERNATIVE DESCRIPTIVES
# From the package "psych" - use describe()
?psych
install.packages("psych")
require(psych)
describe(cars)

# Clean up 
rm(list = ls())
