# Week 3
# T-test Exercises 

babies <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\babies.txt", header = TRUE)
View(babies)
str(babies)


# split into 2 birth weight datasets

# Access package 
require(dplyr)
require(RCurl)

# non-smoking mothers 
df <- read.table(C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\babies.txt", header = TRUE)
btw.nonsmoke <- filter(babies, babies$smoke == 0) %>% select(bwt) %>% unlist 

rm(babies)

# Re-do  - access dataset 
library(downloader)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)

# Read data 

babies <- read.table("babies.txt", header=TRUE) 

head(babies)

rm(out)
