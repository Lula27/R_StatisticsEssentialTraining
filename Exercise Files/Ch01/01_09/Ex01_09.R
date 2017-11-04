# R Statistics Essential Training
# Ex01_09
# Working with color
# Use R Color Brewer to jazz up graphs

# Barplot - generated with vector

x <- c(7, 7, 17, 4, 13, 8, 27)
barplot(x)

# RColorBrewer
browseURL("http://colorbrewer2.org/")

# Download and install RColorBrewer package
install.packages("RColorBrewer")
# Get more detail
help(package = "RColorBrewer")
# Load package
require("RColorBrewer")
