# Analyzing data by Subgroups
# Dataset: ToothGrowth
# Groups: "supp"
# Compare means on "len"
# Compare medians on "len"

?ToothGrowth # dataframe with 60 obervations on 3 variables (1 - len: numeric Tooth length)
View(ToothGrowth)


# Compare means on len
aggregate(ToothGrowth$len ~ ToothGrowth$supp, FUN = mean)


# Compare medians on len
aggregate(ToothGrowth$len ~ ToothGrowth$supp, FUN = median)
