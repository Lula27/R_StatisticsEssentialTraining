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


