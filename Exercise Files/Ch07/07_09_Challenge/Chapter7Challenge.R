# Challenge for Chapter 7
# Comparing Proportions 

# Using the Data for Major League Baseball - mlb2011.csv
# Outcome: "HomeWins" as proportion of "AllWins"
# Compare all 30 teams at once 
# Compare just highest and lowest - Which teams won highest percentage of games at home?

# Brainstorm: most likly need proportion table - table 

# Acces datafile - don't forget header = TRUE
rm(mlb)
mlb <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch07\\07_09_Challenge\\mlb2011.csv', header = TRUE)

# Review data
mlb[1:5, ]

# Proportion test of all team names & home games 
# What's the difference btw a prop.test & a prop.table?!
?prop.table # useful for acessing two numerical values, not categorical 
?prop.test
#prop.table(mlb$HomeWins, mlb$AllWins) - won't work: Error in margin.table(x, margin) : 'x' is not an array
prop.test(mlb$HomeWins, mlb$AllWins)
# p-value: p-value = 0.9956

# Clean up and gather ideas from Ex7_07
rm(list = ls())
