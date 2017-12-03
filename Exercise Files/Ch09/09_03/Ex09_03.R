# R Statistics Essential Training
# Ex09_03
# Conducting a cluster analysis - group cases based on similarities in senerios in dataset
# Want to know how long it takes for each of the cars to become relatively 
# Similar in terms of distance. 
# To read number of clusters, go accross horizontally at each height level in dendrogram. 


?mtcars
data(mtcars) # load data
str(mtcars)
# View first 5 rows
mtcars[1:5, ]
# select variables - 1:4, 6:7, 9:11
mtcars1 <- mtcars[, c(1:4, 6:7, 9:11)] # all rows, specify columns
# Look at first 5 rows again
mtcars1[1:5, ]

# We'll use hierarchical clustering - start separate and combine
# Need distance matrix (dissimilarity matrix) 
d <- dist(mtcars1) # Find out how similar/differ each of the cars in each case
d # Huge matrix - says how similar each of the cars are to each other 


# Use distance matrix for clustering
# Complete cluster method using Euclidean distance 
c <- hclust(d)
c

# Plot dendrogram (branches in Greek) of clusters 
# tells you how long it will take for each car to become relatively closer to each other in terms of distance
plot(c)


# Put observations in groups
# Need to specify either k = groups or h = height
# "g3" = "groups 3" (k=3); split it into 3 clusters
g3 <- cutree(c, k=3)
g3

# Or do several levels of groups at once
# "gm" = "groups/multiple"
gm <- cutree(c, k = 2:5) # Clusters 2 - 5
gm

# Draw boxes around clusters - see the split between clusters (k = ?)
# Split is based on similarity in dataset (based on variables in model, different variables would give you different clusters)
rect.hclust(c, k = 2, border = "yellow")
rect.hclust(c, k = 3, border = "blue")
rect.hclust(c, k = 4, border = "green4")
rect.hclust(c, k = 5, border = "red")
