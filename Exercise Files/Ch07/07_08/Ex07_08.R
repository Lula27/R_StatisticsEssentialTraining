# R Statistics Essential Training
# Ex07_08
# Computing robust statistics for bivariate associations 
# Using quantile regression 
# Useful for times when you don't have assumptions to proceed with standard reg
# Ie: lacking Normal distributions, Assumptions: homoskadisticity, equality of variance 
# Reference for plotting
browseURL("https://www.statmethods.net/advgraphs/parameters.html")


# Example from "quantreg" package 
require(quantreg)
?rq  # Help on "quantile regression" in quantreg package
data(engel)
?engel
# Attach engel to quickly access short cut references 
attach(engel)

# Quantile regression process 
# Create empty dataframe 
plot(income, # create plot frame
     foodexp,
     xlab = "Household Income",
     ylab = "Food Expenditure",
     type = "n",
     cex = .5)
# cex - 	number indicating the amount by which plotting text and symbols should be scaled relative to the default. 
# 1=default, 1.5 is 50% larger, 0.5 is 50% smaller, etc.



# Put points in for data 
# Conventional scatter plot
points(income, # Points in plot
       foodexp,
       pch = 20, # pch= option to specify symbols to use when plotting points
       col = "darkblue")
# Outliers mean that this is a heteorskedastic plot - perfect for quantile regression

# Fit plots on line
taus <- c(.05, .1, .25, .75, .9, .95) # Quantiles


# Use these values to calculate verticle height of quantile reg. lines
# Sequence going accross G- range of min & max income 
xx <- seq(min(income), max(income), 100) # X values - not charted go into calculation of reg. lines

# Get coefficiants & refer to quantiles 
# rm(f) - note: one missing ( cused it to be null and mess up code for yy
f <- coef(rq((foodexp)~(income), tau=taus)) # Coefficients
f
# Use xx & f to calculate values of y in each of the regression lines
yy <- cbind(1, xx)%*%f  # Y values 

# For loop going through each quantile value and drawing lines 
for(i in 1: length(taus)){
  lines(xx, yy[, i], col = "darkgray")
}


# Draw regression lines 
# Standard LS regression - pulled by outlier: poor performance in this case
abline(lm(foodexp ~ income),
       col = "darkred",
       lwd = 2) # two pixels 

# Median regression: Quantile reg line - less influenced by outlier: perfect for accounting for heteroskadasticity
abline(rq(foodexp ~ income),
       col = "green",
       lwd = 2) 

# Add legand - 3000 on houshold income/ 1000 on food expenditure 
legend(3000, 1000, 
       c("mean fit", "median fit"),
       col = c("darkred", "green"),
       lty = 1,
       lwd = 2)


legend(3000, 1000,  # Plot legend
       c("mean fit", "median fit"), # what to plot 
       col = c("darkred", "blue"),
       lty = 1, # solid line = 1
       lwd = 2) # 2 pixel thick 

# Summary: This matters because using a regular regression adhearing to the assumptions of a standard linear regress
# (ie: Normal distribution, homoskadistacity, etc), you generate the model that fits your plots. 
# If you fit a standard linear regression plot on data that don't meet those assumptions, you creat problems. Bad assestment, inacurate predictions.
# Notice here that the standard linear regession determines that food expenditure is less slightly less sensitive to household income.
# The quantile regression model which accounts for heteorskedasticity (presence of outliers way out) shows that food expenditure is much more influenced by hinc.
# The impact is much more noticible with increases in hinc (around 1050)


# Clean up 
detach(engel)
detach("package:quantreg", unload = TRUE)
rm(list = ls())
dev.off()
