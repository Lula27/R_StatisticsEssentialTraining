# R Statistics Essential Training
# Ex04_03
# Computing composite variables



# Create variable rn1 with 1 million random normal values
# Will vary from one time to another 
rn1 <- rnorm(1000000)
hist(rn1)
summary(rn1)


# Create variable rn2 with 1 million random normal values
rn2 <- rnorm(1000000)
hist(rn2)
summary(rn2)

# Average scores across two variables
avg = (rn1 + rn2) / 2
hist(avg)
summary(avg)



# Multiply scores across two variables - notice how different this looks from previously 
# Result of multiplying to random normal distributions is very perculiar 
# Cauchy distribution - high levels of skewness, Statistical monster
# Because of strange behavior.
mult = rn1 * rn2
hist(mult)
summary(mult)

# Kurtosis comparisons
# The package "moments" gives kurtosis where a
# mesokurtic, normal distribution has a value of 3.
# The package "psych" recenters the kurtosis values
# around 0, which is more common now.
# Use Psych but the package Moments can also be used. 
require(psych)
?kurtosi
kurtosi(rn1) # = 1.471101e-05
kurtosi(rn2) # = -0.003607685
kurtosi(avg) # = 0.007720733
kurtosi(mult) # = 5.952692

# Clean up
detach("package:psych", unload = TRUE)
rm(list = ls())
dev.off()
