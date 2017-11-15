# R Statistics Essential Training
# Ex07_02
# Computing a bivariate regression

# Load data
?trees # Girth, height & volume for black cherry trees 
data(trees)
trees[1:5, ]  # Show first 5 lines

# Quick graphical check on data
hist(trees$Height)
hist(trees$Girth) # girth = diameter of tress in inches measured at 4ft 6in above ground 
plot(trees$Girth, trees$Height)
abline(lm(trees$Height ~ trees$Girth))

# Linear regression model - bivariate regression
# height(y) = bo + b1girth(x) + res 
# Explain height using Girth
reg1 <- lm(Height ~ Girth, data = trees)
reg1
summary(reg1)

# Confidence intervals for coefficients
confint(reg1)

# Predict values based on regression equation
predict(reg1)  # Predicted height based on girth
predict(reg1, interval = "prediction")  # CI for predicted height

# Regression diagnostics
lm.influence(reg1)
influence.measures(reg1)

rm(list = ls())  # Clean up
dev.off()
