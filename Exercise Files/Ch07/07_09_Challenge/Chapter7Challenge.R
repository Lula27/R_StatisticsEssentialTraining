# Challenge for Chapter 7
# Comparing Proportions 

# Using the Data for Major League Baseball - mlb2011.csv
# Outcome: "HomeWins" as proportion of "AllWins"
# Compare all 30 teams at once 
# Compare just highest and lowest - Which teams won highest percentage of games at home?

# Brainstorm: most likly need proportion table - table 

# Acces datafile
mlb <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch07\\07_09_Challenge\\mlb2011.csv')


# Place the data into a dataframe for analysis 
mlbdf <- as.data.frame(lapply(as.data.frame(mlb), function(x)rep(x, as.data.frame.table(mlb)$Homewins)))



# Get structure of dataset
str(mlb)




# Clean up and gather ideas from Ex7_07
rm(list = ls())
