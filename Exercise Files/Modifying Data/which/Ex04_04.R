# R Statistics Essential Training
# Ex04_04
# Coding missing data - not all functions will work with NA values 
# Use indexing and other tools to fill in values for missing data 


# NA = "Not Available"
# Makes certain calculations impossible
# Create vector and include an NA value
# take summary & mean
# x1 = index
v <- c(1, 7, 9, NA, -1, 0)
v

q <- c(1, 3, 6, NA, NA, -4, 7, NA)

summary(v)
mean(v) # results in NA


# To find missing values
?which()
which(is.na(v))  # outputs 4


# Ignore missing values with na.rm = T
# mean(index, )
mean(v, na.rm = T)



# Replace missing values with 0 (or other number)
# Option 1: Using "is.na"
# x2 <- x1    # Assign index of missing value to x2 
# x2[is.na(x2)] <- 0    # Assign 0 to x2
# x2

# Identifies null value and replaces it with 0
v2 <- v
v2[is.na(v2)] <- 0
v2

q2 <- q
q2[is.na(q2)] <- 0
q2


# Option 2: using "ifelse" - faster method 
x3 <- ifelse(is.na(x1), 0, x1)
x3

# sifts through vector v, if NA, will assign value of 0, else keep value the same
v3 <- ifelse(is.na(v), 0, v)
v3


# extra practice with ifelse 
q <- ifelse(is.na(q), 0, q)

c <- c(-7, 8, 9, NA, NA, NA)
c

c2 <- ifelse(is.na(c), 0, c)
c2


d <- c(0,0,0, 8, NA, 6, NA)
d

d2 <- ifelse(is.na(d), 0, d)
d2


# Clean workspace
rm(list = ls())





















