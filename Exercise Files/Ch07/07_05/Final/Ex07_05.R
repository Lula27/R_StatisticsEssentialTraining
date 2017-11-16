# R Statistics Essential Training
# Ex07_05
# Comparing means with ANOVA

# Load data
# Each group in separate variable
x1 <- rnorm(30, mean = 40, sd = 8)
x2 <- rnorm(30, mean = 41, sd = 8)
x3 <- rnorm(30, mean = 45, sd = 8) # You'll get different samples for x3 & x4 even though the parameters appear the same b/c drawing from random normal distribution.
x4 <- rnorm(30, mean = 45, sd = 8)
# Formula result is F(3, 116) = 3.24, p = .025

boxplot(x1, x2, x3, x4)  # Quick graphical check # Why are the means for the boxplot of x3 & x4 different? 

# Combine vectors into a single data frame
# Use cbind to combine columns so you can create new dataframe composed of those 4 individual vectors
xdf <- data.frame(cbind(x1, x2, x3, x4))
summary(xdf)

# Stack data to get one column with outcome
# and second columns with group
xs <- stack(xdf) # In order to do ANOVA, need to stack up the cbind dataframe. Results in values & ind

# Conduct one-way ANOVA (Analysis of Variance) 
# aov(outcome ~ ind, data = stacked dfname )
anova1 <- aov(values ~ ind, data = xs)
anova1
summary(anova1) # Summary tells us there is a statistically significant difference but doesn't say where.

# Post-hoc comparisons - Shows where difference is.
# Can use number of tests [Bonferroni,etc.] This instructor likes Tukey cus he thinks others are conservative estimates.
TukeyHSD(anova1)
?pairwise.t.test  # Other post-hoc tests
?p.adjust  # Specific methods

rm(list = ls())  # Clean up
dev.off()
