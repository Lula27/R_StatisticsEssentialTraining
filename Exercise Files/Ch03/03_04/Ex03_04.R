# R Statistics Essential Training
# Ex03_04
# Single mean: Hypothesis test and confidence interval


# Load data - look at structure 
?quakes
str(quakes)


# See the first 5 lines of the data
quakes[1:5, ]


# Just load the magnitude variable
quakes$mag[1:5]



# Select magnitude for entire data set - store in object called mag
mag <- quakes$mag
mag

# Select first five rows for mag & notice the different in t-test results 
mag2 <- quakes$mag[1:5]

# Use t-test for one-sample
# Default t-test (compares mean to 0)
# Ho: true mean = 0 
# Ha: true mean != 0 
?t.test()
t.test(mag) # T-test for entire sample of magnitudes
# Notice for this natural science example, that the t-test is huge; for social sciences, much smaller t-tests (around single digits)

t.test(mag2) # T-test for sample of first 5 observations 

# right One-sided t-test w/ true mean(mu) = 4 as Ho 
t.test(mag, alternative = "greater", mu = 4)



# Clean up
rm(list = ls())






