# R Statistics Essential Training
# Ex08_06_Solution
# Creating Scatterplot Matrices

# Load data
gsd <- read.csv('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch08\\08_05_Challenge\\SearchData.csv', header = TRUE)

gsd[1:5, ] # observe first five rows of dataset 

# Scatterplot matrix using "pairs" - Why is my paired scatterplot not appearing in plots?
# Put histograms on the diagonal (from "pairs" help)
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )  # Creating a vector first two rows from usr, not sure what 0 & 1.5 refer to
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y,  ...)
  # Removed "col = "cyan" from code block; original below
   rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...) 
}

pairs(gsd[c(2:4, 8:9)],  # Select specific columns (nba, nfl, fifa, degree & age)
      panel = panel.smooth,  # Optional smoother
      main = "Scatterplot Matrix for Google Search Data Using Pairs Function",
      diag.panel = panel.hist, 
      pch = 16, 
      col = "lightgray")


# Scatterplot matrix using "cars"
library(car)
require(RColorBrewer)

scatterplotMatrix(~ nba + nfl + fifa + degree + age,
                  data = gsd,
                  col = brewer.pal(3, "Set2"),
                  main="Scatterplot Matrix for Google Search Data Using \"car\" Package")

# Clean up
detach("package:RColorBrewer", unload=TRUE)
detach("package:car", unload=TRUE)
rm(list = ls())