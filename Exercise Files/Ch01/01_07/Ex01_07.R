# R Statistics Essential Training
# Ex01_07
# Importing data

# Don't export dirctly from Excel - use CSV or text files 
# This command gives an error with missging data but 
# Works well on complete data - no empty spaces
trends.txt <- read.table("C:/Users/loret/Desktop/DataSciencePrep/R_StatisticsEssentialTraining/Exercise Files/Ch01/01_07/Final/GoogleTrends")

# above not working...wonder why

?read.table

str(trends.txt)

# CSV Files 
trends.csv <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R_StatisticsEssentialTraining\\Exercise Files\\Ch01\\01_07\\Final\\GoogleTrends",
                       header = TRUE)
