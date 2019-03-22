# R Statistics Essential Training
# Ex03_06
# Robust statistics for univariate analyses - working with skewed distributions that occure becauase of large outliers/gross errors with data compiliation 
# Take away: In the presence of outliers, median is a good substitute for the mean,
# Median absolute deviation and Interquartile range are good outliers for standard deviation. 


# Load data - won't load unless saved as vector (call it area)
?state.area # numeric vector of state areas (in square miles)
data(state.area) # error - says not found

# Try saving it in object - this works! Yaaaay!!!
area <- state.area 
str(area) # numerica value with 1 row, 50 columns containing area 
area 


# Basic descriptive stats (str, hist, boxplot, boxplot.stats, summary)
hist(area) # far from normal look at outliers - notice - majority (like 45) states fall into first bin - low area
# Outliers - one major outlier (Alaska) in far right bin 

boxplot(area) # Go over boxplot basics again
boxplot.stats(area) 

summary(area) # median = 56222, mean = 72368 



#  Methods for describing center:

# A. Mean - NOT robust: meaning with outliers, distorted tremendously 
mean(area) # = 72368


# B. Median - substitute for mean in case of outliers 
# Simplist robust measure of centure 
median(area) # = 56222


# Original Mean 
mean(area) # = 72368
# Another option is to trim the mean - cuts off equal precentage from top & bottom 
# Get data set & cut off outliers 
# Compare with median value - when mean = median -> symetrical distribution 
mean(area, trim = .05)  # 5% from each end (10% total) = 59957.22 
mean(area, trim = .10)   # 10% from each end (cut off 20% total) = 57781
mean(area, trim = .20)   # 20% from each end (40% total) # suggested by researcher = 57524.03
mean(area, trim = .50)   # 50% from each end (pretty cut everything out except middle) = 56222 = median  



# Methods for describing variation (spread in set):

# A. Standard deviation (sd) - NOT robust - When SD > Mean, big problem 
sd(area) # 88278.01 > mean 


# B. Median absolute deviation (mad) & Interquartile range (IQR) 
# can substitute for sd that is messed up due to outliers


# Median absolute deviation
mad(area) # = 35711.39

# Interquartile range (Can select many methods) - example of Ordinal statistic
IQR(area) # = 45916.75

# Tukey's hinges (similar to quartiles)
fivenum(area)

# Clean up 
rm(list = ls())
