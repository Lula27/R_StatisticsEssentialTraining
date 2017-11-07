# R Statistics Essential Training
# Ex03_03
# Following descriptive statistics/frequencies, conduct inferential statistics 
# Use basic inferential statistic - Single Proportion 
# Single proportion: Hypothesis test and confidence interval
# Extra reading: 
browseURL("https://stats.idre.ucla.edu/other/mult-pkg/faq/general/faq-what-are-the-differences-between-one-tailed-and-two-tailed-tests/") 


# In the 2012 Major League Baseball season,
# the Washington Nationals had the best record 
# at the end of the regular season: 98 wins out
# of 162 games (.605). Is this significantly 
# greater than 50%? 

# Generate hypotheses 
# Ho = no significant difference (no difference) / true p equals 0.5
# Ha = significant different / true p not equal to 0.5 

# (trials = n) total games = 162
# (successes = x) number of wins = 98
# Problem: Is their record for wins (98/162 = .605)
# significantly greater than 50%? 

# PROP TEST - test of equal/given proportions 
# 98 wins out of 162 games 
# (default settings) Default = null probability = 0.5 
# 95% CI; 50/50 coin toss 
?prop.test
prop.test(98, 162)

# output: p-value = 0.009522 / < 1%     -> statisitcally significant so reject null hypothesis (doesn't mean accept Ha)



# One-tailed test with 90% CI - right sided 
prop.test(98, 162, alternative = "greater", conf.level = .90)


# Clean up 
rm(list = ls())

