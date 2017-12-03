# R Statistics Essential Training
# Ex09_03
# Conducting a cluster analysis - group cases based on similarities in senerios in dataset
# Want to know how long it takes for each of the cars to become relatively 
# Similar in terms of distance. 
# To read number of clusters, go accross horizontally at each height level in dendrogram. 


# Load data
?mtcars
data(mtcars)
mtcars[1:5, ]
mtcars1 <- mtcars[, c(1:4, 6:7, 9:11)]  # Select variables - drop some (ie: vs)
mtcars1[1:5, ]

# Three major kinds of clustering:
#   1. Split into set number of clusters (e.g., kmeans) , k - groups
#   2. Hierarchical: Start separate and combine
#   3. Dividing: Start with a single group and split

# We'll use hierarchical clustering
# Need distance matrix (dissimilarity matrix)
d <- dist(mtcars1) # Find out how similar/differ each of the cars in each case
d  # Huge matrix - says how similar each of the cars are to each other 

# Use distance matrix for clustering
c <- hclust(d) # Complete cluster method using Euclidean distance 
c

# Plot dendrogram (branches in Greek) of clusters 
plot(c) # tells you how long it will take for each car to become relatively closer to each other in terms of distance

# Put observations in groups
# Need to specify either k = groups or h = height
g3 <- cutree(c, k = 3)  # "g3" = "groups 3"; split it into 3 clusters 
# cutree(hcmt, h = 230) will give same result; h = height (y-axis) on dendrogram
g3
# Or do several levels of groups at once
# "gm" = "groups/multiple"
gm <- cutree(c, k = 2:5) # or k = c(2, 4)
gm # numbers mean how many clusters there are
# Ie: Maserati Bora in different clusters each time (stands alone emperically))

# Draw boxes around clusters - see the split between clusters (k = ?)
# Split is based on similarity in dataset (based on variables in model, different variables would give you different clusters)
rect.hclust(c, k = 2, border = "red")
rect.hclust(c, k = 3, border = "blue")
rect.hclust(c, k = 4, border = "green4") # Masserati Bora is the only one in it's own cluster
rect.hclust(c, k = 5, border = "darkred")

# k-means clustering
km <- kmeans(mtcars1, 3) # Created 3 clusters w/ different cases (11, 4, 17)
# Gives means of each cluster on each variable <- used to from a centroid
# Centroid = center on multiple dimensions (9 variables = 9 dimensional center)
km   

# Graph based on k-means
require(cluster)
clusplot(mtcars1,  # data frame
         km$cluster,  # cluster data
         color = TRUE,  # color
#          shade = TRUE,  # Lines in clusters
         lines = 3,  # Lines connecting centroids
         labels = 2)  # Labels clusters and cases

rm(list = ls())  # Clean up
dev.off()
