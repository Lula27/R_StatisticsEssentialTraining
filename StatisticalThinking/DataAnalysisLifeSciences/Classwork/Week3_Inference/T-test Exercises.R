# Week 3
# T-test Exercises 


# Access dataset 
library(downloader)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)

# Read data 

babies <- read.table("babies.txt", header=TRUE) 


head(babies)

require(dplyr)

# Split two birth weight datasets 
# birth weights for non-smoking mothers 
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>%
  unlist

# birth weights for smoking mothers
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>%
  unlist 


# Loook for true pop. diff. in means btw smoking & non-smoking birth weights
library(rafalib)
mean(bwt.nonsmoke) - mean(bwt.smoke) # avg. diff. in birthweights: 8.937666
popsd(bwt.nonsmoke) # 17.38696
popsd(bwt.smoke) # 18.08024 <- higher variance 

# Test: If birth weights of babies born to non-smoking mothers are significantly different from 
# birth weights of babies born to smoking mothers 

# 1. Compute t-statistic (tval) of sample of N=25 for birth weights for children of smoking & nonsmoking mothers.
set.seed(1)

# sample from ns moms
dat.ns <- sample(bwt.nonsmoke, 25)
length(dat.ns) 

# sample from smoking moms
dat.s <- sample(bwt.smoke, 25)

?t.test
tstat <- t.test(dat.ns, dat.s)
tstat
tval <- 2.1209 

# 2. Super vague question...but evidently, find pvalue 
pval2 <- 1-(pnorm(abs(tval))-pnorm(-abs(tval)))
pval2

# pval2 = 0.03393022

# 3.  calculate the probability that a t-value under the null could have a larger absolute value than tval
#a. -0.9660698
a <- 1-2*pnorm(abs(tval))

# b. 0.9660698
b <- 1-2*pnorm(-abs(tval))

# c. 0.9830349
c <- 1-pnorm(-abs(tval))

# d.0.03393022 = CORRECT! :) 
d <- 2*pnorm(-abs(tval))

# 4. If we use the CLT, what quantity would we add and subtract to this estimate to obtain a 99% confidence interval?
# sample mean difference = -9.92 
mean(dat.s) - mean(dat.ns)

# CLT formula - plug & chug - 99% confidence interval = 0.995
N <- 25 # sample size 

qnorm(0.995)*sqrt( sd( dat.ns)^2/N + sd( dat.s)^2/N )
