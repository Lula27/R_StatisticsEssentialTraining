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


# 1.  If instead of CLT, we use the t-distribution approximation, what do we add and subtract to obtain a 99% confidence interval (use 2*N-2 degrees of freedom)?
set.seed(1)

N <- 25 

# Get sample for nonsmokers 
sm.nosmoke <- sample(bwt.nonsmoke, N)
length(sm.nosmoke)

# Get sample for smokers 
sm.smoke <- sample(bwt.smoke, N)

se <- sd(sm.nosmoke)/sqrt(N)
se

( mean(sm.nosmoke) - mean(bwt.nonsmoke)) / se 

qnorm(0.999)*sqrt( sd( sm.nosmoke)^2/N + sd( sm.smoke)^2/N )

# Correct Answer: 
qt(0.995,48)*sqrt( sd( sm.nosmoke)^2/N + sd( sm.smoke)^2/N ) # 12.54534


# 4. What is the p-value (use the t-test function)?
set.seed(1)

N = 5

dat.sm <- sample(bwt.smoke, N)
length(dat.sm)

dat.ns <- sample(bwt.nonsmoke, N)

result <- t.test(dat.sm, dat.ns)

result$p.value 

# p-value is 0.2098464 so fail to reject the null hypothesis 

# Clean up 
rm(list = ls())
