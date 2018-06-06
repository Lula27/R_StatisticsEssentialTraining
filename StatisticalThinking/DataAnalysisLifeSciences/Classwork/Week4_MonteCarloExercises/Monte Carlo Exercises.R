# Monte Carlo Simulations 

# ASssumption: parametric distribution and generate population from it
# In other words: Take parameters estimated from real data & plug into model
# In this example: Model(normal distribution) <- real world data(mean & standard deviation)

# Generate data 
controls <- rnorm(5000, mean=24, sd=3.5)

# Create model 
ttestgenerator <- function(n, mean=24, sd=3.5) {
  cases <- rnorm(n, mean, sd)
  controls <- rnorm(n, mean, sd)
  tstat <- (mean(cases)-mean(controls)) / 
    sqrt( var(cases)/n + var(controls)/n )
  return(tstat)
}


# Monte Carlo Exercises 
#1. You are William Sealy Gosset but with computers! Yay! :) 
# Use a Monte Carlo simulation to generate the distribution of the t-statistic when the sample comes from a normal distribution.
# Perform a Monte Carlo simulation using rnorm, a random number generator for normally distributed data
set.seed(1)
X <- rnorm(5)
t <- (sqrt(5)*mean(X))/sd(X)
t


#2. Set the seed to 1, generate B=1000 t-statistics as done in exercise 1.
# What proportion is larger than 2? 
# set seed 
set.seed(1)

# create function
ttestgenerator <- function(n) {
  Y <- rnorm(n)
  tstat <- (sqrt(n)*mean(Y))/sd(Y)
  return(tstat)
}

# replicate it 1000x 
ttests <- replicate(1000, ttestgenerator(5))
mean(ttests>=2)

# 3. Use qqplot to compare theoretical quantiles to those obtained in the Monte Carlo simulations.
# For which sample sizes does the approximation best work? 
# 6 panels of qqplots 
library(rafalib)
mypar(3,2)

Ns <- seq(5,30,5)
B <- 1000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  ts <- replicate(B, {
    X <- rnorm(N)
    sqrt(N)*mean(X)/sd(X)
  })
  ps <- seq(1/(B+1), 1-1/(B+1), len=B)
  qqplot(qt(ps,df=N-1),ts,main=N, 
         xlab="Theoretical",ylab="Observed",
         xlim=LIM, ylim=LIM)
  abline(0,1)
}