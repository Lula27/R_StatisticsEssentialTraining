# CLT and t-distribution in Practice Exercises
# Central Limit Theorum applies when events are independent. 

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
