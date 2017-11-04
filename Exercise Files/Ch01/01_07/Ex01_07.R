# R Statistics Essential Training
# Ex01_07
# Importing data - use CSV files! 

# Don't export dirctly from Excel - use CSV or text files 
# This command gives an error with missging data but 
# Works well on complete data - no empty spaces


# Read data file/table 
# Missing values - Won't read because there are empty spaces, use fill = TRUE
trends.txt <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R_StatisticsEssentialTraining\\Exercise Files\\Ch01\\01_07\\GoogleTrends.txt", fill = TRUE, 
                         header = TRUE)

trends.txt


?read.table

# Retreive structure of text file 
str(trends.txt)

# CSV Files 
# With CSV files, can read even with missing values
trends.csv <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R_StatisticsEssentialTraining\\Exercise Files\\Ch01\\01_07\\GoogleTrends.csv",  
                       header = TRUE)
trends.csv

str(trends.csv)
View(trends.csv)

rm(list = ls())  # Clean up - clears from environment 