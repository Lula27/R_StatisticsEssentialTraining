# R Statistics Essential Training
# Ex08_03
# # Look at association of several quantitative variables to eachother  
# By creating scatterplot matrices


# Load data
?iris
data(iris)
iris[1:5, ] # observe first 5 rows

# Standard scatterplot matrix - not very illuminating 
pairs(iris[1:4])


# Fancy scatterplot using packages - RColorBrewer 
require("RColorBrewer")
?RColorBrewer
display.brewer.pal(3, "Paired") # select 3 colors from paired


# Put hstograms on diagonal (from "pairs" help)
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5))
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
  # Removed "col = "cyan" from code block; original below
  # rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...) 
}

# Materialize scatterplot using info from previously constructed diagonals
pairs(iris[1:4],
      panel = panel.smooth, # optional smoother 
      main = "Scatterplot Matrix for Iris Data Using Pairs Function",
      diag.panel = panel.hist,
      pch = 16, 
      col = brewer.pal(3, "Paired")[unclass(iris$Species)])
# Right now, diagonal pairs (Sepal.Length, Sepal.Width, Petal.Lenght, Petal.Width not appearing)

# Use car package
library(car)
scatterplotMatrix(~Petal.Length + Petal.Width + Sepal.Length + Sepal.Width | Species,
                  data = iris,
                  col = brewer.pal(3, "RdBu"),
                  main = "Scatterplot Matrix for Iris Data Using \"car\" Package")

# Clean up
palette("default")
detach("package:RColorBrewer", unload = TRUE)
detach("package:car", unload = TRUE)
rm(list = ls())
dev.off()
