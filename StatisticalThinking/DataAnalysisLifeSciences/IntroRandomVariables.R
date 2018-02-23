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

