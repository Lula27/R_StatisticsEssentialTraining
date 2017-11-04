# R Statistics Essential Training
# Ex01_09
# Working with color
# Use R Color Brewer to jazz up graphs

# Barplot - generated with vector
# Create vector 
x <- c(7, 7, 17, 4, 13, 8, 27)
length(x) # lenght of vector is 7 - so seven bars

barplot(x)

# RColorBrewer
browseURL("http://colorbrewer2.org/")

# Download and install RColorBrewer package
install.packages("RColorBrewer")
# Get more detail
help(package = "RColorBrewer")
# Load package
require("RColorBrewer")

# display palates
display.brewer.all()

# Show palates individually (number, "name")
# Number = number of desired colors
display.brewer.pal(8, "Accent") # qualitative - useful for marking diff. grps
display.brewer.pal(3, "Accent")
display.brewer.pal(4, "Spectral")

# Barplots
# Save palettes as a vector or call in function
blues <- brewer.pal(6, "Blues")
flor <- brewer.pal(7, "Spectral")
plum <- brewer.pal(7, "RdPu")
earth <- brewer.pal(7, "BrBG")
sun <- brewer.pal(7, "YlOrRd")


# Make colorful barplot
barplot(x, col = blues)
barplot(x, col = flor)
barplot(x, col = plum)
barplot(x, col = earth)
barplot(x, col = sun)
