# R Statistics Essential Training
# Ex03_01
# Calculating frequencies using Frequency Tables 
dev.off() # Removes previous plot 

# LOAD DATASET
# Data is the number of hits (in millions) for each word on Google
groups <- c(rep("blue",   3990),
            rep("red",    4140),
            rep("orange", 1890),
            rep("green",  3770),
            rep("purple",  855))



# CREATE FREQUENCY TABLES
# Will automatically order it based on group name (alphabetically )
?table
freqtbl <- table(groups)
# Print table 
freqtbl 

# USE SORT() TO MODIFY FREQUENCY TABLES - order based on decreasing values
?sort
sfreqtbl <- sort(freqtbl, decreasing = TRUE)
sfreqtbl

# PROPORTIONS AND PERCENTAGES 
# Give proportions of total - prop 
?prop.table()
psfreqtbl <- prop.table(sfreqtbl)
psfreqtbl

# round & calculate percentage * 100 

# Give proportions w/2 decimal places
round(psfreqtbl, 2) 

# Give percentages w/o decimal places
round(psfreqtbl, 2) * 100


# Clean up
rm(list = ls())


# Good job! Tip - next time, call your object something intuitive! 
