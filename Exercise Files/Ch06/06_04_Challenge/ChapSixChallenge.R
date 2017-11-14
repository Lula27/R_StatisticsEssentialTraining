# Chapter 6 challenge
# Goal: create grouped boxplots using searchdata.csv 
# searchdata.csv  <- using google correlate, relative popularity 
# use outcome nfl <- zscore of how common that term is in each state search
# break down by group - region


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


# use package for different stats magic
# Transpose to create scatterplot
d.nflreg <- t(nflreg[-1])
barplot(d.nflreg)

# Create columns
graph2 <- colnames(d.nflreg) <- nflreg[, 1]

barplot(graph2)

# Nope, not really working - re-watch videos and work magic! 