# Goal: Produce Descriptive Statistics for mtcars dataset 
# For the following variables - mpg, hp, & qsec
# Calculate: mean, SD, skewness & kurtosis 
# You have 5 minutes - GO! 


data("mtcars")

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