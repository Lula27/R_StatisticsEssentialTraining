# Goal: Produce Descriptive Statistics for mtcars dataset 
# For the following variables - mpg, hp, & qsec (quater mile, time & second)
# Calculate: mean, SD, skewness & kurtosis 
# You have 5 minutes - GO! 

# load data 
data("mtcars")
str(mtcars)

# create variables
mph <- mtcars$mpg
mph
horsepower <- mtcars$hp
qsec <- mtcars$qsec



summary(mph)
require(psych) 

describe(mph)
# mean = 20.09
# sd = 6.03
# skew = 0.61
# kurtosis = -0.37 


describe(horsepower)
# mean = 146.69
# sd = 68.56
# skew = 0.73
# kurtosis = -0.14


describe(qsec)
# mean = 17.85
# sd = 1.79
# skew = 0.37
# kurtosis =  0.34



# An even faster, straight forward method 
# Use psych with vector values to retrieve values quickly
require(psych) 
# c(1=mpg, 4=hp, qsec=7)
descriptivevalues <- describe(mtcars[c(1, 4, 7)])
descriptivevalues

# Excessive data - strip to necessities: mean, SD, skewness & kurtosis 
descriptivevalues[, c(3, 4, 11, 12)]
