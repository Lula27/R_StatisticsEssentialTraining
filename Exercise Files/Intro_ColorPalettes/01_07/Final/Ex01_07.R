# R Statistics Essential Training
# Ex01_07
# Importing data

# EXCEL FILES
# Don't do it
browseURL("http://cran.r-project.org/doc/manuals/R-data.html#Reading-Excel-spreadsheets")

# TEXT FILES
# Load a spreadsheet that has been saved as tab-delimited text file
# Need to give complete address to file
# This command gives an error on missing data
# but works on complete data
# "header = TRUE" means the first line is a header
# For macs 
trends.txt <- read.table("~/Desktop/R/GoogleTrends.txt", header = TRUE)
?read.table

# For windows 
trends.txt <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R_StatisticsEssentialTraining\\Exercise Files\\Ch01\\01_07\\GoogleTrends.txt",
                         fill = TRUE, header = TRUE) 

# This works with missing data by specifying the
# separator: \t is for tabs, sep = "," for commas
# R converts missing to "NA"
trends2.txt <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R_StatisticsEssentialTraining\\Exercise Files\\Ch01\\01_07\\GoogleTrends.txt",
                          header = TRUE, sep = "\t")
str(trends2.txt)  # This gives structure of object sntxt
# Or click on file in Workspace viewer, which brings up this:
View(trends2.txt)
?View

# CSV FILES
# Don't have to specify delimiters for missing data
# because CSV means "comma separated values"
trends.csv <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R_StatisticsEssentialTraining\\Exercise Files\\Ch01\\01_07\\GoogleTrends.csv", 
                       header = TRUE)
str(trends.csv)
View(trends.csv)

rm(list = ls())  # Clean up
