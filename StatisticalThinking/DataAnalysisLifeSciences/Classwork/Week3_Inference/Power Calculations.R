# Power Calculations Exercises # 1 
# We know that there is a difference between the mean baby weights for smokers and non smokers.
# For exercise # 4 - sample size = 5. 
# P-value for the t.test = 0.2098 so fail to reject the null hypothesis that mu1=mu2 (no difference in means)
# This p-value occured because the sample size is too small. 
# Since you fail to reject even though the data shows otherwise, this is a type II error. 

library(dplyr)

dat <- read.csv("C://Users//loret//Desktop//DataSciencePrep//R//R_StatisticsEssentialTraining//StatisticalThinking//DataAnalysisLifeSciences//extdata//mice_pheno.csv")

controlPopulation <- filter(dat, Sex=="F" & Diet=="chow") %>%
  select(Bodyweight) %>% unlist

hfPopulation <- filter(dat, Sex=="F" & Diet=="hf") %>%
  select(Bodyweight) %>% unlist

mu_hf <- mean(hfPopulation)
mu_hf

mu_control <- mean(controlPopulation)

print(mu_hf - mu_control) # 2.375517 

print((mu_hf - mu_control) /mu_control * 100) # 9.942157 = percent increase 


# In some cases, when we take a sample and perform a t-test, we don’t always get a p-value smaller than 0.05.
# Example: we take sample of 5 mice and don’t achieve statistical significance at the 0.05 level

# Get random samples from population 
set.seed(1)

N <- 5

hf <- sample(hfPopulation, N)

control <- sample(controlPopulation, N)

# Run t-test & get p-value: 0.1410204 <- fail to reject null hypothesis that there is no difference btw. two means (mu_hf = mu_control)
t.test(hf, control)$p.value 



