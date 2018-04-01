# Statistical Inference 
# Populations, Samples and Estimates - 8% 


# Step 1: understand population of interest 
# Female mice example populations (fixed population)
# pop 1 = female mice on control diet (chow)
# pop 2 = female mice on test diet (high fat diet) 

# load data 
dat <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\mice_pheno.csv")
View(dat)

# Compute size of control population (same process for homework)
# Control values denoted as x1,....,xm
library(dplyr)
controlPopulation <- filter(dat, Sex == "F"
                            & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 
length(controlPopulation)


# Apply same process to find length of highfat 
# test values denoted as y1,...,yn 
hfPopulation <- filter(dat, Sex == "F"
                       & Diet == "hf") %>%
  select(Bodyweight) %>% unlist
length(hfPopulation)

# population parameters = quantities that can be obtained from population 
# ie: mean, variance, standard deviation

rm(list = ls())

# Exercises 
# How to remove nulls in R
dat <- na.omit(dat)
View(dat)
str(dat) # get structure (overview) of dataset 

#1.  Using dplyr, create vector x w/ body weights of all males in control diet 
x <- filter(dat, Sex == "M" 
            & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 
x
mean(x) # population bodyweight average for male mice on chow diet = 30.96381 

# access rafalib package
library(rafalib)
?popsd

#2. compute population standard deviation 
# na.rm (remove null values = False, irrelavant since no null values in ds anyway)
popsd(x, na.rm = FALSE) # 4.420501 

#3. Set seed = 1; take random sample of size 35 from x 

set.seed(1)

rs <- sample(x, 25) # random sample of 25 

mean(rs) # 32.0956 is average bodyweight for male mice in random sample of 25 on chow diet

#4. Use dplyr to create vector y with body weight of all males on high fat (hf) diet 
y <- filter(dat, Sex == "M"
            & Diet == "hf") %>%
  select(Bodyweight) %>% unlist 
y
mean(y) # population bodyweight average for male mice on high fat diet = 34.84793

# 5 compute population standard deviation using rafalib package
popsd(y) # population standard deviation for bodyweight for hf diet: 5.574609 

# 6. Set seed at 1 and take random sample of size 25 from y 
set.seed(1)
rshf <- sample(y, 25)
mean(rshf) # 34.4984 is average bodyweight for male mice in random sample of 25 on hf diet

# 7. What is the difference in absolute value between mean of two samples?
abs(mean(rshf) - mean(rs)) # 2.4028 is difference btw random sample means
abs(mean(x) - mean(y)) # 3.884116 is difference population means 

# 8. Repeat the above for females - What is the difference in absolute values btw 
# sample means & population means 
a <- filter(dat, Sex == "F" 
            & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 
Xbar <- mean(a)
Xbar # population mean for female mice on chow diet is  23.89338 

b <- filter(dat, Sex == "F" 
            & Diet == "hf") %>%
  select(Bodyweight) %>% unlist 
Ybar <- mean(b)
Ybar # population mean for female mice on high fat diet is 26.2689 

# Difference btw population means 
abs(Xbar - Ybar) # 2.375517 

# Now, take samples and find difference in means 
set.seed(1)
s1 <- sample(a, 25)
ms1 <- mean(s1)
ms1 # sample mean for female mice on chow diet: 23.1692 

set.seed(1)
s2 <- sample(b, 25)
ms2 <- mean(s2)
ms2 # sample mean for female mice on high fat diet: 26.2812

# Difference in samples 
abs(ms2 - ms1) # 3.112 

# 9. For the females, our sample estimates were closer to the population difference than with males. 
# What is a possible explanation for this? 
# A) The population variance of the females is smaller than that of the males; thus, the sample variable has less variability.


# Clean up 
rm(list = ls())
