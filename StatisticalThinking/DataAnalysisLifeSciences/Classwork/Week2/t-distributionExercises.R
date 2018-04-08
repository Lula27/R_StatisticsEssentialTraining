# CLT and t-distribution in Practice Exercises
# Central Limit Theorem applies when events are independent. 
# Central Limit Theorem is an asympototic result.
# Asympototic result: gets closer to being a perfect approximation as sample size increases
# In practice - determine appropriate sample sizes to apply CLT

# Observing CLT with binary data (step functions - heads vs tails/one side of dice vs others)
# Ex: observe proportion of times we see 6 when rolling n=100 die 

set.seed(1)

n <- 100

x <- sample(1:6, n, replace=TRUE)

# proportion of 6's we get from rolling dice 100x 
mean(x==6) # 0.24  / with set.seed(1) = 0.14


# How about with a coin flip? 
# What are proportion of flips turn out to be heads? 
# 1 = heads/ 0 = tails

y <- sample(0:1, n, replace=TRUE)
y
mean(y==1) # heads = 0.49 
mean(y==0)

rm(list = ls())

# 1. What proportion of times z was larger than 2 in absolute value?
# (CLT says it should be about 0.05

set.seed(1)

n <- 100 # number of events (times dice is rolled)

sides <- 6 # total sides of dice

p <- 1/sides # probability of dice landing on any side

# repeating experiement 10000 times 
zs <- replicate(10000, {
  x <- sample(1:sides, n, replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
})

zs

# create qqnorm plot
qqnorm(zs)
abline(0,1) # confirm it's well approximated with normal distribution 

# report what proportion of times z was larger than 2 in absolute value 
mean(abs(zs) > 2) # 0.0424 


# 2. For which of the following is the normal approximation best?
# MY TRY = WRONG!
require(rafalib)
mypar(2,2)

# A. p=0.5 & n=5
pa = 0.5
na = 5
zA <- replicate(10000, {
  x <- sample(1:sides, na, replace=TRUE)
  (mean(x==6) - pa) / sqrt(pa*(1-pa)/na)
})

zA

# create qqnorm plot
qqnorm(zA)
abline(0,1)  # doesn't look very normal - points to the right of normal line

# B. p=0.5 & n=30
pa = 0.5
nb = 30
zB <- replicate(10000, {
  x <- sample(1:sides, nb, replace=TRUE)
  (mean(x==6) - pa) / sqrt(pa*(1-pa)/nb)
})

zB

# create qqnorm plot
qqnorm(zB)
abline(0,1)  # waaay off - points are far to the right of normal line



# C. p=0.01 & n=30 
pc = 0.01
nb = 30
zC <- replicate(10000, {
  x <- sample(1:sides, nb, replace=TRUE)
  (mean(x==6) - pc) / sqrt(pc*(1-pc)/nb)
})

zC

# create qqnorm plot
qqnorm(zC)
abline(0,1) # points are waaay to the left of normal line 

# D. p=0.01 & n=100
pc = 0.01
nd = 100
zD <- replicate(10000, {
  x <- sample(1:sides, nd, replace=TRUE)
  (mean(x==6) - pc) / sqrt(pc*(1-pc)/nd)
})

zD

# create qqnorm plot
qqnorm(zD)
abline(0,1) # points even further to the left of normal line


# CORRECT way...
ps <- c(0.5, 0.5, 0.01, 0.01) # combination of  possible probabilities
ns <- c(5, 30, 30, 100) # combinations of n events 
mypar(4,2) # four by two visual matrix

# for loop 
for(i in 1:4) {
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000, {
    x <- sample(1:sides, n, replace=TRUE)
    mean(x==1) - p / sqrt(p*(1-p)/n)
  })

# view histograms & qqplots
  hist(zs, nclass=7)
  qqnorm(zs)
  abline(0,1)
} 

# From all the plots, apparant that the second pairing (p=0.5 & n=30)
# approximates normal the best 


