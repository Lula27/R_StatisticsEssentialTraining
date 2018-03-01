#First assessment: Run swirl Exercise
install.packages("swirl")
library(swirl)

R.Version()

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

# 4
class(cars)


?nrows
