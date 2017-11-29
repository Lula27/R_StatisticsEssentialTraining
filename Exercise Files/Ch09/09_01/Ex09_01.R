# R Statistics Essential Training
# Ex09_01
# Computing a multiple regression

# Load data
data("USJudgeRatings")
USJudgeRatings[1:10, ]

str(USJudgeRatings)
?USJudgeRatings

# Goal: figure out how these 10 factors affect RTEN (y = worthy of retention)
# regressionName <- lm(y ~ a, b, c, ...)
# Run regression
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + CFMG + DECI 
           + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)

# see regression output 
reg1

# Statististically significant variables: Intercept, INTG, PHYS
summary(reg1)

# More detailed summaries
anova(reg1) # Why are so many more variables now statistically significant?
coef(reg1)
confint(reg1)
