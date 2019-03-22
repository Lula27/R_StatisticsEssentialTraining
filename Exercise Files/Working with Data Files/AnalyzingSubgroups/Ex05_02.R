# R Statistics Essential Training
# Ex05_02
# Analyzing by subgroups


# Load data
?iris
data("iris")
iris


# get mean of petal width 
mean(iris$Petal.Width) # = 1.199333


# Analysis by subgroups
# Split the data file and repeat analyses
# with "aggregate"
# Compare groups on mean of one variable - use Petal Width & Iris Species 
aggregate(iris$Petal.Width ~ iris$Species, FUN = mean)

# list sepal width as a function of species 
aggregate(iris$Sepal.Width ~ iris$Species, FUN = mean)



# Use cbind (column bind) to list multiple subgroups - sepal width & length 
aggregate(cbind(iris$Sepal.Length, iris$Sepal.Width) ~ iris$Species, FUN = sum)

aggregate(cbind(iris$Petal.Length, iris$Petal.Width) ~ iris$Species, FUN = mean)


rm(list = ls())
