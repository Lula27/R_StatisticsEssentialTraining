# Population, Samples, and Estimates Exercises 
# Lesson: Smaller population variance results in smaller sample variability. 

dat <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\mice_pheno.csv')

View(dat)

# omit missing values (nulls)
dat <- na.omit(dat)

require(dplyr)

?dplyr

# Example - 
# controlPop <- filter(dat,Sex == "F" & Diet == "chow") %>%
# select(Bodyweight) %>% unlist 
# controlPop


# 1. Use dplyr to create a vector x with the body weight of all males on the control (chow) diet.
# What is this population's average?

x <- filter(dat, Sex == "M" & Diet == "chow") %>%
  select(Bodyweight) %>% unlist 

# Population's average
mean(x)

# 2. Now use the rafalib package and use the popsd function to compute the population standard deviation.
require(rafalib)
?popsd

popsd(x)

# 3. Set the seed at 1. Take a random sample X of size 25 from x. What is the sample average?
set.seed(1)

sX <- sample(x, 25)

# Sample average
mean(sX)

# 4. Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet. 
# What is this population's average?

y <- filter(dat, Sex == "M" & Diet == "hf") %>%
  select(Bodyweight) %>% unlist 

# population average
mean(y)


# 5. Now use the rafalib package and use the popsd function to compute the population standard deviation.
popsd(y)

# 6. Set the seed at 1. Take a random sample  of size 25 from y. 
# What is the sample average?
set.seed(1)

sY <- sample(y, 25)

# Sample average
mean(sY)

# 7. What is the difference in absolute value between (mean pop y - mean pop x) and (mean sample y - mean sample x)?
abs((mean(y) - mean(x)) - (mean(sY) - mean(sX)))


# 8. Repeat the above for females. Make sure to set the seed to 1 before each sample call. 
# What is the difference in absolute value between (mean pop fy - mean pop fx) and (mean sample fy - mean sample fx)?
fx <- filter(dat, Sex == "F" & Diet == "chow") %>% 
        select(Bodyweight) %>% unlist 

# population mean for female mice on chow diet 
mean(fx)

fy <- filter(dat, Sex == "F" & Diet == "hf") %>%
        select(Bodyweight) %>% unlist 
# population mean for female mice on high fat diet 
mean(fy)

# Don't forget to set seed to one before taking samples! 
set.seed(1)

# Sample of 25 for female mice on chow diet 
sfX <- sample(fx, 25)

mean(sfX)

# Sample of 25 for female mice on high fat diet 
sfY <- sample(fy, 25)

mean(sfY)

# 8. What is the difference in absolute value between (mean pop fy - mean pop fx) and (mean sample fy - mean sample fx)?
abs((mean(fy) - mean(fx)) - (mean(sfY) - mean(sfX)))

# Clear workspace 
rm(list = ls())
