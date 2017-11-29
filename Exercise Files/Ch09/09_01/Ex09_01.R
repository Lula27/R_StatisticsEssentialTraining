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
coef(reg1) # List coefficiants for regression
confint(reg1) # List confidence intervals for regression - I think if one is in the intereval, it isn't significant
resid(reg1) # List residuals 
hist(residuals(reg1))  # Histogram of residuals 

# Stepwise Regression 
browseURL("https://onlinecourses.science.psu.edu/stat501/node/329") # background on stepwise regressions


# Backwards stepwise regression
# Repeating the first regression model, which contains
# all of the predictor variables and serves as the 
# starting point
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + 
           DECI + PREP + FAMI + ORAL + WRIT + PHYS, 
           data = USJudgeRatings) 
# state order - step regression going backward
regb <- step(reg1, 
             direction = "backward",
             trace = 0) # don't print steps
summary(regb)

# Forwards stepwise regression
# Start w/ model that has nothing but a constant 
reg0 <- lm(RTEN ~ 1, data = USJudgeRatings) # Minimal model
reg0 # prints intercept = 7.602 

regf <- step(reg0, # Start with minimal model
             direction = "forward",
             scope = (~ CONT + INTG + DMNR + DILG + 
                        CFMG + DECI + PREP + FAMI +
                        ORAL + WRIT + PHYS),
             data = USJudgeRatings,
             trace = 0)
summary(regf)
              

# Clean up 
rm(list = ls())
dev.off()
