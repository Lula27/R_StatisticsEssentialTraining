# R Statistics Essential Training
# Ex07_08
# Computing robust statistics for bivariate associations 
# Using quantile regression 
# Useful for times when you don't have assumptions to proceed with standard reg
# Ie: lacking Normal distributions, Assumptions: homoskadisticity, equality of variance 

# Robust regression: A sampling of packages
help(package = "robust")
help(package = "robustbase")
help(package = "MASS")  # See rlm ("robust linear model")
help(package = "quantreg")  # Quantile regression: using for this example

# Example from "quantreg" package
install.packages("quantreg")
require(quantreg)
?rq  # Help on "quantile regression" in quantreg package
data(engel)
?engel
attach(engel) # Way of making short cut references 

# Create empty dataframe 
plot(income,  # Create plot frame
     foodexp,
     xlab = "Household Income",
     ylab = "Food Expenditure",
     type = "n", 
     cex = .5)

# Put points in for data 
# Conventional scatter plot
points(income,  # Points in plot
       foodexp,
       pch = 16,
       col = "lightgray")
# Notice looking at the scatter plot - the outliers hanging way out in space
# This is an example of heteroskedasticity- variance changes as you go accross.
# Quantile regression is good with heteroskedasticity 
# b/c standard linear regression gets messed up with far outliers.

taus <- c(.05, .1, .25, .75, .9, .95)  # Quantiles
taus


# Use these values to calculate verticle height of quantile reg. lines
# Sequence going accross G- range of min & max income 
xx <- seq(min(income), max(income), 100)  # X values - not charted go into calculation of reg. lines
xx
# Get coefficiants & refer to quantiles 
f <- coef(rq((foodexp)~(income), tau=taus))  # Coefficients
f

# Use xx & f to calculate values of y in each of the regression lines
yy <- cbind(1, xx)%*%f  # Y values
yy

# For loop going through each quantile value and drawing lines 
for(i in 1:length(taus)){  # For each quantile value...
  lines(xx, yy[, i], col = "black")  # Draw regression
}

# Draw regression lines 
abline(lm(foodexp ~ income),  # Standard LS regression - pulled by outlier
       col = "darkred",
       lwd = 2) # two pixel stick 

abline(rq(foodexp ~ income),  # Median regression - less influenced by outlier
       col = "blue",
       lwd = 2) # two pixel stick 

# Notice that the abline for the quantile regression (rq) was less influenced by outlier
# Gives a much better picture of what's going on than standard regression 

# Add a legand - 3000 on houshold income/ 1000 on food expenditure 
legend(3000, 1000,  # Plot legend
       c("mean fit", "median fit"), # what to plot 
       col = c("darkred", "blue"),
       lty = 1, # solid line = 1
       lwd = 2) # 2 pixel thick 

# Clean up - remember to detach 
detach(engel)
detach("package:robust", unload=TRUE)
detach("package:quantreg", unload=TRUE) 
detach("package:MASS", unload=TRUE)
detach("package:rrcov", unload=TRUE)
rm(list = ls())  
dev.off()
