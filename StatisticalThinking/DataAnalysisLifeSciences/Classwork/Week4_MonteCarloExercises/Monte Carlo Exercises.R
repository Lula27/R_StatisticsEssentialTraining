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

# 4. Use Monte Carlo simulation to corroborate that the t-statistic comparing two means and obtained with normally distributed (mean 0 and sd) data follows a t-distribution.
# For which sample sizes does the approximation best work?
Ns <- seq(5,30,5)
B <- 1000
LIM <- c(-4.5, 4.5)
for(N in Ns){
  ts <- replicate(B, {
    x <- rnorm(N)
    y <- rnorm(N)
    t.test(x,y, var.equal = TRUE)$stat
  })
  ps <- seq(1/(B+1),1-1/(B+1),len=B)
  qqplot(qt(ps,df=2*N-2),ts,main=N,
         xlab="Theoretical",ylab="Observed",
         xlim=LIM, ylim=LIM)
  abline(0,1)
}

# 5. Is the following statement true or false? 
#  If instead of generating the sample with X=rnorm(15) we generate it with binary data (either positive or negative 1 with probability 0.5) 
# X =sample(c(-1,1), 15, replace=TRUE) then the t-statistic
set.seed(1)
N <- 15 
B <- 10000 
tstats <- replicate(B, {
  X <- sample(c(-1,1), N, replace=TRUE)
  sqrt(N)*mean(X)/sd(X)
})
ps=seq(1/(B+1), 1-1/(B+1), len=B)
qqplot(qt(ps, N-1), tstats, xlim=range(tstats))
abline(0,1)

# Results from this plot show that the population data is not normal thus the theory doesn't apply. 

# 6. If instead of generating the sample with X=rnorm(N) with N=1000, we generate the data with binary data X= sample(c(-1,1), N, replace=TRUE),
# then the t-statistic  sqrt(N)*mean(X)/sd(X) is approximated by a t-distribution with 999 degrees of freedom.
set.seed(1)
N <- 1000 
B <- 10000
tstats <- replicate(B,{
  X <- sample(c(-1,1), N, replace=TRUE)
  sqrt(N)*mean(X)/sd(X)
})
qqnorm(tstats)
abline(0,1)
# Looks normal to me. Approximated normal 0,1. 
#Furthermore, t-distribution with df=999 and normal are practically the same.

# 7. Use a Monte Carlo to determine which of the following best approximates 
# the median of a sample taken from normally distributed population with mean 0 and standard deviation 1.
set.seed(1)
Ns <- seq(5,45,5)
library(rafalib)
mypar(3,3)
for(N in Ns){
  medians <- replicate(10000, median ( rnorm(N) ) )
  title <- paste("N=",N,", avg=",round( mean(medians), 2) , ", sd*sqrt(N)=", round( sd(medians)*sqrt(N),2) )
  qqnorm(medians, main = title )
  qqline(medians)
}
# Plot shows that sample median is approximatly normal with mean 0 and SD larger than 1/sqrt(N)


# Clean up 
rm(list = ls())
dev.off()
