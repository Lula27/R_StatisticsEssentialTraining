# QQ-plot Exercises 

# load data into R
load('C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\StatisticalThinking\\DataAnalysisLifeSciences\\Classwork\\Week5_ExploratoryDataAnalysis\\skew.RData')

dim(dat) # [1] 1000    9

str(dat)

names(dat)

# Using QQ-plots, compare the distribution of each column of the matrix to a normal. 
par(mfrow = c(3,3))

# Use for loop to loop through columns and display one qqnorm() plot a t a time
for (i in 1:9) {
  x <- dat[,i]
  qqnorm(x, xlab = "quantiles", main = paste0("Col No=", i))
  qqline(x)
}


# Plot multiple histograms 
par(mfrow = c(3,3))

# Use for loop to loop through columns and display one histogram plot at a time
for (i in 1:9) {
  x <- dat[,i]
  hist(x, xlab = "X", main = paste0("Col.No", i))
}


# Boxplot Exercises 
head(InsectSprays)



# Using split 
boxplot(split(InsectSprays$count, InsectSprays$spray))


# Using formula 
boxplot(InsectSprays$count ~ InsectSprays$spray)


# 2. Use boxplots and histograms to compare the finishing times of males and females.
# Which of the following best describes the difference?
data(nym.2002, package = "UsingR")
str(nym.2002)

head(nym.2002)

require(dplyr)
males <- filter(nym.2002, gender=="Male")
females <- filter(nym.2002, gender=="Female")

# Compare finishing time btw. males & females
boxplot(males$time, females$time)

# With histogram 
hist(males$time, xlim = c(range( nym.2002$time))) 
hist(females$time, xlim = c(range( nym.2002$time)))

# Scatterplot Exercises 
# 1. For males, what is the Pearson correlation btw. age and time to finish? 
cor(males$age,males$time) # 0.2432273

# 2. For females, what is the Pearson correlation between age and time to finish?
cor(females$age, females$time) # 0.2443156

# 3. Look at scatterplots and boxplots of times stratified by age groups (20-25, 25-30, etc..).
# After examining the data, what is a more reasonable conclusion?
require(rafalib)
mypar(2,2)
plot(females$age, females$time)
plot(males$age, males$time)
group <- floor(females$age/5) * 5
boxplot(females$time~group)
group <- floor(males$age/5) * 5
boxplot(males$time~group)


# 