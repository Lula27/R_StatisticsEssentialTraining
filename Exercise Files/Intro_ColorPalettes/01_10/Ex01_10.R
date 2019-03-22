# R Statistics Essential Training
# Ex01_10
# Exploring Color with RColorBrewer
# Create my own color palate


# Create barplot with uniform height
n <- 7 # number of bars
x <- c(rep(10, n)) # Creates n bars of uniform height
barplot(x, col = rainbow(n))

# Use R's build-in palettes 

# 1. Show 5 different categories
m <- 5
y <- c(rep(10, m))
barplot(y, col = rainbow(m))


# 2. Show 8 sequential value 
o <- 8
z <- c(rep(10, o))
barplot(z, col = heat.colors(z))

# 3. Show 11 divergent values
p <- 11
a <- c(rep(10, p))
barplot(a, col = cm.colors(p))

# Use RColorBrewer 
require("RColorBrewer")
display.brewer.all()

# 4. Show 7 different categories
q <- 7
b <- c(rep(10, m))
barplot(q, col = brewer.pal(q, "Set1"))
display.brewer.pal(q, "Set1") # Shows combined together 

# 5. Show 6 sequential values
r <- 6
c <- c(rep(10, r))
barplot(c, col = brewer.pal(r, "BuPu"))
display.brewer.pal(r, "Set1")

# 6. Show 9 divergent values
s <- 10
d <- c(rep(10, s))
barplot(d, col = brewer.pal(s, "PRGn"))

# Clean up
detach("package:RColorBrewer", unload = TRUE) # remove package
rm(list = ls())
