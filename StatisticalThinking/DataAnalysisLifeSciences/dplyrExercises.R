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


# Access dataset by downloading from online
library(downloader)
url = "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)


# Method A: Install dplyr - change mind, just download all class datasets instead
install.packages("dplyr")

 # load dplyr 
library(dplyr)


filename <- basename(url)
download(url, filename)

# Access dataset 

msleep <- read.csv("msleep_ggplot2.csv")
View(msleep)

rm(msleep)

class(msleep)


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
