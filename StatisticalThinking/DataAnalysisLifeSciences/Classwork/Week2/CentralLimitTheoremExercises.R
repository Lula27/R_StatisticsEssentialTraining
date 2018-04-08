#Central Limit Theorem Exercises

# 1. If a list of numbers has a distribution that is well approximated by the normal distribution, 
# what proportion of these numbers are within one standard deviation away from the list's average?

# Use normal distribution chart - 1 standard deviation: .6826 or 68.26% 

# 2. What proportion of these numbers are within two standard deviations away from the list's average?
# Within two standard deviations: .9546 or 95.46%

# 3. What proportion of these numbers are within three standard deviations away from the list's average?
# Within two standard deviations: .9972 or 99.72 %

# 4. Define y to be the weights of males on the control (chow) diet. 
# What proportion of the mice are within one standard deviation away from the average weight 
# (remember to use popsd for the population sd)?


dat <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\mice_pheno.csv')

# remove nulls
dat <- na.omit(dat)

require(dplyr)

y <- filter(dat, Sex == "M" & Diet == "chow") %>%
      select(Bodyweight) %>% unlist
# population mean of male mice on control (chow) diet 
mean(y) # got NA b/c forgot to remove nulls 
# re-do after removing nulls: 30.96381 = (mu for male mice on chow)
# average weight:  30.96381

require(rafalib)

# get standard deviation
popsd(y) # 4.420501 


# What proportion of the mice are within one standard deviation away from the average weight 
# (remember to use popsd for the population sd)? 
# Note: distribution isn't normal but the proportions being calculated are very close to values for nd

# take a look at the distribution 
hist(y) # so not normal....so normal distribution doesn't apply 

abline(v = mean(y), col='red')

# Solution: use z socre - 0.6950673 is prop. of mice within one sd away from mean
# z <- ( y - mean(y) ) / popsd(y)
# mean( abs(z) <=1 ) 

z <- (y - mean(y)) / popsd(y) # vector - (each y - mean(y)) divided by sd of y
mean(abs(z) <=1)

# 5. What proportion of these numbers are within two standard deviations away from the list's average?
mean(abs(z) <= 2)

# 6. What proportion of these numbers are within three standard deviations away from the list's average?
mean(abs(z) <= 3)


# 7. We can actually compare all quantiles using a qqplot. 
# Which of the following best describes the qq-plot comparing mouse weights to the normal distribution?
qqnorm(z)
abline(0,1)


# 8. Create the above qq-plot for the four populations: male/females on each of the two diets. 
# What is the most likely explanation for the mouse weights being well approximated?
# What is the best explanation for all these being well approximated by the normal distribution? 

mypar(2,2) # Does side-by-side plotting 
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)

# Possible explanation for these approximating to normal distribution 
# This just happens to be how nature behaves in this particular case. Perhaps the result of many biological factors averaging out.

y <- filter(dat, Sex=="M" & Diet=="chow") %>%
      select(Bodyweight) %>% unlist 

set.seed(1)

avgs <- replicate(10000, mean(sample(y, 25)))

# plot against normal distribution 
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

# 9. What is the average of the distribution of the sample average?
mean(avgs)


# 10. What is the standard deviation of the distribution of sample averages? 
sd(avgs)


# Clear workspace
rm(list = ls())
dev.off()
