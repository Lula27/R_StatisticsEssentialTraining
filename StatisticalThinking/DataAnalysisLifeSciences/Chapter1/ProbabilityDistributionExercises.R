# Explore data set from Gapminder 

# Access dataset 
install.packages("gapminder")
require("gapminder")
data("gapminder")
tail(gapminder)

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


View(gapminder)
