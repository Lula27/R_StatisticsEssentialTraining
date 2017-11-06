# R Statistics Essential Training
# Ex02_01
# Creating bar charts for categorical variables
# Basic graph for categorical variables = bar chart 

# PART 1 
# LOAD DATASETS PACKAGE
datasets::chickwts

# ONE ROW PER CASE
?chickwts

# Look at data
chickwts

# Load data into workspace
?data
data(chickwts)

# Quickest Method - Plot feed from chickwts
plot(chickwts)

# Plot after selecting the variable feed 
plot(chickwts$feed)




# PART 2 - Customize with your plot - jazzzzz it up!
# Create variable as a table with the feeds variable 
feeds <- chickwts$feed 
rm(feeds)

# Create variable as a table with the feeds variable 
feeds <- table(chickwts$feed)
feeds

# Order decreasing
barplot(feeds[order(feeds, decreasing = TRUE)])

# Customize the chart
# Sets outside margins: b, l, t, r 


