# Confidence Intervals Exercises 
# Interactively review inference concepts using R simulations. 
#  treat the babies dataset as the full population and draw samples from it to simulate individual experiments
# Can information about random samples be used to draw correct conclusions about the population? 

# Access text file
babies <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\Classwork\\Week3_Inference\\babies.txt", header=TRUE) 

# Access package 
require(dplyr)

# Split into two birth weight datasets 
# A. Birth weights to non-smoking mothers 
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 


# B. Birth weights to smoking mothers 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

# Find true population difference in means btw. smoking & non-smoking birth weights.
require(rafalib)
mean(bwt.nonsmoke) - mean(bwt.smoke) # 8.937666

sd(bwt.nonsmoke) # 17.39869

sd(bwt.smoke) # 18.09895


