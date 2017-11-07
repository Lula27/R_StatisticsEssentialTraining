# R Statistics Essential Training
# Ex03_05
# Single categorical variable: One sample chi-square test (goodness of fit)


# Load data
?HairEyeColor # 3-D array - 592 observation w/ 3 variables (1: Hair, 2: Eye, 3: Sex)
data("HairEyeColor") # load dataset into enviornment
HairEyeColor
str(HairEyeColor)


# Get marginal frequencies for eye color
# Since it's a 3-D array, 1: Hair, 2:Eye, 3:Sex
?margin.table
margin.table(HairEyeColor, 2)



# Save eye color to data frame (eye)
eye <- margin.table(HairEyeColor, 2)
eye 

# Show as proportions w/2 digits
round(prop.table(var), n)
reye <- round(prop.table(eye), 2)
rm(reye)


# Use Pearson's chi-squared test
# Need one-dimensional goodness-of-fit test
# Default test (assume equal distribution - each eye color has same proportion)
# name variable as chi1 ; note: can't take chi squared of rounded proportion table! 
?chisq.test

chi1 <- chisq.test(eye)
chi1

# Output: p-value of 2.2e-16 means we reject the Ho that there is an equal proportion of eye color observed in sample 


# Compare to population distribution
# Population data from:
browseURL("http://www.statisticbrain.com/eye-color-distribution-percentages/")
# Approximate proportions:
#  Brown: .41 (Combining Brown Irises with Specks & Dark Brown Irises)
#  Blue:  .32 (Blue / Grey Irises)
#  Hazel: .15 (Blue / Grey / Green Irises with Brown / Yellow Specks)
#  Green  .12 (Green / Light Brown Irises with Minimal Specks)
# p = c(.41, .32, .15, .12)

p <- c(.41, .32, .15, .12)
p

# Create chi2 using vector p 
?chisq.test()
# chi2 <- chisq.test(sample variable, population variable)
# Can't store vectore, have to write it out in test formula 
chi2 <- chisq.test(eye, p = c(.41, .32, .15, .12))
chi2

# p-val = 0.09079 -> fail to reject ho 
# Clean up

rm(list = ls())












