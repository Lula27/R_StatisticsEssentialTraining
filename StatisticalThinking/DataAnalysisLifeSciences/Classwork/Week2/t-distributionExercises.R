# CLT and t-distribution in Practice Exercises
# Central Limit Theorum applies when events are independent. 

# Ex: observe proportion of times we see 6 when rolling n=100 die 

n <- 100
n2 <- 1000

x <- sample(1:6, n, replace=TRUE)

# proportion of 6's we get from rolling dice 100x 
mean(x==6) # 0.24 


# How about with a coin flip? 
# What are proportion of flips turn out to be heads? 
# 1 = heads/ 0 = tails

y <- sample(0:1, n, replace=TRUE)
y
mean(y==1) # heads = 0.49 
mean(y==0)

y2 <- sample(0:1, n2, replace=TRUE)
y2
mean(y2==1) # heads = 0.528 
mean(y2==0) # 0.472 



