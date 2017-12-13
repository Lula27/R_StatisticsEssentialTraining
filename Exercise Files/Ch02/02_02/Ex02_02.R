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