# Week 1: dplyr Exercise 
# Overview: explore new dataset related to mammalian sleep 
# Sources 
browseURL("https://github.com/genomicsclass/labs/blob/master/intro/dplyr_tutorial.Rmd")

# dpylr = powerful R-package that transforms & summarizes tabular data with rows and columns

# install package
install.packages("downloader")


# Access dataset by downloading from online
library(downloader)
url = "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)


# Install dplyr
install.packages("dplyr")

 # load dplyr 
library(dplyr)


filename <- basename(url)
download(url, filename)

# Access dataset 

msleep <- read.csv("msleep_ggplot2.csv")
View(msleep)

class(msleep)
