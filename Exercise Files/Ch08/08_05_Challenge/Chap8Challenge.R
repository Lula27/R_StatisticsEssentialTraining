# Chapter 8 Challenge - Scatterplot Matrix 

# Data: SearchData.csv
# Variables: nba, nfl, fifa, degree & age 
# Graph using "pairs"
# Graph using "scatterplotMatrix" from "car"

# Access file 
data <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch08\\08_05_Challenge\\SearchData.csv', header = TRUE)


# get structure 
str(data)
data[1:5, 1:3]

# Plot to get understanding of distribution
hist(data$nba)
hist(data$nfl)
hist(data$fifa)
hist(data$degree)
hist(data$age)

# Boxplots
boxplot(data$nba, data$nfl, data$fifa) 
# looks like nba has hightest average of searches (based on z-score standardization of search)

boxplot(data$degree, data$age)
# average age seems to be late 30s 

# Access color brewer
require("RColorBrewer")


# Graphing with scatterplots - Standard Scatterplot matrix
?pairs

panel.hist <- function(x, ...)
{
  usr <- par('usr'); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5))
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
}


pairs(data[1:4],
      panel = panel.smooth,
      main = "Scatterplot for Google Sports Search Data using Pairs Function",
      diag.panel = panel.hist,
      pch = 16, 
      col = brewer.pal(3, "Paired"))

# Use the car package to quickly generate a more accessible paired scatterplot
require("car")
scatterplotMatrix(~nba + nfl + fifa + degree | age,
                  data = data,
                  col = brewer.pal(3, "RdBu"),
                  main = "Scatterplot Matrix for Google Sports Search Data Using\n Car Package")
