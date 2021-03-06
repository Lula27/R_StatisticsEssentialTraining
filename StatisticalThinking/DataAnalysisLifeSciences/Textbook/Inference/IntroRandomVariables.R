# Introduction to Random Variables
browseURL("http://genomicsclass.github.io/book/pages/random_variables.html") # book source
browseURL("https://www.r-bloggers.com/proportions-with-mean/") # proportions with mean


# Statistical Inference is the mathematical theory that permits you to approximate this with only the data from your sample.
# i.e. the original 24 mice.

# Goal: compute p-value for difference in diet for female mice using two different meal plans

# Inference Introduction
# We are interested in determining if following a given diet makes mice heavier after several weeks. 
# Data: 24 mice from The Jackson Lab and randomly assigning either chow or high fat (hf) diet

fmweight <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\femaleMiceWeights.csv")  # access dataset 
View(fmweight) # looks like mice on hf (high fat) diet weigh more than mice on the chow diet

# first 6 rows of dataset 
head(fmweight)

# So are the hf mice heavier?
# It looks like it but because of variability, let's look at group averages.

require(dplyr)
control <- filter(fmweight, Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(fmweight, Diet=="hf") %>% select(Bodyweight) %>% unlist 


# Mean of mice on chow diet (control)
print(mean(control)) # 23.81333

# Mean of mice on high fat diet (treatment)
print(mean(treatment)) # 26.83417 

# Looks like mean of treatment is 10% more than mean of control.
# Average of mice on hf diet is 10X greater than mice on chow. 
obsdiff <- (mean(treatment)) - (mean(control))
obsdiff # 3.020833

# Null hypothesis1: mean of treatment != mean of control (2 sided test)
# Null hypothesis2: mean of treatment > mean of control 

# This looks good but it's inaccurate. 
# Because of variability [Every time we repeat this experiment, we get a different value.]
# Generate a random variable. 


# Random Variables
# population - have data on weight of all control female mice available 
# In practice, no access to population data. 
# Illustrate this concept with the following: 

population <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\femaleControlsPopulation.csv")
View(population)

# Sample 12 mice three times and see how the average changes.
control <- sample(population,12)

# Getting error message: Error in sample.int(length(x), size, replace, prob) : 
# cannot take a sample larger than the population when 'replace = FALSE'
browseURL("https://stackoverflow.com/questions/19648238/r-says-cannot-take-a-sample-larger-than-the-population-but-i-am-not-taking") 
# Try selecting values from the dataframe 

control <- sample(population$Bodyweight,12) 
control
mean(control) # 25.09333 

# Bet if I keep repeating, I'll get different values.
control <- sample(population$Bodyweight,12) 
mean(control) # 22.6475 

control <- sample(population$Bodyweight,12) 
mean(control) # 23.42333

# Yup, average varies! Teaches us something about distribution of random variable.


# The Null Hypothesis 

# Overview: randomly sample 24 control mice
# Give them the same diet. 
# Record difference in mean btw 2 randomly split groups of 12 & 12 

# 12 control mice
control <- sample(population$Bodyweight,12) 
treatment <- sample(population$Bodyweight,12) 
mean(treatment) - mean(control) # 0.9708333 

# Do it 10,000X! Use for-loop. Is this a Monte Carlo simulation?
n <- 10000
null <- vector("numeric", n)

for (i in 1:n) {
  control <- sample(population$Bodyweight,12) 
  treatment <- sample(population$Bodyweight,12) 
  null[i] <- mean(treatment) - mean(control) # values in null form null distribution
}

control
treatment
null
# What percent of the 10,000 are bigger than obsdiff?
# From output below, only a small % of the 10,000 simulations - 0.0116
mean(null >= obsdiff)# 0.0116

# p-value: When there is no diet effect, we see a difference as big as the one we observed only 1.5% of the time.
# I think in my case, 1.2% of the time...

# Distributions
# distribution - compact description of many numbers 

# So you measured all the heights of all men on earth. 
# Explain your collected data to an alien visiting earth!

# Access dataset 

install.packages("UsingR")
require(UsingR)
?UsingR
x <- father.son$fheight

# Explaination 1: list data to alien 
# 10 randomly selected heights of 1,078
round(sample(x,10),2) # varies each time 


# Cumulative Distribution Function
# Visualize a distribution 
# Cumulative distribution function (CDF): F(a) == Pr(x <= a) - theoretical
# empirical CDF (ECDF): when CDF is derived from data 

smallest <- floor(min(x)) # round min(x) down
largest <- ceiling(max(x)) # round max(x) up
values <- seq(smallest, largest, len=300)
heightecdf <- ecdf(x) # ecdf is a function that returns a function

# Plot empirical cumulative distribution function
plot(values, heightecdf(values), type = "l", # type = letter l
     xlab = "a (Height in inches)", ylab = "Pr(x <= a)")  
# Plot shows that probability of an individual male being shorter than 75 is 1; shorter than 60, around 0 : Pr(x <= a)
# Most men measure between (65 - 70 inches)

# Histograms - much more popluar than ecdf 
# Benefits: 1. get intervals between values
# 2. Distinguish different types (families)

# Plot basic histogram of population of male heights 
hist(x) # matches with ecdf that most men fall between 65 & 70 inches/ few shorter than 60 inches or taller than 75 inches - much easier to understand 

# More detailed histogram 
bins <- seq(smallest, largest)
hist(x, breaks = bins, xlab = "Height (in inches)", main = "Adult men heights") 
# From plot, we can see about 70 individuals over six feet (72 inches) tall

# Probability distribution: describe probabilities 
# null distribution: distribution of difference in mean of mouse weights when null hypothesis is true 
# p-value: probability of observing a value as large as we did previously 

# Goal: repeat previous experiement (for loop) but add point to figure after each trial of experiment

n <- 100
install.packages("rafalib")
require(rafalib)
nullplot(-5, 5, 1, 30, xlab = "Observed differences (grams)", ylab = "Frequency")
totals <- vector("numeric", 11)
for (i in 1:n) {
  control <- sample(population$Bodyweight,12) 
  treatment <- sample(population$Bodyweight,12) 
  nulldiff <- mean(treatment) - mean(control)
  j <- pmax(pmin(round(nulldiff) + 6,11),1)
  totals[j] <- totals[j] + 1
  text(j-6, totals[j], pch=15, round(nulldiff,1))
  ##if(i < 15) Sys.sleep(1) ##You can add this line to see values appear slowly
}

# Interpretation: we can see that values as large as obsdiff (3.02) are relatively rare

# Get better look but seeing frequncy distribution against obsdiff value
hist(null, freq = TRUE)
abline(v=obsdiff, col="red", lwd=2) # most values under 3 


# Compute p-value for difference in diet for mice using normal distribution 
# Normal Distribution 
# A probability distribution commonly found in nature
# AKA: Bell Curve, Gaussian Distribution or Normal Distribution 

# Goal: compute the proportion of values below a value x with pnorm(x,mu,sigma)
# without knowing all the values

normalapprox <- 1 - pnorm(obsdiff, mean(null), sd(null))
normalapprox # 0.01258094

# Setting the random seed
# One way to ensure that results of values produced using a random number generator 
# do not change is by setting R's random number generation seed.
?set.seed
set.seed(1) # example 

# Clean up 
rm(list=ls())
dev.off()

# Clear libraries 
detach("package:UsingR", unload = TRUE)



# Exercises 
# 1
x <- unlist(population) # change from dataset to numbers 
ax <- mean(x) # get average 
ax

# 2
set.seed(1)
?sample

s <- sample(x, 5) # take random sample of size 5 with set.seed(1)
s 
diff <- mean(s) - mean(x)
diff
abs(diff)

# 3 
# Repeat with set seed to 5
set.seed(5)

s2 <- sample(x, 5)
s2

diff2 <- mean(s2) - mean(x)
abs(diff2)

# 5 : for-loop take random sample of 5 mice 1,000X; save these averages
# What percent of these 1,000 averages are more than 1 ounce away from the average of x ?
set.seed(1)

n = 1000

# for 
for(i in 1:n) {
  a <- sample(x, 5, replace=TRUE)
}

print(a)

# 5 - 5.	Set the seed at 1, then using a for-loop take a random sample of 5 mice 1,000 times.
set.seed(1) 

i <- 1:1000
rm(i)

# For-loop that takes a random sample of 5 mice 1,000X
for (i in 1:1000)
{
  s1 <- sample(fmweight$Bodyweight,5)
  print((s1)) 
}

# What percent of these 1,000 averages are more than 1 ounce away from the average of x ?
for (i in 1:1000)
{
  s1 <- sample(fmweight$Bodyweight,5)
  print(abs(mean((s1)) - ax))   # Abs of diff. between means of random sample & population 
}

for (i in 1:1000)
{
  s1 <- sample(fmweight$Bodyweight,5)
  print(abs(mean((s1)) - ax) > 1)   # Abs of diff. between means of random sample & population in bullion (true/false) form  
}

for (i in 1:1000)
{
  s1 <- sample(fmweight$Bodyweight,5)
  print((abs(mean((s1)) - ax) > 1)* 1)   # Abs of diff. between means of random sample & population in bullion (true/false) form - dummified (0 = false, 1 = true) 
}


# Null Distributions Exercises - 1 
# Create and store vector 
n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population$Bodyweight, 12)
  treatment <- sample(population$Bodyweight, 12)
  nulls[i] <- mean(treatment)-mean(control)
}

hist(nulls) 

# Set the seed at 1, then using a for-loop take a random sample of 5 mice 1,000 times.  
set.seed(1)

n <- 1000
nulls2 <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population$Bodyweight, 5)
  nulls2[i] <- mean(control)
}

length(nulls2) # 1000

min(nulls2) # 20.16

max(nulls2) # 29.496

length(ax)

# Create histogram for nulls2 - add abline for ax 
hist(nulls2)
abline(v = ax, col = "red", lwd = 2) # shows me where the mean of x is (23.89338)
ax

# What proportion of these 1,000 averages are more than 1 gram away from the average of x ?
d <- abs(ax - nulls2) 

away1 <- d > 1 
away1 # created a bullion (anything greater than 1 is true)

# get proportion with mean 
mean(away1) # 0.498

# Set seed = 1
set.seed(1)
# increase it from 1,000 to 10,000
n2 <- 10000
nulls3 <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population$Bodyweight, 5)
  nulls3[i] <- mean(control)
}

d2 <- abs(nulls3 - ax)

away2 <- d2 > 1 
mean(away2) # proportion of these 10,000 averages are more than 1 gram away from the average of x: 0.498

# Third time is the charm!
# Set seed = 1
set.seed(1)
# increase it from 1,000 to 10,000
n <- 1000
nulls4 <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population$Bodyweight, 50)
  nulls4[i] <- mean(control)
}

d3 <- abs(nulls4 - ax)

away3 <- d3 > 1 
mean(away3)

# What proportion of these 1,000 averages are more than 1 gram away from the average of x ? 0.019

# Does this mean as the sample increases the p-value goes down? 

rm(list = ls())
