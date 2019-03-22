# R Statistics Essential Training
# Ex09_04
# Conducting a principal components/factor analysis

# Part 1: Principal Component Analysis 
# Load cars dataset 
?mtcars
data(mtcars)
mtcars[1:5, ]

# Select specific variables - c(1:4, 6:7, 9:11)
cars <- mtcars[ , c(1:4, 6:7, 9:11)]
cars[1:5, ] # Observe first 5 rows 


# Part 1 - Principal Components
pc <- prcomp(cars,
             center = TRUE, 
             scale = TRUE)


# Get summary stats
summary(pc)


# Screeplot - has a lot to do with how much of the variance each component explains
plot(pc) # first 2 components most important (tallest bars)

# Get standard deviations and how variables load on PCs
pc

# See how individual cases load on PCs
# PC1 = size of car
# PC2 = speed of car
predict(pc)

# Biplot - busy chart, 2 components (PC1 & PC2)
# In red, each of the variables that went into components
biplot(pc)


# Factor Analysis - give you p-values (tell you how many factors you need to have)
# Varimax rotation by default
# Gives chi square test that number of factors
# is sufficient to match data (want p > .05).


# If we use one factor, it means our model deviates too far from observation.
factanal(cars, 1)
factanal(cars, 2)
factanal(cars, 3)
# With four factors, we see that observations don't differ significantly from model
factanal(cars, 4)

# Clean up
rm(list = ls())
dev.off()
