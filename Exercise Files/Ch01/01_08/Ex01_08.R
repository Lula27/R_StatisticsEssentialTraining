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

# 
