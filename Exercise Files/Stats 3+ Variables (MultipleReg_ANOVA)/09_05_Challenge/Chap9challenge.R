# Chapter 9 Challenge - Cluster Analysis 
# Conduct a hierarchical Cluster Analysis of States using the StateClusterData.csv
# Include a dendrogram & one with cluster boxes 
browseURL("http://www.statsoft.com/Textbook/Cluster-Analysis") # Background on cluster analysis
 

# Load dataset from csv file
stSearch <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch09\\09_05_Challenge\\StateClusterData.csv", header = TRUE)

# First 5 rows - 
stSearch[1:5, ] 
# Notice the numbers going down the side / also states are listed
# We want to restructure it so that state isn't it's own variable but rather, linked to the Google searches

# The reason why my plot didn't come out correctly was because I didn't restructure data set/ 
# Without that, it'll be just a bunch of numbers, no labels - this fixes that!
# Restructure dataset 
# Use first column (state) as rownames 
rownames(stSearch) <- stSearch[,1]
stSearch[,1] <- NULL # remove first column (state) because it now has null values
stSearch[1:5, ]

# Note: 5 clusters based on the column names 

# Step 1: Get distance matrix (dissimilarity matrix)
d <- dist(stSearch) # Notice after dropping the first column, no more warning
d

# Step 2: Use distance matric for clustering
c <- hclust(d) # hierarchical cluster 
c

# Step 3: Plot dendrogram of clusters
plot(c)


# Step 4: Draw boxes around clusters - see the split between clusters
rect.hclust(c, k = 2, border = "yellow")
rect.hclust(c, k = 3, border = "green")
rect.hclust(c, k = 4, border = "darkred")
rect.hclust(c, k = 5, border = "blue")


# Clean up
rm(list = ls())
dev.off()
