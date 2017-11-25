# Chapter 8 Challenge - Scatterplot Matrix 

# gssd: Searchgssd.csv
# Variables: nba, nfl, fifa, degree & age 
# Graph using "pairs"
# Graph using "scatterplotMatrix" from "car"

# Access file 
# Note: Call your gssdset something useful (not one of the keywords in R)
# Save gssdset in object called gssd (Google sports search gssd)
gssd <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch08\\08_05_Challenge\\SearchData.csv', header = TRUE)

# get structure 
str(gssd)
gssd[1:5,]  # Not bad with trying to access specific variables (nba=2, nfl=3, fifa=4, degree=8 & age=9 )
gssd[1:5, 2:4 & 8:9]

# Plot to get understanding of distribution
hist(gssd$nba)
hist(gssd$nfl)
hist(gssd$fifa)
hist(gssd$degree)
hist(gssd$age) # Left skewed: The outlier - one bin to far left is Utah (relatively young state). 

# Boxplots
boxplot(gssd$nba, gssd$nfl, gssd$fifa) 
# looks like nba has hightest average of searches (based on z-score standardization of search)

boxplot(gssd$degree, gssd$age)
# average age seems to be late 30s 

# Access color brewer & car libraries 
require("RColorBrewer")
require("car")

# Graphing with scatterplots - Standard Scatterplot matrix
?pairs

# Create mold for histograms 
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5))
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
}

pairs(gssd[c(2:4, 8:9)],
      panel = panel.smooth,
      main = "Scatterplot Matrix for Google Search Data Using Pairs Function",
      diag.panel = panel.hist,
      pch = 16, 
      col = "blue")


# Scatterplot using Cars 
library(car)
library(RColorBrewer)

scatterplotMatrix(~ nba + nfl + fifa + degree + age, 
                  data = gssd,
                  col = brewer.pal(3, "Set2"),
                  main = "Scatterplot Matrix for Google Search Data Using \"car\"Package")


# Create basic scatterplot to examine distribution of degree, age & region 
# Create mold for histograms 
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5))
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
      panel = panel.smooth,
      main = "Scatterplot Matrix for Demographics of Google Sports Searchers",
      diag.panel = panel.hist,
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
}

pairs(gssd[c(8:10)],
      pch = 16, 
      col = "gray")

# Plot Paired Scatterplot w/ Car package 
scatterplotMatrix(~ degree + age + region,
                  data = gssd,
                  col = brewer.pal(3, "BrBG"),
                  main = "Scatterplot Matrix for Google Search Data Using \"car\"Package")

# Clean up
?detach
detach('package:RColorBrewer', unload = TRUE)
detach('package:car', unload = TRUE)
rm(list = ls())
