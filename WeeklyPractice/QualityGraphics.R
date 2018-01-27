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
