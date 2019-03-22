# R Statistics Essential Training
# Ex01_06
# Entering data manually


# Create sequential data 
x1 <- 0:10 # Assign numbers 0 through 10 to vector x1 
x1

x2 <- 10:0
x2

x3 <- seq(10)  # Create sequence - counts from 1 to 10
x3

x4 <- seq(30, 0, by = -3) # Counts down by 3
x4
S
# Manually enter data
x5 <- c(5, 4, 1, 6, 7, 2, 2, 3, 2, 8) # c - concatenate
x5

# Scan - to work with content generated in console 
x6 <- scan()  # Will read what ever number of entered items 

x6

# List objects - same as workspace viewr
ls()

# Clean up
rm(list = ls())
