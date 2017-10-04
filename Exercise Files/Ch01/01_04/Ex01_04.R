# R Statistics Essential Training
# Ex01_04
# Installing and managing packages

# LISTS OF PACKAGES
browseURL("http://cran.r-project.org/web/views")
browseURL("http://crantastic.org")

# Sww xueewnr packages
library()
search()

# Install pacakges 
?install.packages
install.packages("ggplot2")  # Make package available; for loading in scripts
require("ggplot2") # preferred for loading in functions but can also use library()

# Documantation for packages
library(help = "ggplot2")

# Bring up examples of code 
vignette()

browseVignettes(package = "grid")

# Update packages - checks for updates
update.packages(y)
y
