# Central Limit Theorem: as one takes random samples of size n from a population of mean (mu),
# and standard deviation (sigma),
# than as the sampe size (n) gets large
# the sample mean (x-bar) approaches the normal distribution with
# population mean (mu) and standard deviation (sigma/sqrt(n))

# Problem with CLT:
# 1. depends on large n
# 2. need to know population standard deviation (sigma)


# Example: using mice phenotype data, create two vectors
# v1: for control population (chow diet)
# v2: high-fat diet population 

library(dplyr)
dat <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\mice_pheno.csv')

# control vector (v1): select body weight for female mice on chow diet
controlPop <- filter(dat,Sex == "F" & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 
controlPop

# experiemental group vector (v2): select body weight for female mice on hf diet
experimentalPop <- filter(dat, Sex == "F" & Diet == "hf") %>% 
  select(Bodyweight) %>% unlist 
experimentalPop

# Assumption: the distribution of the experimentalPop is normal 

# Illustration (can't do in practice): see distribution for both control and experiemental groups
library(rafalib) # Hey! The professor guy created this R library :) 
?mypar
mypar(1,2)
hist(experimentalPop) # looks like there's a right tail skew 
hist(controlPop) # looks a bit more normally distributed than the distribution of the experimental group (hf diet female mice)
