# R Statistics Essential Training
# Ex07_01
# Calculating correlations - a basic measure of association

# Find correlations for data from Swiss census taken in 1888

# Load data - 
?swiss
data(swiss)
View(swiss)

# Correlation matrix for data frame: cor(swiss)
cor(swiss)

# Round cor to 2 decimal places to make it easier to read 
round(cor(swiss), 2)

# Notice: really strong correlations
# Positive: Agriculture, Catholic, Infant.Mortality -> on Fertility
# Negative: Examination, education -> on Fertility 


# Bivariate testing - test one pair of variables 
# Order is irrelevant - cor.test()
# Evidently, t-test is used to generate correlation value
# Single out one pair in cor and see how you get it - using hypothesis testing: t-test & p-value 
?cor.test
cor.test(swiss$Fertility, swiss$Education)

# Try switching order and see what happens - same exact thing as above 
cor.test(swiss$Education, swiss$Fertility)

# Use Hmisc package to get p-values for matrix 
# install & require 
?hmisc
# Alread did install(Hmisc)
require(Hmisc) # Will check it in packages - make sure to detach when finished 
?rcorr


# Change data frame into matrix in order to use rcorr in Hmisc- rcorr(as.matrix(dataframe))
rcorr(as.matrix(swiss))
# Gives you correlation matrix (cleaner than previous) in first table + probabilites generated from test statistic in second table
# Interesting: looks like some of the corr aren't statitically significant (ie: agriculture & fertility, infant mortality & agriculture)
# But the stronger correlations (ie: education & fertility) are significant 


# Clean up 
detach('package:Hmisc', unload = TRUE) # Now, if you look in packages, Hmisc is unchecked 
detach('package: survival', unload = TRUE) # Why won't this detach? Whatever...

rm(list = ls())

