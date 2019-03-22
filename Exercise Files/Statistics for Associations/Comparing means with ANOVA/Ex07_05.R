# R Statistics Essential Training
# Ex07_05
# Comparing means with ANOVA



# Load data - Create 4 vectors drawing from random normal distribution. 
# Same cases/number of observations, similar means, same sd.
# Each group in separate variable
a <- rnorm(50, mean = 70, sd = 7)
b <- rnorm(50, mean = 68, sd = 7)
c <- rnorm(50, mean = 72, sd = 7)
d <- rnorm(50, mean = 70, sd = 7)


# Combine vectors into a single data frame
# Use cbind to combine columns so you can create new dataframe composed of those 4 individual vectors
# data.frame(cbind()) 
alp <- data.frame(cbind(a,b,c,d))



# In order to do ANOVA, need to stack up the cbind dataframe. Results in values & ind
# Stack data to get one column with outcome
# and second columns with group
# Stacking vectors concatenates multiple vectors into a single vector along with a factor indicating where each observation originated.
?stack
alphabet <- stack(alp) # Notice the number of observations between dataframe(50) & stacked df(200) = 50 * 4



# Conduct one-way ANOVA (Analysis of Variance) 
# aov(outcome ~ ind, data = stacked dfname )
# anova1 <- aov(values ~ ind, data = xs)
anova1 <- aov(values ~ ind, data = alphabet)
anova1  # Not statitically significant... 
summary(anova1)

# Post-hoc comparisons - Shows where difference is.
# Can use number of tests [Bonferroni,etc.] This instructor likes Tukey cus he thinks others are conservative estimates.
?TukeyHSD
TukeyHSD(anova1)


# Clean up - Go over this again!
rm(list = ls())
