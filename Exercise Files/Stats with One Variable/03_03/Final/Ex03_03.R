# R Statistics Essential Training
# Ex03_03
# Single proportion: Hypothesis test and confidence interval

# In the 2012 Major League Baseball season,
# the Washington Nationals had the best record 
# at the end of the regular season: 98 wins out
# of 162 games (.605). Is this significantly 
# greater than 50%? 

# total games = 162
# number of wins = 98
# Problem: Is their record for wins (98/162 = .605)
# significantly greater than 50%? 

# PROP TEST - test of equal/given proportions 
# 98 wins out of 162 games (default settings)
?prop.test
#prop.test(x = counts of successes, n = vector of counts of trials)
prop.test(98, 162)

# One-tailed test with 90% CI
prop.test(98, 162, alt = "greater", conf.level = .90)

rm(list = ls())  # Clean up
