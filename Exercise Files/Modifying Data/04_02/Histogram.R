# R Statistics Essential Training
# Ex04_02
# Transforming variables - rather than getting rid of outliers in data set, use transformations to manipulate outliers (keep them & use them)
# Examples of transformations (z-square, squaring, ranking, logrithms, dichotomize, )


# Load Data
require("datasets")
# The areas in thousands of square miles of the
# landmasses which exceed 10,000 square miles.
?islands
data("islands")
View(islands)

# histogram w/ breaks at 16, boxplot
hist(islands, breaks = 16)
# heavily right skewed 


# z-scores - easiest method is scale()
# create z-score of data and store in variable islands.z
?scale 
islands.z <- scale(islands)
islands.z

# generate histogram, boxplot, mean, round mean to 2 decimal places, standard deviation 
hist(islands.z)
boxplot(islands.z)
boxplot.stats(islands.z)
mean(islands.z)  # super small, obviously heads toward 0 but round to see
round(mean(islands.z), 2) # equals 0
sd(islands.z) # equals 1 


# Maintains metadata as an attribute from original dataset which can be accessed - use attr()
attr(islands.z, "scaled:center")  # Show original mean
attr(islands.z, "scaled:scale")   # show orinal sd - scale 
islands.z <- as.numeric(islands.z)#islands.z <- as.numeric(islands.z)  # Converts from matrix back to numeric
islands.z


# Logarithmic Transformations - get natural log 
# generate histogram/boxplot 
?log()
islands.ln <- log(islands) # natural log of values in ds 
islands.ln
hist(islands.ln) # looks much better than original values histagram - trasformed to mute outliers
boxplot(islands.ln)

# Squaring
# For negatively skewed variables
# Distribution may need to be recentered so that all values are positive (0 is okay)
sq <- (islands.ln)^2 
sq

# Ranking - transformation that maintains the order but nothing else about your data 
?rank()

islands.rank1 <- rank(islands)
islands.rank1 
hist(islands.rank1)
boxplot(islands.rank1)   # looks almost symmetrical


# ties.method - if ranks for any two or more values are the same
# this attribute will assign the rank (ie: average, random)
browseURL('https://stats.stackexchange.com/questions/34008/how-does-ties-method-argument-of-rs-rank-function-work')
islands.rank2 <- rank(islands, ties.method = "random") 


# Conduct descriptive stats
hist(islands.rank2) # more even - all but one collected at 5 than rank1
boxplot(islands.rank2)


# Dichotomizing - taking a data set & splitting it into two pieces (ie: high & low)
# Use wisely and purposefully! Risk: lose a huge amount of info 
# Split at 1000 (= 1,000,000 square miles)
# ifelse is the conditional element selection
# Select highest values as continent - if land mass greater than 1000, make it equal one, if less assign 0
continent <- ifelse(islands > 1000, 1, 0)
continent

# Clean workspace
rm(list = ls())
dev.off()
