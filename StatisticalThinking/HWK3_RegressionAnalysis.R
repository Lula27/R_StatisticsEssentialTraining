# Homework 3: Simple Linear Regression Using R

# Overview of dataset 
help(state.x77) # Same thing as ?state.x77


# Make data set a dataframe 
statedata = as.data.frame(state.x77)

# 8 variables in data set
# Population: population estimate as of July 1, 1975
# Income: per capita income (1974)
# Life Exp: life expectancy in years (1969-71)
# Murder: murder and non-negligent manslaughter rate per 100,000 population (1976)
# HS Grad: percent high-school graduates (1970)
# Frost: mean number of days with minimum temperature below freezing (1931-1960) in capital or large city
# Area: land area in square miles

# Step 1: Modify column names 
# Use colnames to retrieve column names/assign new names 
colnames(statedata) = c("pop", "inc", "illit", "life.exp", "murder", "hs.grad", "frost", "area")

# Step 2: Make a scatterplot - association btw life.exp & income (inc)
# plot(y~x, data=?)
plot(life.exp~inc, data=statedata) # looks like income has a weak positive correlation with life exp

# Compute correlation btw the two variables 
browseURL("https://www.socialresearchmethods.net/kb/statcorr.php") # info on correlation

cor(statedata[,"life.exp"], statedata[,"inc"]) # 0.3402553 = weak positive correlation (-1, 1)

# Identify outlier value (really high income corresponding with low life exp) - Which state is this?
plot(life.exp~inc, data=statedata, type="n")
text(life.exp~inc, data=statedata, state.abb) # Wow! Super cool - it's AK (Alaska)...hmmmm...interesting 
?state.abb # character vector of 2-letter abbreviations for the state names



# Step 3: Fit a simple linear regression 
# y(life.exp) <- x(inc)
reg1 <- lm(life.exp ~ inc, data = statedata)
reg1 # slope estimate of inc =   7.433e-04  
# The maganitude of this value does not mean that the effect of 
# income on life expectance is very small. 
# This maganitude is decided by the maganitude of the X variable and Y variable.
summary(reg1)  # inc variable is hardly statisically significant 


# Step 4: Sampling uncertainty in regression analysis 
# Add AB Line 
plot(life.exp~inc, data=statedata,
     xlab="Income", ylab="Life Expectancy")
abline(reg1)



# Step 5: Using for loop, run identical regression analysis 
# On 4 randomly selected samples 

par(mfrow=c(2,2)) # Create panel of four plotting areas

# for loop
for(i in 1:4){
  # Plot population
  plot(life.exp~inc, data=statedata,
       xlab="Income", ylab="Life Expectancy",
       main=paste("Random sample", format(i)),
       ylim=c(min(life.exp), max(life.exp)+0.3))
  abline(reg1)
  if(i==1){
    legend(3030, 74.2,
           pch = c(NA, NA, NA, 1, 16),
           lty = c(1, 1, 2, NA, NA),
           col = c(1, 2, 2, 1, 2), 
           c("population truth", "sample estimate",
             "sample confidence band",
             "states", "sampled"),
           cex = 0.7,
           bty = "n"
           )
  }
  # Select the sample
  selected.states <- sample(1:50, 10)
  points(statedata[selected.states,"inc"],
         statedata[selected.states, "life.exp"], pch = 16, col = 2)
  
  # Fit regression line using sample 
}







