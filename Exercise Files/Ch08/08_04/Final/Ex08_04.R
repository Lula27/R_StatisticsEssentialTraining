# R Statistics Essential Training
# Ex08_04
# Creating 3-D scatterplots
# 3-D Scatterplot is often hard to read 
# preferable to substitute w/ Scatterplot matrix

# Load data
?iris
data(iris)
iris[1:5, ]

# Static 3D scatterplot 
# Install and load the "scatterplot3d" package
install.packages("scatterplot3d")
require("scatterplot3d")

# Basic static 3D scatterplot 
scatterplot3d(iris[1:3]) # choose 3 variables 
# Problem - hard to place since 3D on 2D surfase 

# Modified static 3D scatterplot - helps to better place 
# Coloring, vertical lines
# and Regression Plane - saved as an object
s3d <-scatterplot3d(iris[1:3],
                    pch = 16, # change points to solid circles 
                    highlight.3d = TRUE,
                    type = "h",
                    main = "3D Scatterplot")
plane <- lm(iris$Petal.Length ~ iris$Sepal.Length + iris$Sepal.Width) 
s3d$plane3d(plane) # Create plane using linear model 

# Spinning 3D scatterplot
# Install and load the "rgl" package ("3D visualization 
# device system (OpenGL)")
# NOTE: This will cause RStudio to crash when graphics 
# window is closed. Instead, run this in the standard, 
# console version of R.
install.packages("rgl") # spinning 3D plot - not compatible with R-Studio
require("rgl")
require("RColorBrewer")
plot3d(iris$Petal.Length,  # x variable
       iris$Petal.Width,   # y variable
       iris$Sepal.Length,  # z variable
       xlab = "Petal.Length",
       ylab = "Petal.Width",
       zlab = "Sepal.Length",
       col = brewer.pal(3, "Dark2")[unclass(iris$Species)],
       size = 8)

# Clean up
detach("package:scatterplot3d", unload = TRUE)
detach("package:rgl", unload = TRUE)
detach("package:RColorBrewer", unload = TRUE)
rm(list = ls())
dev.off()
