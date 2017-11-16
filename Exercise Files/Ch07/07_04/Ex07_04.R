# R Statistics Essential Training
# Ex07_04
# Comparing paired means: Paired t-test

# Load data
# Create random data sampled from random normal distribution 
# rnorm(observation, mean = mu, sd = x) <- time 1
time1 <- rnorm(100, mean = 50, sd = 10)

# Simulate change over time - before & after
# Difference - same observations, smaller mean/ greater sd
diff <- rnorm(100, mean = 10, sd = 20)

# Create sum vector 
time2 <- time1 + diff  # = rnorm(100, 60, 30)


# Plot histograms of three vectors/ boxplot of time 1 & time 2
hist(time1) # slight right skew
hist(diff) # looks more normal than time1
hist(time2) # kind of a left skew?


# Save variables in dataframe and use "MASS"
# to create parallel coordinate plot
# Get dataset into single data frame - newdf <- data.frame(t1, t2)
timeChange <- data.frame(time1, time2)
require(MASS) # For some reason, even though I can successfully run require(MASS), the package doesn't have check near name

# Crate parallel coordinate plot
# parcoord(paired dataframe, var.label = TRUE) # var.label will label min & max
?parcoord
parcoord(timeChange, var.label = TRUE) # looks like an increase - more stark than in example 


# Now that we have a visualization of patterns, let's do some testing!
# Paired t-test (with defaults)
?t.test
t.test(time1,time2, paired = TRUE) # p-value = 2.779e-05; incredibly strong evidence for statistically sig. different means
t.test(time2,time1, paired = TRUE) # p-value is still the same but it looks like positive values for t & CI 
# Makes sense...going from time1(less) to time2(more) so negative difference in the first t.test

# Paired t-test with options
# Check if significantly greater than 10 (difference mean)
t.test(time2, time1, 
       paired = TRUE,
       mu = 10,  # Specify non-0 null value - mu = population mean
       alternative = "greater",  # One-tailed test
       conf.level = 0.99)  # 99% CI (vs. 95%)

# Not statitically significance 
# mean of the differences = 9.684581


# Clean up
detach("package:MASS", unload=TRUE) 
rm(list = ls())
dev.off()
