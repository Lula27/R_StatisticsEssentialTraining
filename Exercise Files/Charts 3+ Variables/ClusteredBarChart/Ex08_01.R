# R Statistics Essential Training
# Ex08_01
# Creating clustered bar chart for frequencies

# Goal: see how often different types of wool break under tension
# Three variables 
# Outcome: number of breaks <- type of wool (A or B) * tension factor (L,M,H)


# Load data
# Built-in dataset "warpbreaks"
?warpbreaks
# loom = fixed length of yarn 
# warp breaks = number of breaks in yarn during weaving 
data("warpbreaks")
str(warpbreaks)


# Doesn't work: Creating first barplot with breaks(output) as 
# an interaction of wool & tension
barplot(breaks ~ wool*tension, data = warpbreaks)
# Result: Error in barplot.default(breaks ~ wool * tension, data = warpbreaks) : 
# 'height' must be a vector or a matrix


# Restructure dataset to work with a different barplot formatting 
?tapply # apply a function over a ragged array - 
# Apply a function to each cell of a ragged array, that is to each (non-empty) 
# group of values given by a unique combination of the levels of certain factors.
data <- tapply(warpbreaks$breaks, 
               # list two predictors
               list(warpbreaks$wool, warpbreaks$tension),
               mean) # function you want to get from dataset is mean

# Create barchart
barplot(data, # dataset
        beside = TRUE, # place factors right next to each other
        col = c("steelblue3", "thistle3"), # color scheme
        bor = NA, # remove boarders
        main = "Mean Number of Warp Breaks\n by Tension and Wool",
        xlab = "Tension",
        ylab = "Mean Number of Breaks")

# Dynamically add legend
legend(locator(1),
       rownames(data),
       fill = c("Steelblue3", "thistle3"))

# Clean up
rm(list = ls())
dev.off()
