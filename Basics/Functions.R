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



