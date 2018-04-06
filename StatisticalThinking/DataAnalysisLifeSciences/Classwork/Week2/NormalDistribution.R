# The Normal Distribution Excercises 

# unlist to get in vector form 
# Lesson 1: As you increase your sample size, distribution will look more normal and variance will shrink (smaller spread). 

x <- unlist(read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\femaleControlsPopulation.csv"))
x
View(x)

# mean of female control (chow diet) female body weights 
mean(x)

# Set seed to 1 and use for loop to take a sample of 5 from data set 1000x  - do the same for sample of 50
set.seed(1)

?sample()


# for loop template 
# n <- 10000
# null <- vector("numeric", n)
#for (i in 1:n) {
#  control <- sample(population$Bodyweight,12) 
#  treatment <- sample(population$Bodyweight,12) 
#  null[i] <- mean(treatment) - mean(control) # values in null form null distribution
#}

# Create for loop
n <- 1000
avgs5 <- vector('numeric', n) # store repitions of samples in vector called null 
avgs5 # matrix of 1000 rows filled with 0 

for (i in 1:n) {
  s5 <- sample(x, 5)
  avgs5[i] <- mean(s5)
}

avgs5 # use this to get histogram - visual of distribution of female mice in control sampled 1000X

hist(avgs5)
# 1. Use a histogram to "look" at the distribution of averages we get with a sample size of 5 and a sample size of 50

rm(list = ls())

# Now, take 1000 trials of sample of 50 
set.seed(1)

n <- 1000
avgs50 <- vector('numeric', n)

for (i in 1:n) {
  s50 <- sample(x, 50)
  avgs50[i] <- mean(s50)
}

hist(avgs50) 
