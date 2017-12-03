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
