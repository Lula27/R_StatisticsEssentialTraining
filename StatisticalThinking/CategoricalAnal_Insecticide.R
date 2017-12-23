# Association btw quantitative & categorical variables 

?InsectSprays
data("InsectSprays")
str(InsectSprays) # count <- numerical variable  # spray <- categorical 

# R automatically processes data types allowing us to do side-by-side bxpls 
# Boxplot 
plot(count~spray, data=InsectSprays,
     xlab="Types of Insecticide",
     ylab="Counts of Insects")
# From boxplot - looks like most effective insecticide are C,D & E (with C lowest mean for count of insects)

# Run anova to find differences in groups 
anova(lm(count~spray, data = InsectSprays))
# p-val: < 2.2e-16 ***
# indicates the patterns we see in the above plot is quite unlikely to occur purely by chance


# Make more boxplots 
# Straight from the box 
require(MASS)
boxplot(InsectSprays$count ~ InsectSprays$spray)

# Jazz up boxplot with colors
require("RColorBrewer")
boxplot(InsectSprays$count ~ InsectSprays$spray,
        col = brewer.pal(6, "Set3"),
        names = c("A",
                  "B",
                  "C",
                  "D",
                  "E",
                  "F"),
      boxwex = 0.5, # width of box
      whisklty = 1, # whisker line type: 1 = solid line
      outpch = 16, # outlier symbole: 16 = filled circle 
      outcol = brewer.pal(8, "Set3"), # outlier color 
      main = "Effects of Insecticides on Insects",
      xlab = "Insecticide",
      ylab = "Insect Count"
      )

# Clean up 
detach("package:MASS", unload = TRUE)
detach("package:RColorBrewer", unload = TRUE)
rm(list = ls())
