# Challenge for Chapter 4
# Transforming skewed data 
# Data: xskew
# Variable: x
# Transform to remove outliers (hint: use z-score w/ scale, logrithmic transformation)
# Draw histogram and boxplot
# Time constraint: 10 minutes


# Take a way: for left (negative) skews, take power 
# For right (positive) skews, take log 

skdata <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch04\\04_05_Challenge\\xskew.csv')
View(skdata)
skdata


# Select variable x - this is fine: I used a shorter method than solution code
x <- skdata$x
x
hist(x)
boxplot(x) # lots of outliers
boxplot.stats(x)

# Because this has a sharp left skew, I can force the plot to mirror a binomial distribution by squaring. 
x.sq <- x^2 
hist(x.sq)
boxplot(x.sq) # outliers still present - but just less than before 
boxplot.stats(x.sq) # significantly reduced outliers - take it to a power of 2



x.fourth <- x^4
hist(x.fourth) # looks better 
boxplot(x.fourth) # outliers all gone looks like - check in dataset 
boxplot.stats(x.fourth) # out listed as numeric(0) - all gone, yay! 






# Scrap sheet 
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

# Clean up
rm(list = ls())
dev.off()
