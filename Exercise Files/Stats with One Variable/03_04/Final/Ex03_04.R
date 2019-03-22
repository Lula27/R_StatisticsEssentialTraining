# R Statistics Essential Training
# Ex03_04
# Single mean: Hypothesis test and confidence interval

# Load data
?quakes
str(quakes)
quakes[1:5, ]  # See the first 5 lines of the data
mag <- quakes$mag  # Just load the magnitude variable
mag[1:5]  # First 5 lines

# Use t-test for one-sample
# Default t-test (compares mean to 0)
# This was kind of useless since the mean for the variable mag is around 4. No low values of around 0 even recorded.
t.test(mag)

# Fine tune it for what you need to look at 
# One-sided t-test w/mu = 4 
# Population mean (true mean) = 4 
t.test(mag, alternative = "greater", mu = 4)

rm(list = ls())  # Clean up
