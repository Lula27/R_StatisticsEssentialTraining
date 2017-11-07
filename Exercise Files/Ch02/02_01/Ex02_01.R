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
?par
# oma = vector of form c(bottom, left, top, right) giving size of outer margins in lines of text
par(oma = c(1, 1, 1, 1))
# mar = numerical vector of form c(bottom, left, top, right) which gives # of margin to be 
# specified on four sides of plot
par(mar = c(4, 5, 2, 1))

# create barplot
# \n is line break like <br> in html 
?barplot 
barplot(feeds[order(feeds)],
        horiz  = TRUE,
        las    = 1,  # las gives orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  # No borders on bars
        main   = "Frequencies of Different Feeds\nin chickwts Dataset",  # \n = line break
        xlab   = "Number of Chicks"
        
        )
rm(list = ls()) # clear up



# Replicate with my own
Start here: http://rstudio-pubs-static.s3.amazonaws.com/2277_404d9b623e0b4dcf9fe0927c38067813.html 
datasets::attitude
