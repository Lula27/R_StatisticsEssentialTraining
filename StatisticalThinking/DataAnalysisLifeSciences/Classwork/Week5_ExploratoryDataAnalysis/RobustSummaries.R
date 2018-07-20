# Mann-Whitney-Wilcoxon Test Exercises

# 1. Perform a t-test of x and y, after adding a single chick of weight 200 grams to x (the diet 1 chicks).
# What is the p-value from this test? The p-value of a test is available with the following code: t.test(x,y)$p.value
data("ChickWeight")

# Take a look at the weights of all observations over time and color the points to represent the Diet:
str(ChickWeight)
head(ChickWeight)

# Plot it - color the points to represent diet 
# Plot shows that rows are time (days) - what we want is to have the rows per chick 
plot( ChickWeight$Time, ChickWeight$weight, 
      col=ChickWeight$Diet)


# Reshape the data so that each row is a chick in order to facilitate comparison of weights at different time points and across different chicks
chick = reshape(ChickWeight, idvar=c("Chick", "Diet"), timevar="Time", 
                direction="wide")

head(chick)


# Remove any chicks that have missing observations at any time points. 
# Identify rows and remove nulls: 
chick = na.omit(chick)


# Median, MAD, and Spearman Correlation 
#1. How much does the average of chick weights at day 4 increase if we add an outlier measurement of 3000 grams? 
x <- c(chick$weight.4)
x
mean(x) # mean weight of chicks at day 4: 60.15556

# Append 3000 to vector x 

y <- append(x, 3000, after = length(x))
y
mean(y) # new mean weight after adding 3000: 124.0652 - nope...didn't work

mean(y)/mean(x) # Difference in means = 2.062407

# Quicker way to do this
chickout <- c(chick$weight.4, 3000) # Simple way to include 3000 at end

# get mean difference 
mean(chickout) / mean(c(chick$weight.4)) # 2.062407 - not robust 


#2. Compute the same ratio, but now using median instead of mean.
# Specifically, what is the median weight of the day 4 chicks, including the outlier chick, divided by the median of the weight of the day 4 chicks without the outlier.
median(y)/median(x) # 1 - robust

#3. Try the same thing but using standard deviation.
sd(y)/sd(x) # 101.2859 - not robust: outlier really has an impact 


# MAD : 1.4826*(xi - MED(x))
#4. What's the MAD with the outlier chick divided by the MAD without the outlier chick?
mad(y)/mad(x) # 1 - robust 

#5. Note: Spearman Correlation is robust (depends on ranks so not affected by outliers as much). The Pearson correlation is not.
# R Pearson correlation: cor(x,y)
# R Spearman correlation: cor(x,y, method="spearman")

# Plot the weights of chicks from day 4 and day 21 - without outlier 
plot(chick$weight.4,chick$weight.21)

# Pearson Correlation 
a <- cor(chick$weight.4,chick$weight.21) # 0.4159499 
a

# Spearman correlation
cor(chick$weight.4,chick$weight.21, method = "spearman") # 0.4303941

# Add the outlier & find Pearson Correlation
plot(c(chick$weight.4, 3000), c(chick$weight.21, 3000)) # Looks jam packed - much higher correlation 

# Calculate Pearson correlation with outlier 
b <- cor(c(chick$weight.4, 3000), c(chick$weight.21, 3000)) # 0.9861002

# Calculate the difference
#  Again, divide the Pearson correlation with the outlier chick over the Pearson correlation computed without the outliers. 
b/a # 2.370719 

# Mann-Whitney-Wilcoxon Test Exercises 
#1. Perform a t-test of x and y, after adding a single chick of weight 200 grams to x (the diet 1 chicks)
# What is the p-value from this test? : 0.9380347 - fail to reject null
x <- chick$weight.4[chick$Diet == 1] # Chick weight on day 4 for chicks on diet 1
y <- chick$weight.4[chick$Diet == 4] # Chick weight on day 4 for chicks on diet 4
t.test(c(x, 200), y)$p.value

# 2. Do the same for the Wilcoxon test.
# What is the p-value from this test? 
# In addition, it has less assumptions that the t-test on the distribution of the underlying data.
wilcox.test(x,y,exact = FALSE)$p.value # Without outlier - 0.0002011939 - reject null 

# With outlier 
wilcox.test(c(x,200),y,exact = FALSE)$p.value # 0.0009840921 - Even with outlier, still reject null

# Down side to Wilcoxon-Mann-Whitney test statistic 
# In certain contexts, Wicoxon test is less powerful than t-test. (ie: small sample sizes)
# Make 3 boxplots using the following code 
library(rafalib)
mypar(1,3) # 1 frame, 3 panels
boxplot(x,y) # original 
boxplot(x,y+10) # w/ outlier y shiffed up 10 
boxplot(x,y+100) # w/ outlier y shiffed up 100 

# 3. What is the difference in t-test statistic btw. adding 10 and adding 100 to all the values in the group 'y'?
c <- t.test(x,y+10)$statistic # t-test statistic value
c # -13.36722 

d <- t.test(x,y+100)$statistic # -81.11819
d 

# Difference 
c-d # 67.75097

# 4. What is the p-value if we compare c(1,2,3) to c(4,5,6) using a Wilcoxon test?
i <- c(1,2,3)
j <- c(4,5,6)

wilcox.test(i,j)$p.value # 0.1

# What is the p-value if we compare c(1,2,3) to c(400,500,600) using a Wilcoxon test?
k <- c(400,500,600)

wilcox.test(i,k)$p.value # 0.1 

# NOtice that there is no difference even going up in sample size by a factor of 100...

# Clean up 
rm(list = ls())
dev.off()
