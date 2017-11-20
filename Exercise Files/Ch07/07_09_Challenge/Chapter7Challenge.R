# Challenge for Chapter 7
# Comparing Proportions 

# Using the Data for Major League Baseball - mlb2011.csv
# Outcome: "HomeWins" as proportion of "AllWins"
# Compare all 30 teams at once 
# Compare just highest and lowest - Which teams won highest percentage of games at home?

# Brainstorm: most likly need proportion table - table 

# Acces datafile - don't forget header = TRUE
mlb <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch07\\07_09_Challenge\\mlb2011.csv', header = TRUE)

# Review data
mlb[1:5, ]
str(mlb)

# Sumarize dataset 
require(psych) # Or just manually check it in packages
describe(mlb)

# Proportion test of all team names & home games 
# What's the difference btw a prop.test & a prop.table?!
?prop.table # useful for acessing two numerical values, not categorical 
?prop.test
#prop.table(mlb$HomeWins, mlb$AllWins) - won't work: Error in margin.table(x, margin) : 'x' is not an array
prop.test(mlb$HomeWins, mlb$AllWins)
# p-value: p-value = 0.9956 <- probably the highest p-val I've ever seen. Shows that what we're seeing is so close to being a random chance.


# Run another test- specify which team had the highest and lowest home wins, test to see if difference in their proportions are due to chance 
# Find the teams who had the highest frequency of homewins 
mlb

# Successes (n) <- HomeWins: min = 31 (Florida Marlins,  Houston Astros); max = 57 (Milwaukee Brewers)
# Create vector of successes 
n <- c(31, 31, 57)

# Trials (x) <- Allwins 
x <- c(72, 56, 96)

# Run another prop.test using these three teams
# prop.text(succeses, total trials)
# p-value = 0.1028 <- fail to reject null 
prop.test(n, x)


# Try for only two teams
a <- c(31, 57) # successes 
b <- c(56, 96) # trials - teams with the largest difference

# Run prop test
prop.test(a, b)
# p-value = 0.7538 - fail to reject null

# Clean up and gather ideas from Ex7_07
rm(list = ls())
