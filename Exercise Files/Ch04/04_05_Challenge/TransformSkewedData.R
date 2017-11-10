# Challenge for Chapter 4
# Transforming skewed data 
# Data: xskew
# Variable: x
# Transform to remove outliers (hint: use z-score w/ scale, logrithmic transformation)
# Draw histogram and boxplot
# Time constraint: 10 minutes


skdata <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch04\\04_05_Challenge\\xskew.csv')

# Select variable x
x <- skdata$x
hist(x)

require(psych)
kurtosi(x)
boxplot(x)
boxplot.stats(x)

# Transform - zscore : no diff - try log 
x.z <- scale(x)
hist(x.z)
boxplot(x.z)



# Log transform - hmmm...still nothing 
x.log <- log(x)
hist(x.log)

boxplot(x.log)

length(x.log)

# Try multiplying by rnorm - but outliers still present 
?rnorm
ksink <- rnorm(1000) 

prod <- x.log * ksink
prod
hist(prod)
boxplot(prod)

# Try cutting out outliers

