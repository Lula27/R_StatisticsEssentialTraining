# R Statistics Essential Training
# Ex02_02
# Creating pie charts for categorical variables 
# Note: In general, avoid pie charts because they're really hard to read


# Load Datasets Package
require("datasets")

# One row per case
data(chickwts)
View(chickwts)
str(chickwts)



# Creating a pie chart...steb-by-step
# Step 1: create frequency table
feeds <- table(chickwts$feed)
feeds

# Step 2: default pie chart - very bland 
pie(feeds)


# Modify the pie chart
pie(feeds[order(feeds, decreasing = TRUE)],
    init.angle = 90,  # Starts at 12 o'oclock instead of 3
    clockwise = TRUE, # going clockwise, Default is FALSE
    col = c("seashell", "cadetblue2", "lightpink", "lightcyan", "plum1", "papayawhip"),
    main = "Pie Chart of Feeds From Chickwts")

# PROBLEM WITH PIES 
# Generate 3 datasets
pie.a <- c(22, 14, 18, 20, 14, 12)
pie.b <- c(20, 18, 16, 18, 16, 12)
pie.c <- c(12, 14, 20, 18, 14, 22)

# Changing graphical parameters 
oldpar <- par() # store old graphical parameters
par(mfrow = c(1, 3), # Num(row, cols),
    cex.main = 3) # Main title 3x bigger
colors <- c("grey98", "grey90", "lightskyblue", "lightgreen", "grey98", "grey90")
?colors

# Three pie charts side by side - Why aren't these side by side?
pie(pie.a, main = "Pie A", col = colors)
pie(pie.b, main = "Pie B", col = colors)
pie(pie.c, main = "Pie C", col = colors)

# Three bar charts side-by-side
barplot(pie.a, main = "Bar A", col = colors)
barplot(pie.b, main = "Bar B", col = colors)
barplot(pie.c, main = "Bar C", col = colors)

# For some reason, my plots aren't showing up side-by-side

# Restore old graphical parameters
par(oldpar)

rm(list = ls()) # Clean up
dev.off() # Clear up graphs
