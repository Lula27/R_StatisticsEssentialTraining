# Chapter 9 Challenge - Cluster Analysis 
# Conduct a hierarchical Cluster Analysis of States using the StateClusterData.csv
# Include a dendrogram & one with cluster boxes 
browseURL("http://www.statsoft.com/Textbook/Cluster-Analysis") # Background on cluster analysis
 
?header
# Load dataset from csv file
statesResp <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch09\\09_05_Challenge\\StateClusterData.csv", header = TRUE)

# First 5 rows
statesResp[1:5, ]

# Drop runny nose (4) and save in new object/dataset
# sResp <- statesResp[, c(1:4, 6:13)]
#rm(sResp)
#sResp[1:5, ]
# Conduct Hierarchical Cluster Analysis 
# Note: 5 clusters based on the column names 

# Step 1: Get distance matrix (dissimilarity matrix)
d <- dist(statesResp) # Keep getting warning - N
d

# Step 2: Use distance matric for clustering
c <- hclust(d)
c

# Step 3: Plot dendrogram of clusters
plot(c)

# Step 4: Put observations in groups (choosing 4 groups)
g5 <- cutree(c, k = 5)
g5

# Step 5: Draw boxes around clusters - see the split between clusters
rect.hclust(c, k = 2, border = "yellow")
rect.hclust(c, k = 3, border = "green")
rect.hclust(c, k = 4, border = "red")
rect.hclust(c, k = 5, border = "purple")


# Clean up
rm(list = ls())
dev.off()
