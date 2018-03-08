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

# What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?
countriesy52 <- unlist(gapminder, gapminder$year == 1957
                     & gapminder$lifeExp <= 40 )

head(countriesy52)
