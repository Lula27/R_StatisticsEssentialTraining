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
