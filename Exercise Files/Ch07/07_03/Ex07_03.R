# R Statistics Essential Training
# Ex07_03
# Comparing means with the t-test: one of the most useful tests for comparing accross groups 
# Part one - use t-test to test for difference in means between 2 groups in small data set on sleep medication
# Part two - generate your own small dataset using random - use t-test to test for statistically significant different means


# Pt 1 
# Load data
?sleep
data(sleep)
sleep[1:10, ]


# Save just the first two variables - just looking at extra & group (take Id out) - call it sd (sleep drug)
sd <- sleep[ ,1:2]
sd[1:10, ]

# Some quick plots to check data
hist(sd$extra)
hist(sd$extra, col = "darkblue") # - missing bin - coloring  will help you see it
# boxplot extra hours of sleep based on group - boxplot(a ~ b, data = name)
boxplot(extra ~ group, data = sd) # looks like there is a huge difference between two groups
# Group one on average has less extra hours of sleep compared to group 2
# looks like factor of 2 difference in hours of sleep recorded in grp 2 compared to grp 1

# Is the difference I'm noticing in boxplots statisitically significant? 
# Perform t-tests to see if the mean extra sleep are different in the groups
# Independent 2-group t-test (with defaults) - t.test(a ~ b, data = name)
t.test(extra ~ group, data = sd) # Welch Two Sample t-test, no direction; 95% CI 
# p-value = 0.07939 - not statitically significant at 5% level
# This may be because it's such a small sample size.


# Notice how it changes when you specify direction. 
# Test to see if one of the means is less than the other at 80% CI. 
# t-test with options - one-tailed
t.test(extra ~ group,
       data = sd,
       alternative = "less",  # One-tailed test
       conf.level = 0.80)  # 80% CI (vs. 95%)
# Now, there is a stat. sig. p-val @ 5% <- p-value = 0.0397
# CI just telling you that there are no bounds on one side - graph going from -inf to about -0.848



# Part 2 - pedogogical testing: because generating values randomly, never have the same sample
# Create two groups of random data in separate variables
# Good because actual difference is known
# Size = 30 , mean = 20, sd = 5
x <- rnorm(30, mean = 20, sd = 5)
x[1:10]
# Same size & sd, different means 
y <- rnorm(30, mean = 25, sd = 5)
y[1:10]

# Test difference in means using one-sided t-test
t.test(x,y)

# Looks like there is statistical signicance to reject ho that the means are the same. 
# This could be because you now have a random sample. 

# Clean up 
rm(list = ls())
dev.off()
