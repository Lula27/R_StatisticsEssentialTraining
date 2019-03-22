# R Statistics Essential Training
# Ex05_03
# Merging files

# Load data
?longley
data(longley)

# Split up longley
# Similar to SQL join - need one column key to combine tables
# In this example, this will be 6 (year)
a1 <- longley[1:14, 1:6]  # Starting data
a2 <- longley[1:14, 6:7]  # New column to add (with "Year" to match)
b <- longley[15:16, ]     # New rows to add
write.table(a1, "C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch05\\05_03\\longley.a1.txt", sep="\t") # Create & save txt file
write.table(a2, "C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch05\\05_03\\longley.a2.txt", sep="\t")
write.table(b, "C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch05\\05_03\\longley.b.txt", sep="\t")
rm(list=ls()) # Clear out everything to start fresh

# Import data - read files you created in last step
a1t <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch05\\05_03\\longley.a1.txt", sep="\t")
a2t <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch05\\05_03\\longley.a2.txt", sep="\t")

# Take early years (a1t) and add columns (a2t)
# Must specify variable to match cases
a.1.2 <- merge(a1t, a2t, by = "Year")  # Merge two data frames
a.1.2  # Check results

# Add two more cases at bottom
b <- read.table("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch05\\05_03\\longley.b.txt", sep="\t")
all.data <- rbind(a.1.2, b)  # "Row Bind"
all.data  # Check data
row.names(all.data) <- NULL  # Reset row names
all.data  # Check data

rm(list=ls())  # Clean up
