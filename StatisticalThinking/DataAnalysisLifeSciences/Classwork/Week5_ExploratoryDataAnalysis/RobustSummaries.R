# Mann-Whitney-Wilcoxon Test Exercises

# 1. Perform a t-test of x and y, after adding a single chick of weight 200 grams to x (the diet 1 chicks).
# What is the p-value from this test? The p-value of a test is available with the following code: t.test(x,y)$p.value
data("ChickWeight")

# Take a look at the weights of all observations over time and color the points to represent the Diet:
head(ChickWeight)

# Plot it
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)


# Reshape the data so that each row is a chick in order to facilitate comparison of weights at different time points and across different chicks
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")

head(chick)


# Remove any chicks that have missing observations at any time points. 
# Identify rows and remove nulls: 
chick = na.omit(chick)

# Mann-Whitney-Wilcoxon Test Exercises 
#1. Perform a t-test of x and y, after adding a single chick of weight 200 grams to x (the diet 1 chicks)
# What is the p-value from this test? 
x <- chick$weight.4[chick$Diet == 1]
y <- chick$weight.4[chick$Diet == 4]
t.test(c(x, 200), y)$p.value