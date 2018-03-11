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
plot(values, heightecdf(values),type = "1" 
     xlab = "a (Height in inches)", ylab = "Pr(x <= a)") 

# Creates bubbly plot 
plot(values, heightecdf(values), 
     xlab = "a (Height in inches)", ylab = "Pr(x <= a)") 


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
countriesy52 <- unlist(gapminder, gapminder$year == 1957
                     & gapminder$lifeExp <= 40 )

head(countriesy52)

# Clean up 
rm(list = ls())
dev.off()
