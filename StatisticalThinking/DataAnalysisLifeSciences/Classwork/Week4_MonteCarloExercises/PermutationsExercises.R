# Permutations Exercises 

babies <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\babies.txt", header=TRUE)
View(babies)

require(dplyr)



# population non smokers 
bwt.nonsmoke <- filter(babies, smoke == 0) %>% select(bwt) %>% unlist 
length(bwt.nonsmoke) # 742

bwt.smoke <- filter(babies, smoke == 1) %>% select(bwt) %>% unlist 
length(bwt.nonsmoke) # 484


# 1. We will generate the following random variable based on a sample size of 10 and observe the following difference:
N = 10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke, N)
smokers <- sample(bwt.smoke, N)
obs <- mean(smokers) - mean(nonsmokers)


# Is the observed difference statistically significant? 

# Use permutations so you don't have to rely on assumptions needed for the normal or t-distribution approximations to hold.
dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
mean(smokersstar)-mean(nonsmokersstar)

# Set the seed at 1, and then repeat the permutation 1,000x to create a null distribution.
# What is the permutation derived p-value for our observation?
set.seed(1)
null <- replicate(1000, {
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  mean(smokersstar)-mean(nonsmokersstar)
})
( sum( abs(null) >= abs(obs)) +1 ) / ( length(null)+1 ) 


#2. Repeat the above exercise...What is the permutation based p-value? 
N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- median(smokers) - median(nonsmokers)

set.seed(1)

null <- replicate(1000, {
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  median(smokersstar)-median(nonsmokersstar)
})
( sum( abs(null) >= abs(obs)) +1 ) / ( length(null)+1 ) 