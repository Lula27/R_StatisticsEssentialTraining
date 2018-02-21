# Introduction to Random Variables
browseURL("http://genomicsclass.github.io/book/pages/random_variables.html") # book source

# Inference Introduction 

fmweight <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\femaleMiceWeights.csv")  # access dataset 
View(fmweight)

head(fmweight)
tail(fmweight)

# look at averages of each group 
require(dplyr)
control <- filter(fmweight, Diet=="chow") %>% select(Bodyweight) %>% unlist # select individual values of mice on the chow diet as the control
treatment <- filter(fmweight, Diet=="hf") %>% select(Bodyweight) %>% unlist # select individual values of mice on the chow diet as the treatment (what we're looking to test)
print(mean(treatment)) 


# difference between means for treatment & control 
obsdiff <- mean(treatment) - mean(control)
print(obsdiff) 


fcontrol <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\femaleControlsPopulation.csv")
View(fcontrol)

# turn dataset into numeric 
population <- unlist(fcontrol)
population


# Sample 12 mice three times for the control 
control <- sample(population, 12)
control

# Get the average of the sample 
mean(control)

control <- sample(population, 12)
mean(control)

control <- sample(population, 12)
mean(control)
