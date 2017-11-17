# R Statistics Essential Training
# Ex07_07
# Creating crosstabs for categorical variables
# Analyzing data w/ 2 categorical variables using 
# Chi-Squared Test for Independence aka. Crosstabs 
# Example: using Titanic dataset, want to know survival proportions based on class


# Load data
?Titanic
data("Titanic")
View(Titanic)
# get structure 
str(Titanic)

# Convert table to data frame with one row per observation 
# tdf <- as.data.frame(lapply(as.data.frame.table(Titanic), function(x)rep(x, as.data.frame.table(Titanic)$Freq)))[, -5]
tdf1 <- as.data.frame(lapply(as.data.frame.table(Titanic), function(x)rep(x, as.data.frame.table(Titanic)$Freq)))
tdf1
# Now re-create with [,-5] <- what this does is create a fifth column & compile frequencies into it
tdf <- as.data.frame(lapply(as.data.frame.table(Titanic), function(x)rep(x, as.data.frame.table(Titanic)$Freq)))[, -5]
# Check first five rows of data
tdf[1:5, ]


# Create contingency table =  rows & columns of crosstab 
# Consists of frequences
# table(df$row, df$column) 
ttab <- table(tdf$Class, tdf$Survived)
ttab

# Change frequences previously generated into percentages 
# Call also get cell, row, and column %
# With rounding to get just 2 decimal places
# Multiplied by 100 to make % 
# row % - most relevant in this example - round(prop.table(ttab, 1), 2) * 100 
?prop.table
prop.table(ttab, 1) # margin of 1 
row <- round(prop.table(ttab, 1), 2)
row * 100



# Chi-squared test - inferential test: use contingency table, not proportion percentage table
# Save it as object in order to work with diagnostics post test 
?chisq.test
tchi <- chisq.test(ttab)
tchi # p-value < 2.2e-16 - very small p-value (way less than .05) = statitical significance to drop ho that there is no difference between group contangency tables

# Diagnostic tests - Additional tables
# Observed frequencies (same as ttab) - df$observed
tchi$observed # original proportion table

# Expected frequencies- df$expected
tchi$expected
# Rounded
round((tchi$expected), 2)


# Different residuals using different methods of standardization
# Pearson's residual - df$residuals
tchi$residuals
# Standardized residual - df$stdres
tchi$stdres
