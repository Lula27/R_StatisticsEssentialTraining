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
reg1 <- lm(RTEN ~ CONT + )