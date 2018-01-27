# Publication Quality Base R Graphics
# Test data set 
browseURL("https://www.r-bloggers.com/styling-base-r-graphics/") # guide 

# A: Standard base R Scatter Plot 

?iris # 3 species of iris: Setosa, Versicolor, Virginica 
plot(iris$Sepal.Length, iris$Sepal.Width, col = 
       iris$Species)
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 21)
title("Paired Comparrison of Sepal Length and Width")



# How do I know which species is which based on the color? 
# Lol, nice attempt but the next line of code will give me this info
?boxplot()
boxplot(Petal.Width ~ Petal.Length, data = iris)

mean(iris$Petal.Length, col=iris$Species)


# My scatter plot with petal lenght and width 
plot(iris$Petal.Length, iris$Petal.Width, col = 
       iris$Species)


# Problem: there may be some points in the scatter plot sitting on top of each other 
# Fixing the problem - jiggle points (move them around) using jitter() function 
iris$Sepal.Length = jitter(iris$Sepal.Length)
iris$Sepal.Width = jitter(iris$Sepal.Width)

# Select nicer colors with palette from "I want hue" website 
alpha = 150  # Transparent points
palette(c(rgb(200, 79, 178, alpha = alpha, maxColorValue = 255),
          rgb(105, 147, 45, alpha = alpha, maxColorValue = 255),
          rgb(85, 130, 169, alpha = alpha, maxColorValue = 255)))

# Using par() function, alter some plot characteristics 
par(mar = c(3, 3, 2, 1),  # Dist from plot to side of page
    mgp = c(2, 0.4, 0), # Dist plot to label
    las = 1, # Rotate y-axis text
    tck = -.01, # Reduce tick length 
    xaxs = "i", yaxs = "i") # Remove plot padding 

# Plot the function itself with the plot() function
plot(iris$Sepal.Length, iris$Sepal.Width,
     bg = iris$Species, # Fill color
     pch = 21, # Shape: circles that can be filed 
     xlab = "Sepal Length", ylab = "Sepal Width", # x-axis labels
     axes = FALSE, # Don't plot axes
     frame.plot = FALSE, # Remove the frame 
     xlim = c(4,8), ylim = c(2, 4.5), # Limits
     panel.first = abline(h = seq(2, 4.5, 0.5), col = "grey80"))

# Add x-axis tick marks 
at = pretty(iris$Sepal.Length)
mtext(side = 1, text = at, at = at,
      col = "grey20", line = 1, cex = 0.9)

# Add y-axis tick marks
at = pretty(iris$Sepal.Width)
mtext(side = 2, text = at, at = at, col = "grey20", line = 1, cex = 0.9)

# Create the legend 
text(5, 4.2, "Setosa", col = rgb(200, 79, 178, 
maxColorValue = 255))
text(5.3, 2.1, "Versicolor", col = rgb(105, 147, 45,
maxColorValue = 255))
text(7, 3.7, "Virginica", col = rgb(85, 130, 169, 
maxColorValue = 255))

# Plot the title
title("Scatter plot of Iris Sepal width and length", adj = 1,
      cex.main = 0.8, font.main = 2, col.main = "black")

dev.off()

