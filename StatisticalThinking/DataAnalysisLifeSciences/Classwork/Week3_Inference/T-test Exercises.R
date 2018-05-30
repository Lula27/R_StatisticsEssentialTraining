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
# tstat = 2.1209 
