# R Statistics Essential Training
# Ex09_02
# Comparing means with a two-factor ANOVA
# ANOVA are tests for hypotheses about independent categorical variables


# Load data 
# Built-in dataset "warpbreaks"
?warpbreaks
data("warpbreaks")
# Make boxplot 
boxplot(breaks ~ wool*tension, data = warpbreaks)

# Model with interaction 
aov1 <- aov(breaks ~ 
              wool + tension + wool: tension,
            data = warpbreaks)
summary(aov1)

# Additional info on model 
model.tables(aov1)
model.tables(aov1, type = "means")
model.tables(aov1, type = "effects")


# Post hoc-test
TukeyHSD(aov1)

# Clean up
remove(list = ls())