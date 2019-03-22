# R Statistics Essential Training
# Ex08_02
# Creating scatterplots for grouped data
# Show x/y relationship for three different groups using scatterplot function in cars package

# Load data
?iris
data(iris)
# Show first five observations
iris[1:5, ]

# Load "car" package
require(car)


# Make scatterplot using car package
# Single scatterplot with groups marked
# Function can be called "scatterplot" or "sp"
sp(Sepal.Width ~ Sepal.Length | Species,
   data = iris,
   xlab = "Sepal Width",
   ylab = "Sepal Lenght",
   main = "Iris Data",
   labels = row.names(iris))

# Clean up
detach("package:car", unload=TRUE)
rm(list = ls())
dev.off()
