# R Statistics Essential Training
# Ex01_05
# Using R’s built-in datasets

?datasets


# Take a look at datasets R has already stored. 
library(datasets)
require(datasets)

# See list of availabe datasets
data()

# Load dataset into workspace
data("airmiles")

# See contents of dataset - don't have to load since internally stored
airmiles

# See structure of dataset 
?str
str(airmiles)

# Load dataset with rows and columns
?anscombe
data(anscombe)
str(anscombe)

# Clean up workspace by removing existing datasets so they don't load next session
rm(list = ls())

# Clean console - Ctrl + L 

