# R Statistics Essential Training
# Ex09_06_Solution
# Cluster analysis

# Load data
scd <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch09\\09_05_Challenge\\StateClusterData.csv", header = TRUE)
# Restructure dataset so you can effectively perform cluster analysis 
rownames(scd) <- scd[,1]  # Use state names for row names
scd[,1] <- NULL  # Remove state names as variable (get rid of first column)
scd[1:5, ]

# We'll use hierarchical clustering
d <- dist(scd)  # Distance matrix
c <- hclust(d)  # Get clusters
plot(c)  # Dendrogram

# Draw boxes around clusters
rect.hclust(c, k = 2, border = "gray")
rect.hclust(c, k = 3, border = "blue")
rect.hclust(c, k = 4, border = "green4")
rect.hclust(c, k = 5, border = "darkred")

rm(list = ls())  # Clean up
dev.off()
