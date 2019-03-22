# R Statistics Essential Training
# Ex07_06
# Comparing proportions (Using Chi-Square)


# Load data
# Need two vectors:
# One specifies the total number of people in each group
# This creates a vector with 5 100s in it, for 5 groups
# Same as "number of trials"
# Example: Fred & George's Joke Shope.
# Testing Tongue Twisty Tonic 
# 100 people are placed in 10 different groups. Given a tonic to grow/twist their tongues. 
testers <- c(rep(100,5)) 
t2 <- c(rep(10, 5)) # Notice earlier with small sample, the following warning appears- In prop.test(s2, t2) : Chi-squared approximation may be incorrect.
# This is because sample too small/not drawn from random normal distribution so the estimate for the p-value won't be accurate. 
# The test is warning you that your data doesn't meet the assumptions for criteria to move forward with this chi-squared test.
t3 <- c(rep(20, 5))

# Of the individuals placed into the five groups of five, the following are successful tongue twisting recorded in each group.
twisted <- c(40, 45, 25, 52, 10)
s2 <- c(2, 5, 1, 9, 0)
s3 <- c(9, 15, 8, 18, 10)

# Run proportion test - prop.test(successes, total)
# Looks like you can't run a proportion test for very small samples ()
?prop.test
prop.test(twisted, testers) # ho: the proportions are equal can be rejected based on p-val: 2.988e-10
prop.test(s2, t2)  
prop.test(s3, t3)


# If there are only two groups (sucess vs. failure), then it gives a confidence
# interval for the difference between the groups; 
# the default CI is .95
# Number of trials
a <- c(50,50) # Two groups of 50 individuals. 

# Number of successes
b <- c(25, 45) # number of success in the groups 


# Run prop.test again - prop.test(x2, n2, conf.level = .80)
prop.test(b, a, conf.level = .80)
# 2-sample test for equality of proportions with continuity correction
# Based on p-val: 3.381e-05, stat. sig. evidence to reject ho

# Clean up
rm(list = ls())
