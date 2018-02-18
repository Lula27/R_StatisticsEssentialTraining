# Week 1: dplyr Exercise 
# Overview: explore new dataset related to mammalian sleep 
# Sources 
browseURL("https://github.com/genomicsclass/labs/blob/master/intro/dplyr_tutorial.Rmd")

# dpylr = powerful R-package that transforms & summarizes tabular data with rows and columns

# get working directory 
getwd()

# Change working directory: setwd()

# install package
install.packages("downloader")



# Method A: Install dplyr - change mind, just download all class datasets instead
install.packages("dplyr")

 # load dplyr 
library(dplyr)


filename <- basename(url)
download(url, filename)



# Method B: Working through Github - Download the data package
install.packages("devtools")

# Access library 
library(devtools)
install_github("genomicsclass/dagdata") # So files for the class are now on my computer

# Access class files
dir <- system.file(package="dagdata") # extract location of package
list.files(dir)
list.files(file.path(dir, "extdata")) # external data in directory

# Read the file 
filename <- file.path(dir, "extdata/femaleMiceWeights.csv")

fmweight <- read.csv(filename)  # access dataset 
View(fmweight)

# Overview of dataset: first 6 rows 
head(fmweight)
tail(fmweight)

browseURL("http://genomicsclass.github.io/book/pages/dplyr_intro.html")
# Focus on just the bodyweight (second column) for mice on the chow diet 

# Access dplyr library
library(dplyr)

chow <- filter(fmweight, Diet=="chow")
View(chow)
head(chow)

# Select bodyweights for mice with chow diet 
# Select only column with the values: 
cweights <- select(chow, Bodyweight)
head(cweights)
View(cweights)

# Use pipe to perform consecutive tasks 
# in dplyr = %>% (pipe)
chowVals <- filter(fmweight, Diet=="chow") %>% select(Bodyweight)
head(chowVals)

class(cweights) # dataframe
class(chowVals)  

# Change to simple numeric vector 
chowVals <- filter(chow, Diet=="chow") %>% select(Bodyweight) %>% unlist
class(chowVals) # numeric vector 

# How to get numeric vector values in R without dplyr 
chowVals <- fmweight[fmweight$Diet=="chow", colnames(fmweight)=="Bodyweight"]
View(chowVals) 

rm(list=ls())

# Homework exercises 
# Access dataset by downloading from online
library(downloader)
url = "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url, filename)

# Access dataset 

msleep <- read.csv("msleep_ggplot2.csv")
View(msleep)

class(msleep)

# Now use the filter function to select only the primates.
nrow(msleep) # number of rows in dataset 

library(dplyr)

apes <- filter(msleep, order=="Primates") %>% select(name) #%>% unlist
View(apes)
nrow(apes) # 12 rows 
