# R Statistics Essential Training
# Ex09_04
# Conducting a principal component analysis & factor analysis
browseURL('https://onlinecourses.science.psu.edu/stat505/node/49') # Background info on Principal Component 


# From "psych" package documentation (p. 213)
# "The primary empirical difference between a components 
# versus a factor model is the treatment of the variances
# for each item. Philosophically, components are weighted
# composites of observed variables while in the factor
# model, variables are weighted composites of the factors."

# Differences 
# Principle Components Analysis- model explains variance completly 
# Components = function of observed variables (observed variables come first and components come after)
# Factor Analysis- factors come first and variables are a result fo them
# Proceedures are very similar - people often confuse the two 

# Load data 
?mtcars
data(mtcars)
mtcars[1:5, ]
mtcars1 <- mtcars[, c(1:4, 6:7, 9:11)]  # Select variables - drop some
mtcars1[1:5, ]

# Looking at association between variables (grouping columns)
# Principle components model using default method
# If using entire data frame:
pc <- prcomp(mtcars1,
             center = TRUE,  # Centers means to 0 (optional)
             scale = TRUE)  # Sets unit variance (helpful)
# Or specify variables:
# Alternatively, can specify variables one at a time 
# pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am + 
#                gear + carb, data = mtcars, scale = TRUE)

# R has 2 different methods for Principle Components 
?prcomp  # Generally preferred
?princomp  # Very slightly different method, similar to S

# Get summary stats
summary(pc) # importance of components - variables combined to create components



# Screeplot - has a lot to do with how much of the variance each component explains
plot(pc) # notice that the first 2 components most important (tallest bars)

# Get standard deviations and how variables load on PCs
pc
# Rotation - relationship btw. variables & components 
# ex: PC1 & mpg - higher car got on mpg, the lower it got on component 1 (has to do with size of car and motor)

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

# Also gives uniqueness values for variables,
# variable loadings on factors, and variance
# statistics.

# If we get one factor, it means our model deviates too far from observation.
factanal(mtcars1, 1)
# Try two factors - 
factanal(mtcars1, 2)
factanal(mtcars1, 3)
# With four factors, we see that observations don't differ significantly from model
factanal(mtcars1, 4)  # First w/p > .05

rm(list = ls())  # Clean up
dev.off()
