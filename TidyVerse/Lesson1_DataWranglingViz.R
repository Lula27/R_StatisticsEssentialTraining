# Install packages & libraries 

install.packages('tidyverse')
library(tidyverse)

# Load data - doesn't work :( 
download.file(url = "https:/ndownloader.figshare.com/files/2292169", "data//combined.csv")

# Access Dataset 
# Looks like empty spaces still captured - replace with NA 
surveys <- read.csv("C:\\Users\\loret\\Desktop\\DataSciencePrep\\R\\R_StatisticsEssentialTraining\\TidyVerse\\combined.csv", header=T, na.strings = c("", "NA"))

tail(surveys)
str(surveys)

# Sum nulls 
sum(is.na(surveys)) # 5851...when empty spaces removed = 7599 

# Remove nulls 
s2 <- surveys[complete.cases(surveys), ]

#sum(is.na(s2)) # 0 

str(surveys)

# Split - apply - combine technique in dplyr 
surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight))

# Filter out NA observations 
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex) %>% 
  summarise(mean_weight = mean(weight))

# "" is neither male nor female - animal escaped before sex could be determined 
surveys %>%
  filter(!is.na(weight) & !is.na(sex)) %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight))


# Group by multiple columns 
surveys %>% 
  filter(!is.na(weight) & !is.na(sex)) %>% 
  group_by(genus, sex) %>% 
  summarize(mean_weight = mean(weight))


# Assign subset of data to new variable and use that for analysis 
filtered_surveys <- surveys %>% 
  filter(!is.na(weight) & !is.na(sex)) %>%
  group_by(genus, sex)

filtered_surveys

# Review more outputs 
filtered_surveys %>% 
  summarize(mean_weight = mean(weight)) %>% 
  print(n = 20)

# Summarize multiple variables at once - add column indicating minimum weight for each species for each sex 
# Group level analysis
filtered_surveys %>%
  summarize(mean_weight = mean(weight), 
             min_weight = min(weight))

# Find mean, min & max hindfoot length for each species
head(filtered_surveys)
# Use group_by() & summarize() to get mean, min & max hindfoot length for each species 
surveys %>%
  filter(!is.na(hindfoot_length)) %>% 
  group_by(species) %>% 
  summarize(mean_hindfoot_length = mean(hindfoot_length),
            min_hindfoot_length = min(hindfoot_length),
            max_hindfoot_length = max(hindfoot_length))