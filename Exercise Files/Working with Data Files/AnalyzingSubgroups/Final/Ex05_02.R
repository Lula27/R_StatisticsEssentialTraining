# R Statistics Essential Training
# Ex05_02
# Analyzing by subgroups

# Load data
?iris
data(iris)
iris

mean(iris$Petal.Width) # = 1.199333

# Split the data file and repeat analyses
# with "aggregate"
# Compare groups on mean of one variable - use Petal Width & Iris Species 
aggregate(iris$Petal.Width ~ iris$Species, FUN = mean)
#aggregate(outcome variable ~ = as a function of, FUN(function) = statistics function - what you want)

# Try with petal length as a function of species 
aggregate(iris$Petal.Length ~ iris$Species, FUN = mean)

# sum 
aggregate(iris$Sepal.Length ~ iris$Species, FUN = sum) 


# Compare groups on several variables
# Use cbind (column bind) to list outcome variables
aggregate(cbind(iris$Petal.Width, iris$Petal.Length) ~ iris$Species, FUN = mean)
# V1 = petal width 
# v2 = petal lenght 

aggregate(cbind(iris$Petal.Length, iris$Petal.Width, iris$Sepal.Length) ~ iris$Species, FUN = mean)

rm(list = ls())  # Clean up
