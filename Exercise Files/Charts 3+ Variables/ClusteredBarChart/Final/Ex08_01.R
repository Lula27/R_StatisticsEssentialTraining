# R Statistics Essential Training
# Ex08_01
# Creating clustered bar chart for frequencies (one t)
# Build grouped bar chart from means
# Show association btw two categorical predictor variables and 
# a single quantitative outcome - common approach in reasearch 
# Goal: see how often different types of wool break under tension
# Three variables 
# Outcome: number of breaks <- type of wool (A or B) * tension factor (L,M,H)

# Load data
# Built-in dataset "warpbreaks"
?warpbreaks
# loom = fixed lenght of yarn 
# warp breaks = number of breaks in yarn during weaving 
data("warpbreaks")
warpbreaks

# Doesn't work:
barplot(breaks ~ wool*tension, data = warpbreaks) # see if number of breaks is a product of wool & tension factors - doesn't work

# Restructure data so this will work - creates tables dataset 
data <- tapply(warpbreaks$breaks,
               list(warpbreaks$wool, # list two predictors
                    warpbreaks$tension),
               mean) # getting mean from dataset 

barplot(data, # dataset
        beside = TRUE, # group factors - right next to each other
        col = c("steelblue3", "thistle3"), # colors
        bor = NA, # Get rid of borders 
        main = "Mean Number of Warp Breaks\nby Tension and Wool", # main title
        # Chart labels
        xlab = "Tension", 
        ylab = "Mean Number of Breaks")

# For legend, "locator(1)" is interactive and lets you click
# where you want to put the legend. You can also specify
# with coordinates.
legend(locator(1), # Allows you to dynamically/interactively add legend 
       rownames(data),
       fill = c("steelblue3", "thistle3"))

rm(list = ls())  # Clean up
