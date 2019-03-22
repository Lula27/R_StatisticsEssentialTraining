# R Statistics Essential Training
# Ex07_04
# Comparing paired means: Paired t-test - compare one group before & after

# Load data
# Create random data
t1 <- rnorm(50, mean = 52, sd = 6)  # Time 1

# Simulate change over time - before & after
dif <- rnorm(50, mean = 6, sd = 12)  # Difference
# Vector math
t2 <- t1 + dif  # Time 2
t2

# Some quick plots to check data
hist(t1) # basically normal - sampled from random normal distribution
hist(dif)
hist(t2)
boxplot(t1, t2)

# Save variables in dataframe and use "MASS"
# to create parallel coordinate plot
# Get dataset into single data frame
pairs <- data.frame(t1, t2)
pairs
require("MASS")

# Crate parallel coordinate plot
parcoord(pairs, var.label = TRUE) # var.label will label min & max
# Look to see if on average, lines relating t1 & t2 are going up, down or stay flat

# Paired t-test (with defaults)
t.test(t2, t1, paired = TRUE) # strongly significant 
# Since there was a change in scores (huge diff. btw means) when we first 
# generated sample, we expect this.

# Paired t-test with options
# Check if significantly greater than 6 (mean we sampled from)
t.test(t2, t1, 
       paired = TRUE,
       mu = 6,  # Specify non-0 null value - mu = population mean
       alternative = "greater",  # One-tailed test
       conf.level = 0.99)  # 99% CI (vs. 95%)
# Not statistically significant

# Clean up
detach("package:MASS", unload=TRUE)
rm(list = ls())
dev.off()
