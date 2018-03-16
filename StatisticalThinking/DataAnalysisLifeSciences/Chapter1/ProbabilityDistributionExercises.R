# Cumulative Distribution Function  <- F(a) === Pr(x <= a); theoretically derived 
# Empirical CDF (ECDF) <- CDF derived from data 

library(UsingR)
x <- father.son$fheight

# select 10 random heights of 1,078 
round(sample(x,10),1)

# Plot F(a) vs a 

smallest <- floor( min(x))
largest <- ceiling(max(x))
values <- seq(smallest, largest, len=300)
heightecdf <- ecdf(x)
# For some reson, this results in an error: 
plot(values, heightecdf(values),type = "1", 
     xlab = "a (Height in inches)", ylab = "Pr(x <= a)") 

# Creates bubbly plot 
plot(values, heightecdf(values), 
     xlab = "a (Height in inches)", ylab = "Pr(x <= a)") 

# Histogram much more useful than ecdf
hist(x)

# Specify bins and create better labels
bins <- seq(smallest, largest)
hist(x, breaks = bins, xlab = "Height (in inches)", main = "Adult men heights")


# Explore data set from Gapminder 
# empirical cumulative distribution function (or empirical cdf or empirical distribution function) is the function F(a) for any a, which tells you the proportion of the values which are less than or equal to a.empirical cumulative distribution function (or empirical cdf or empirical distribution function) is the function F(a) for any a,
# which tells you the proportion of the values which are less than or equal to a.
# Access dataset 
install.packages("gapminder")
require("gapminder")
data("gapminder")
tail(gapminder)
gapminder

?gapminder 

# access dplyr 
require(dplyr)

# Plot life expectancy for Africa and Europe
gap_with_colors <- data.frame(gapminder,
                              cc = I(country_colors[match(gapminder$country, 
                                                          names(country_colors))]))

keepers <- with(gap_with_colors,
                continent %in% c("Africa", "Europe") & year == 1957)
plot(lifeExp ~ gdpPercap, gap_with_colors,
    subset = keepers, log = "x", pch = 21,
    cex = sqrt(gap_with_colors$pop[keepers]/pi)/1500, 
    bg = gap_with_colors$cc[keepers])

# Goals: select countries specifically in 1953 
# Using mean(x <= a), compute F 

View(gapminder)

# Create new data frame 
mydata <- data.frame("count" = gapminder$country, 
                     "yr" = gapminder$year, 
                     "life" = gapminder$lifeExp) 

View(mydata)

# What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?
# Use ecdf() function 
lfourty <- mydata[mydata$yr == 1952, ]
View(lfourty)

# Make dataframe into a vector using ulist 
x<- unlist(lfourty$life) 

# Plot histogram of x 
hist(x)
abline(v=40, col="red") # red line at 40 


# looks like most people in the world in 1957 died in their late 30s, early 40s 
mean(x) # average life expectancy = 49.05
median(x) # median is 45.13 

# What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?

# get ecdf of x (proportion of counties...)

# Method 1 
a <- 40 

mean(x <= a) # 0.2887324  - tells me that ~29% of life expectancies in the world in 1957 were less than 40 years 

# Method 2
ecdf(x) # Got this, not sure what to make of it: x[1:142] = 28.801,     30, 30.015,  ...,  72.49,  72.67

?ecdf


# What is the proportion of countries in 1952 that have a life expectancy between 40 and 60 years?
mean(x <= 60) - mean(x <= 40) # 0.4647887



# Plot proportions of countries with life expectancy 'q' for a range of different years
plot(ecdf(x)) # notice at 40 years, Fn(x) is 0.2 so around mean(x <= a) # 0.2887324 



# Clean up 
rm(list = ls())
dev.off()
