# R Statistics Essential Training
# Ex08_04
# Creating 3-D scatterplots
# preferable to substitute w/ Scatterplot matrix


# Load data
data("iris")
iris[1:5, ]


# Static 3D scatterplot 
# Install and load the "scatterplot3d" package
install.packages("scatterplot3d")
require("scatterplot3d")


# Basic stat3d(ic 3D scatterplot
scatterplot3d(iris[1:3])


# Modified static 3D scatterplot - helps to better place 
# Coloring, vertical lines
# and Regression Plane - saved as an object
