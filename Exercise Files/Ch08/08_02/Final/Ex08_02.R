# R Statistics Essential Training
# Ex08_02
# Creating scatterplots for grouped data
# Show x/y relationship for three different groups using scatterplot function in cars package

# Load data
?iris
data(iris)
iris[1:5, ] # first five observations 

# Load "car" package
require(car)  # "Companion to Applied Regression"

# Make scatterplot using car package
# Single scatterplot with groups marked
# Function can be called "scatterplot" or "sp"
sp(Sepal.Width ~ Sepal.Length | Species, # | (pipe) = broken down by 
   data = iris,  
   xlab = "Sepal Width", 
   ylab = "Sepal Length", 
   main = "Iris Data", 
   labels = row.names(iris))
# gives scatterplot, linear regression & smoother 

# Clean up
detach("package:car", unload=TRUE)
rm(list = ls())
dev.off()
