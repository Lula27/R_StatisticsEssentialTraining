# R Statistics Essential Training
# Ex01_08
# Converting tabular data to row data
# Using dataset from admissions at UC Berkley in 1973
# This dataset is famous for inhabiting Simpson's Paradox - https://en.wikipedia.org/wiki/Simpson%27s_paradox

# Problem: data not in format you need to work with
# Example: Can't process & analyze tabular data because it doesn't come in rows & columns
# Tabulare data = count data 
# Solution: Convert tabular data into rows & columns to conduct standard analysis 


# Step 1 - Load data - use embedded R data set- UCBAdmissions

?UCBAdmissions
# look at structure
str(UCBAdmissions)

# Look at dataset 
UCBAdmissions

# Step 2 - Find Marginal Frequencies

# Regardless of department, how many admitted/rejected? 
# Specify data set - use $ to indicate particular variable 
admin.fail <- (UCBAdmissions$Admit)
# Can't set dataframe (admin.fail) Returns Error in UCBAdmissions$Admit :
# $ operator is invalid for atomic vectors
# Atomic vector = simplest R data type; linear vectors of a single primitive type

# Try generating barplot - won't work
barplot(UCBAdmissions$Admit)
# Try scatter plot - worked but hard to read 
plot(UCBAdmissions)


# Get marginal frequencies from original table 
?margin.table
margin.table(UCBAdmissions, 1) # Admit
margin.table(UCBAdmissions, 2) # Gender
margin.table(UCBAdmissions, 3) # Department
margin.table(UCBAdmissions) # Grand Total

# Save margins as new table
admin.dept <- margin.table(UCBAdmissions, 3)
str(admin.dept)
# graph data w/ barplot 
barplot(admin.dept)
admin.dept # Show frequencies
prop.table(admin.dept) # Show as proportions 
# use round function - round() to reduce decimal places - to two decimals
round(prop.table(admin.dept), 2)
round(prop.table(admin.dept), 2)*100 # attempt to get percents
?prop.table
?round

# Step 3 - Go from table to one row per case
admit1 <- as.data.frame(UCBAdmissions) # Coerces to data frame
# Change to a list - Repeats each row by Freq
admit2 <- lapply(admit1, function(x)rep(x, admit1$Freq))
admit2
# Change list back to data frame
admit3 <- as.data.frame(admit2)
# remove frequency column (redundant info) 
admit4 <- admit3[, -4]

# Funtion to do everything at once 
admit.rows <- as.data.frame(lapply(as.data.frame.table
(UCBAdmissions), function(x)rep(x, as.data.frame.table
(UCBAdmissions)$Freq)))[, -4]

admit.rows

# Created simple adding function 
add <- function(x)(x + 1)
add(4)
