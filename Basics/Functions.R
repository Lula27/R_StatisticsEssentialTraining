# Functions 

browseURL("https://nicercode.github.io/guides/functions/") # Source for beginner functions
browseURL("http://adv-r.had.co.nz/Functions.html") # Advanced functions
browseURL("https://cran.r-project.org/doc/manuals/R-intro.html#Writing-your-own-functions")

# Simple function

sum.of.squares <- function(x,y) {
  x^2 + y^2
}

sum.of.squares(2,4)

# Function to add two numbers
add <- function(a,b) {
  a + b
}

add(1,2)
add(206,130)

# Function to find average
mean <- function(c,d) {
  1/2*(c + d)
}

mean(1,2)

mean(4,4)

# Clean up
rm(list = ls())


# Practice - 5/25/2018 
# Exercises 

browseURL("https://www.r-bloggers.com/programmatically-creating-text-output-in-r-exercises/")

# Exercise 1 
# Print out the following vector as prices in dollars (to the nearest cent)
v <- c(14.3409087337707, 13.0648270623048, 3.58504267621646, 18.5077076398145,
        16.8279241011882)
print(v)
round(v, 2)

# create function 
usd <- function(value, currency.sym='$', digits=2, sep=',', decimal='.'){
  paste(
    currency.sym,
    formatC(value, format = 'f', big.mark = sep, digits = digits, decimal.mark = decimal),
    sep = " "
  )
}

usd(v)
