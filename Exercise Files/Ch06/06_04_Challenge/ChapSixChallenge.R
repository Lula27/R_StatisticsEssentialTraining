# Chapter 6 challenge
# Goal: create grouped boxplots using searchdata.csv 
# searchdata.csv  <- using google correlate, relative popularity 
# use outcome nfl <- zscore of how common that term is in each state search
# break down by group - region
dev.off()

# Access csv file
sportsearch <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\Exercise Files\\Ch06\\06_04_Challenge\\SearchData.csv")
View(sportsearch)
summary(sportsearch)

# Analize using aggregate of region on nfl
sportsearch$nfl
sportsearch$region

# So evidently, the quantitative variable should come first to match with the FUN assignment
nflreg <- aggregate(sportsearch$nfl ~ sportsearch$region, FUN = mean)
nflreg

# Create grouped boxplots
boxplot(sportsearch$nfl ~ sportsearch$region, FUN = mean)
boxplot(sportsearch$nfl ~ sportsearch$region)

# Make the boxplot fancy!
require("RColorBrewer")
boxplot(sportsearch$nfl ~ sportsearch$region,
        col = brewer.pal(8, "Pastel1"),
        boxwex = 0.5,
        whisklty = 1,
        staplelty = 0,
        outpch = 16,
        outcol = brewer.pal(7, "Pastel2"),
        main = "US Regional Google search interest in the NFL",
        xlab = "United States Region",
        ylab = "Google search for NFL (Z-score)"
)


# Clean up
rm(list = ls())
dev.off()

# use package for different stats magic
# Transpose to create scatterplot
d.nflreg <- t(nflreg[-1])
barplot(d.nflreg)

# Create columns
graph2 <- colnames(d.nflreg) <- nflreg[, 1]

barplot(graph2)

# Nope, not really working - re-watch videos and work magic! 