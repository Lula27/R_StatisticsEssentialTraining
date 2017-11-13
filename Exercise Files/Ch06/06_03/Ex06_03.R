# R Statistics Essential Training
# Ex06_03
# Creating scatterplots

# Load data
?cars
data(cars)
cars

# Basic Scatterplot
plot(cars)
?pch # add points to plot 

# Modified scatterplot
plot(cars,
  pch = 16,
  col = "gray",
  main = "Speed vs. Stopping Distance for cars in 1920s\nFrom\"cars\"Dataset",
  xlab = "Speed (MPH)",
  ylab = "Stopping Distance (feet)")

# Linear regression line
abline(lm(cars$dist ~ cars$speed),
       col = "darkgreen",
       lwd = 3)

# locally weighted scatter plot smoothing line (lowess)
lines(lowess(cars$speed, cars$dist),
      col = "blue",
      lwd = 2)


# Use this package to open up variations of scatter plots
require(car)

# fancy scatterplot with marginal boxplots, smoothers & quantile regression intervalls
scatterplot(cars$dist ~ cars$speed,
            pch = 16,
            col = "black", 
            main = "Speed vs. Stopping Distance for cars in 1920s\nFrom\"cars\"Dataset",
            xlab = "Speed (MPH)",
            ylab = "Stopping Distance (feet)")


# Clean up 
rm(list = ls())

dev.off()
