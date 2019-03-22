# R Statistics Essential Training
# Ex07_07
# Creating crosstabs for categorical variables
# Analyzing data w/ 2 categorical variables using 
# Chi-Squared Test for Independence aka. Crosstabs 
# Example: using Titanic dataset, want to know survival proportions based on class

# Load data
?Titanic
str(Titanic) # get structure 
View(Titanic)
ftable(Titanic)  # Makes "flat" table - won't use (condensed approach)

# Convert table to data frame with one row per observation
tdf <- as.data.frame(lapply(as.data.frame.table(Titanic), function(x)rep(x, as.data.frame.table(Titanic)$Freq)))[, -5]  
? as.data.frame
tdf[1:5, ]  # Check first five rows of data

# Create contingency table =  rows & columns of crosstab 
# Consists of frequences
# table(df$row, df$column) 
ttab <- table(tdf$Class, tdf$Survived)
ttab 

# Change frequences previously generated into percentages 
# Call also get cell, row, and column %
# With rounding to get just 2 decimal places
# Multiplied by 100 to make %
round(prop.table(ttab, 1), 2) * 100 # row % - most relevant in this example
round(prop.table(ttab, 2), 2) * 100 # column %
round(prop.table(ttab), 2) * 100    # cell %

# Chi-squared test - inferential test 
# Save it as object in order to work with diagnostics post test 
tchi <- chisq.test(ttab)
tchi

# Additional tables
tchi$observed   # Observed frequencies (same as ttab)
tchi$expected   # Expected frequencies

# Different residuals using different methods of standardization
tchi$residuals  # Pearson's residual
tchi$stdres     # Standardized residual

rm(list = ls())  # Clean up
