#First assessment: Run swirl Exercise
install.packages("swirl")
library(swirl)

R.Version()
?Control

version # this is correct 

v <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
mean(v)

n <- 25 
i <- 1

# 3 
for (i in 1:n) {
  i^2
  print(i)
}


# practice with for loops
for(i in 1:5) 
{ 
  print(1:i)
}
  

for(i in 1:10)
{
  print(1) # prints out 1, 10 times 
} 

for(i in 1:5) 
{
  print(2*i) # prints (2*1), (2*2), (2*3), (2*4), (2*5)
}  

# 3 
i <- 1:25 
for(i in 1:25) 
{
  print(sum(i^2)) 
}   

# ok...start small. for loop for i^2 up to 3
a <- 1 + (2)^2 + (3)^2 
a # a = 14 

# get the for loop to result in 14
for(i in 1) 
{
  i <- 1:3 
  print(sum(i^2)) 
}

# correct answer 
for(i in 1) 
{
  i <- 1:25
  print(sum(i^2)) 
}

# What exactly is going on here? 
for(n in c(2,5,10,20,50)) {
  x <- stats::rnorm(n)
  cat(n, ": ", sum(x^2), "\n", sep = "")
}

# 4 
class(cars)

#5 - How many rows does the cars object have? 
?nrow
nrow(cars)

# 6 - What is the name of the second column of cars?
?colnames()
colnames(cars)

# 7 - The simplest way to extract the columns of a matrix or data.frame is using [. 
# For example you can access the second column with cars[,2]. 
# What is the average distance traveled in this dataset?

dist <- cars[,2] # select second row of cars dataset 
dist
mean(dist)


?which
which(ll <- c(TRUE, FALSE, TRUE, NA, FALSE, FALSE, TRUE)) #> 1 3 7 # OH OK...prints out indeces for where in c, 11 is (1, 3, 7)
which(1:10 > 3, arr.ind = TRUE)

( m <- matrix(1:12, 3, 4))  # created a 3 X 4 matrix with numbers 1-12
div.3 <- m %% 3 == 0 
div.3
which(div.3) # bullion matrix for numbers divisible by 3 
which(div.3) # prints row 3:  3  6  9  12 

dis.85 <- cars$dist == 85
dis.85
which(dis.85) # 50 

nrow(cars)
View(cars$dist) # right! The last row (#50) has a distance of 85

# Which rows < 17

less17 <- cars$dist < 17
less17
which(less17)

x <- c(1, 4, 5, NA, 0, -1)

# Getting Started Exercises 

fm <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\extdata\\femaleMiceWeights.csv")
fm

# 1 - report the exact name of the column containing the weights (Bodyweight)

# Entry in 12th row & 2nd column
fm[12,2]

# 3 
fmweight <- fm$Bodyweight # extract column from table and return as vector
View(fmweight) 
# weight of mouse in 11th row
fmweight[11]

# 4 - The length function returns the number of elements in a vector. How many mice are included in our dataset?
length(fmweight)

v1 <- seq(3,7) # create vector with numbers 3 to 7
v1

v2 <- 3:7
v2

# Select only hf mice weight 
hf <- fmweight[13:24]
hf

# mean of hf mice 
mean(hf)

# select only chow mice weight 
chow <- fmweight[1:12]
chow

# mean of chow diet bodyweight 
mean(chow)


# 6 - set.seed(1) = sample of size 1
set.seed(1)
s <- sample(13:24)
?sample

rm(s)

# recall, hf <- fmweight[13:24]

sample(hf, size = 1)

# Why is it that right after I ran the code for set seed,
# I get the right number? But before/after, keep getting random numbers?

# Clean workspace 
rm(list = ls())
