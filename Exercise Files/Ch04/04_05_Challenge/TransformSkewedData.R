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
kurtosi(x)   # = 2.300297
boxplot(x)
boxplot.stats(x)

# Transform - zscore : no diff - try log 
x.z <- scale(x)
hist(x.z)
boxplot(x.z)



# Log transform - hmmm...beter. Outliers shrunk down by like a factor of four <- This right here is my best bet. 
hist(x.log)

boxplot(x.log)
boxplot.stats(x.log)
kurtosi(x.log) # Why is this so high? 26.45631
length(x.log)

# Now try scaling x.log
z.log = scale(x.log)
hist(z.log)
boxplot(z.log)
boxplot.stats(z.log) # nope, it's even worse than after the log transformation 

# Try multiplying by rnorm - but outliers still present 
?rnorm
ksink <- rnorm(1000) 

prod <- x.log * ksink
prod
hist(prod)
boxplot(prod)

# Try cutting out outliers

