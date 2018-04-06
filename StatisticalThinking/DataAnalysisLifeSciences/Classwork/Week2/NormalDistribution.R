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





# 2. For the last set of averages, the ones obtained from a sample size of 50, what proportion are between 23 and 25? 
# meaning distribution in histogram: 97.6% of values fall btw 23 & 25 
abs((mean(avgs50 <= 23) - mean(avgs50 <= 25)))  


# 3. Now ask the same question of a normal distribution with average 23.9 and standard deviation 0.43.
# mu =  23.9 
# sd = 0.43

# try 1 - WRONG - got 1 
a <- 23.9 + 0.43
b <- 23.9 - 0.43 

abs((mean(a <= 23) - mean(b <= 25)))   # just gives a bullion: true - false = 1


# try 2 - WRONG - got 0 : it's probabaly because of x value 
y <- dnorm(x, mean = 23.9, sd = 0.43, log = FALSE)
y   

abs((mean(y <= 23) - mean(y <= 25))) 


# try 3 - correct 

# Approximate distribution of sample average with a normal distribution 
# use pnorm(end value 1 - mean) / sd - pnorm(end value 2 - mean) /sd 
pnorm((25-23.9) / 0.43) - pnorm((23-23.9) / 0.43)

# mean: 23.9  & sd: 0.43 
# searching for proportion  between 23 and 25
?pnorm # 

# Clear workspace
rm(list = ls())
dev.off() # nothing plotted in first place 
