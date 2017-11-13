# R Statistics Essential Training
# Ex06_01
# Creating bar charts of group means
# Simple example of bivariate plot (2 variables - count & spray)  

# Load data - store in new variable "spray"
?InsectSprays
View(InsectSprays)

spray <- InsectSprays$spray
spray

# To plot means, first get the means for the groups (use aggregate)
# Count & spray 
?aggregate
means <- aggregate(InsectSprays$count ~ spray, FUN = mean)
means

# To get a barplot, need to extract means and reorganize
# Removes first columns, transposes second - mean.data <- t(means[-1])
barplot(means) # results in error - 'height' must be a vector or a matrix 

# remove first column & transpose 
mean.data <- t(means[-1])

plot <- barplot(mean.data)

# Get column names from means data - select from mean all columns & 1st row[ ,1]
colnames(mean.data) <- means[, 1]


# Basic barplot for means
barplot(mean.data)


# Modified barplot
barplot(mean.data,
        col = "lightblue",
        main = "Effectiveness of Insect Sprays",
        xlab = "Spray Used",
        ylab = "Insect Count")

# clean up
rm(list = ls())

dev.off()
