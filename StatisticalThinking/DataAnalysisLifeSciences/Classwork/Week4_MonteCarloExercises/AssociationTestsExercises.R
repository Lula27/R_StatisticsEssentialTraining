# Association Tests Exercises 

d <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\Classwork\\Week4_MonteCarloExercises\\assoctest.csv")
View(d)
head(d)

# 1. Compute the Chi-square test for the association of genotype with case/control status (using the table() function and the chisq.test() function).  
# What is the X-squared statistic? 3.3437

tab <- table(d$allele, d$case)
tab

# Run chisquare test 
chisq.test(tab)

# 2. Compute the Fisher's exact test for the same table. 
# What is the p-value? 0.05194 
fisher.test(tab)
