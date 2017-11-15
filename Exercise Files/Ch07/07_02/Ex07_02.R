# R Statistics Essential Training
# Ex07_02
# Computing a bivariate regression - another basic measure of association 
# Correlation is for assessing strenght of association
# Regression gives you equation to use one variable to predict values on another variable 

# Load data
?trees
data(trees)
trees[1:10, ] # Show first 10 lines in console 



# Quick graphical check on data
# Hist: height & girth for trees data set
hist(trees$Height) # looks good, small variation, no outliers really
hist(trees$Girth) # positivly skewed - outlier drifting to the right 

# Scatter plot of girth & height - plot(x, y)
plot(trees$Girth, trees$Height)
# Get regression line - height(y), girth(x) - abline(lm(y ~ x))
abline(lm(trees$Height ~ trees$Girth))



# Linear regression model - bivariate regression 
# regression name <- lm(y ~ x, data = dataframe)
girthonHeight <- lm(Girth ~ Height, data = trees)
# Rename variable regression... never mind - not doing what I want to - will try again another time
names(girthonHeight)[names(girthonHeight) == 'girthonHeight'] <- 'GirthonHeight'

# Get summary 
summary(girthonHeight)
# Statistical significance showing a one unit increase in height is associated with a 0.25575 increase in girth 
# Based on adjusted R-squared, girth can explain about 0.24 or 24% of variation in height

# Confidence intervals for coefficients
confint(girthonHeight)


# Predict values based on regression equation - in our example, use girth to predict height
# Predicted height based on girth - predict(dataframe)
?predict
predict(girthonHeight)


# Regression diagnostics - lm.influence; influence.measures - fancy, not sure what's happening here
?lm.influence() #  wide variety of diagnostics for checking the quality of regression fits
lm.influence(girthonHeight)
?influence.measures # suite of functions can be used to compute some of the regression (leave-one-out deletion) diagnostics for linear and generalized linear models 
influence.measures(girthonHeight)


# Clean up
rm(list = ls())
dev.off()
