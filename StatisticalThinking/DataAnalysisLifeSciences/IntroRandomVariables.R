# Introduction to Random Variables
browseURL("http://genomicsclass.github.io/book/pages/random_variables.html") # book source


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

# Do it 10,000X! Use for-loop.
n <- 10000
null <- vector("numeric", n)

for (i in 1:n) {
  control <- sample(population$Bodyweight,12) 
  treatment <- sample(population$Bodyweight,12) 
  null[i] <- mean(treatment) - mean(control) # values in null form null distribution
}

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
heightecdf <- ecdf(x)

# Plot empirical cumulative distribution function
plot(values, heightecdf(values), type = "l", # type = letter l
     xlab = "a (Height in inches)", ylab = "Pr(x <= a)")  
# Plot shows that probability of an individual male being shorter than 75 is 1; shorter than 60, around 0 : Pr(x <= a)
# Most men measure between (65 - 70 inches)
