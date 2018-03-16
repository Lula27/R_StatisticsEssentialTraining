# Statistical Inference 
# Populations, Samples and Estimates - 8% 


# Step 1: understand population of interest 
# Female mice example populations (fixed population)
# pop 1 = female mice on control diet (chow)
# pop 2 = female mice on test diet (high fat diet) 

# load data 
dat <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\mice_pheno.csv")
View(dat)

# Compute size of control population (same process for homework)
# Control values denoted as x1,....,xm
library(dplyr)
controlPopulation <- filter(dat, Sex == "F"
                            & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 
length(controlPopulation)


# Apply same process to find length of highfat 
# test values denoted as y1,...,yn 
hfPopulation <- filter(dat, Sex == "F"
                       & Diet == "hf") %>%
  select(Bodyweight) %>% unlist
length(hfPopulation)

# population parameters = quantities that can be obtained from population 
# ie: mean, variance, standard deviation

rm(list = ls())

# Exercises 
# How to remove nulls in R
dat <- na.omit(dat)
View(dat)
str(dat) # get structure (overview) of dataset 

# Using dplyr, create vector x w/ body weights of all males in control diet 
x <- filter(dat, Sex == "M" 
            & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 
x
mean(x) # population average = 30.96381 
