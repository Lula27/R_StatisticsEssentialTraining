# R Statistics Essential Training
# Ex05_01
# Selecting cases - fine tune analysis based on subsets

# = is assignment operator (in R, this is used for assignment <- )
# == is boolean operator for equals 


# Load data
?mtcars
data("mtcars")
mtcars


# Mean quarter-mile time (for all cars)
# [, 7]	 qsec	 1/4 mile time
qmt <- mtcars$qsec
qmt

qmtwo <- mtcars[, 7] # mth two 
qmtwo

# long way of finding Mean quarter-mile time (for all cars)
mean(mtcars$qsec) # = 17.84875

# short way
mean(qmt)  # = 17.84875 


# Mean quarter-mile time (for 8-cylinder cars)
# Use square brackets to indicate what to select
# in this format: [rows]

# A. long notation format  
mean(mtcars$qsec[mtcars$cyl == 8]) # = 16.77214



# B. short notation format 
Eightcyl <- mtcars[mtcars$cyl == 8]

mean(qmt[mtcars$cyl == 8])  # use [] to access rows - equals 16.77214


# Median horsepower (for all cars)
median(mtcars$hp) # 123


# Mean MPG for cars above median horsepower
# A long, redundant way 
mean(mtcars$mpg[mtcars$hp > median(mtcars$hp)]) # equals 15.40667

# B short way
himedhp <- mtcars$hp > median(mtcars$hp)
mean(mtcars$mpg[himedhp]) # 15.40667


# Create new data frame for 8-cylinder cars
# To create a new data frame, must indicate
# which rows and columns to copy in this
# format: [rows, columns]. To select all
# columns, leave second part blank.
# Call it cyl.8
cyl.8 <- mtcars[mtcars$cyl == 8, ]
cyl.8


# Select 8-cylinder cars with 4+ (>=) barrel carburetors
mtcars[mtcars$cyl == 8 & mtcars$carb >= 4, ]


mtcars
# Select all cars with mpg > 17 & am is 1
mtcars[mtcars$mpg > 17 & mtcars$am == 1, ]


# Create data frame for cars with  6 cyl & gear 4+
higear <- mtcars[mtcars$cyl == 6 & mtcars$gear >= 4, ]
higear

# Clean up
rm(list = ls())
