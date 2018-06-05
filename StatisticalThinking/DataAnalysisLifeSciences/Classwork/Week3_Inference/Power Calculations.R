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

# Power Calculation
# Power is the probability of rejecting the null when the null is false. 
# In R, you can use the pwr package to perfom power calculation. 
?(pwr)

# Sample size 
N <- 12

# reject the null hypothsis at: 
alpha <- 0.05

# Number of simulations to run B = 2000
B <- 2000

# Simulation 
reject <- function(N, alpha=0.05){
  hf <- sample(hfPopulation,N) 
  control <- sample(controlPopulation,N)
  pval <- t.test(hf,control)$p.value
  pval < alpha
}
# Results of simulation for sample size of 12.
reject(12)

# Replicate function to do this B times. 
rejections <- replicate(B, reject(N))

# Our power is just the proportion of times we correctly reject. So with N=12 our power is only:
mean(rejections) # 0.2155

# Let’s see how power improves with N. 
# We will use the function sapply, which applies a function to each of the elements of a vector. 
# We want to repeat the above for the following sample size: 
Ns <- seq(5, 50, 5)

# Using sapply 
power <- sapply(Ns, function(N){
  rejections <- replicate(B, reject(N))
  mean(rejections)
}) 

power

# Plot it out 
plot(Ns, power, type = 'b')

# Clean up
rm(list = ls())
dev.off()

# Power Calculation Exercises 
babies <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\Classwork\\Week3_Inference\\babies.txt", header=TRUE) 

head(babies)

require(dplyr)

# non smokers population
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist

# smokers population
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist 

# 2. What proportion of the time do we reject at the 0.05 level?
# Generate samples 
N=5
set.seed(1)
# non smokers sample 
dat.ns <- sample(bwt.nonsmoke, N)

# smokers sample 
dat.s <- sample(bwt.smoke, N)

# Run t-test % get pvalue 
t <- t.test(dat.s, dat.ns)

t$p.value # 0.1366428 

t$p.value > 0.05 # TRUE = fail to reject null 

# 2. Set the seed at 1, then use the replicate function to repeat the code used in the exercise above 10,000 times. 
# What proportion of the time do we reject at the 0.05 level? = 0.0984
N=5
set.seed(1)
rejects <- replicate(10000, {
  dat.ns <- sample(bwt.nonsmoke, N)
  dat.s <- sample(bwt.smoke, N)
  t.test(dat.s, dat.ns)$p.value < 0.05
})
mean(rejects) # 0.0984  - So we reject the null at the 0.05 level about < 10% of the time. Probably because the sample (N) is only 5.

# mean(rejects) = 0.0984 means power is lower than 10%.

#3. Repeat the exercise above for samples sizes of 30, 60, 90 and 120.
# Which of those four gives you power of about 80%? 
N=30
set.seed(1)
rejects30 <- replicate(10000, {
  dat.ns <- sample(bwt.nonsmoke, N)
  dat.s <- sample(bwt.smoke, N)
  t.test(dat.s, dat.ns)$p.value < 0.05
})
mean(rejects30) # 0.4783 = 47.83% 


N=60
set.seed(1)
rejects60 <- replicate(10000, {
  dat.ns <- sample(bwt.nonsmoke, N)
  dat.s <- sample(bwt.smoke, N)
  t.test(dat.s, dat.ns)$p.value < 0.05
})
mean(rejects60) # 0.7878 = 78.78% 


N=90
set.seed(1)
rejects90 <- replicate(10000, {
  dat.ns <- sample(bwt.nonsmoke, N)
  dat.s <- sample(bwt.smoke, N)
  t.test(dat.s, dat.ns)$p.value < 0.05
})
mean(rejects90) # 0.9338 = 93.38%

N=120
set.seed(1)
rejects120 <- replicate(10000, {
  dat.ns <- sample(bwt.nonsmoke, N)
  dat.s <- sample(bwt.smoke, N)
  t.test(dat.s, dat.ns)$p.value < 0.05
})
mean(rejects120) # 0.9852 = 98.52% 

# Which of those four gives you power of about 80%? Faster way - use vector

Ns <- c(30, 60, 90, 120)

res <- sapply(Ns, function(N){
  set.seed(1)
  rejects <- replicate(10000, {
    dat.ns <- sample(bwt.nonsmoke, N)
    dat.s <- sample(bwt.smoke, N)
    t.test(dat.s, dat.ns)$p.value < 0.05
  })
mean(rejects)
})
Ns[which.min( abs( res - .8))] # 60 

# 4. Repeat the problem above, but now require an  level of 0.01.
# Which of those four gives you power of about 80%?

Nt <- c(30, 60, 90, 120)

rep <- sapply(Nt, function(N){
  set.seed(1)
  rejects <- replicate(10000, { 
    dat.ns <- sample(bwt.nonsmoke, N)
    dat.s <- sample(bwt.smoke, N)
    t.test(dat.s, dat.ns)$p.value < 0.01
    })
  mean(rejects)
})
Nt[which.min( abs( rep - .8))] # 90

# Clean up 
rm(list = ls())
