# Install packages & libraries 

browseURL("https://uoftcoders.github.io/rcourse/lec04-dplyr.html#lesson_preamble")
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

# Year level analysis 
years <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(year) %>%
  filter(weight == max(weight)) %>% 
  select(year, genus, species, weight) %>%
  arrange(year)


# Tally used to summarize categorical data 
surveys %>% 
  group_by(taxa) %>%
  tally() 

# Use tally() to group on multiple variables - counting total number of records for each category 
surveys %>% 
  group_by(taxa, sex) %>%
  tally()

# View 5 most abundant species among observations 
surveys %>% 
  group_by(species) %>% 
  tally() %>% 
  print(n = 15)

# Order table to display most abundent species first - use arrange()
surveys %>%
  group_by(species) %>% 
  tally() %>% 
  arrange(n)

# Display most abundant species - highest counts first - arrange n in descending order 
surveys %>%
  group_by(species) %>%
  tally() %>%
  arrange(desc(n)) %>%
  head(15)

# Include more attributes about these species 
surveys %>%
  group_by(species, taxa, genus) %>% 
  tally() %>%
  arrange(desc(n)) %>%
  head(5)

# Number of individuals caught in each plot type surveyed 
surveys %>% 
  group_by(plot_type) %>%
  tally 

# Alternative for number of individuals caught in each plot type surveyed 
surveys %>% 
  group_by(sex) %>%
  summarize(n = n())

# Plotting with ggplot2 
ggplot(data = surveys)

# If arguments in right order, you can omit argument names 
ggplot(surveys)

# Add aesthetics (aes)
ggplot(surveys, aes(x = weight, y = hindfoot_length))

# Create subset for quicker plotting
survey_subset <- sample_n(surveys, size = 5000)

head(survey_subset)

# Plot weight against hindfoot length 
ggplot(survey_subset, aes(x = weight, y = hindfoot_length)) + 
  geom_point()

# Plot years - time series 
ggplot(years, aes(x = year, y = weight)) + 
  geom_line()

# Add transparancy (alpha) to reduce overplotting 
ggplot(data = survey_subset, aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.2)

# Add color - look familiar? ... clustering ho! 
#  Coloring the data points according to a categorical variable is an easy way to find out if there seems to be correlation.  
ggplot(survey_subset, aes(x = weight, y = hindfoot_length, color = plot_type)) + 
  geom_point(alpha = 0.2)

# Based on plot, create variable with 4-5 values to help explain observed pattern in scatter plot 
surveys %>% 
  summarize_all(n_distinct)

# Sex = 3 b/c there are still NAs 

# Use taxa cus there are only 4 of those 
surveys %>% 
  distinct(taxa)

# Use categorical variable to color scatterplot - looks like just 1 cluster with rodent 
ggplot(survey_subset, aes(x = weight, y = hindfoot_length, color = taxa)) + 
  geom_point()

# Figure out what's happening by grouping using taxa 
# Rodent classification dominates - most animals in dataset = roadents
surveys %>% 
  group_by(taxa) %>% 
  tally() %>%
  arrange(desc(n))

# Review data for hindfoot measurements 
surveys %>% 
  filter(!is.na(hindfoot_length)) %>%
  group_by(taxa) %>%
  tally()

# Remove all animals that haven't had hindfeet measured - including rodents that didn't 
surveys_hf_wt <- surveys %>%
  filter(!is.na(hindfoot_length) & !is.na(weight))

surveys_hf_wt %>% 
  summarize_all(n_distinct)

# Try classifying (grouping) with genus 
ggplot(surveys_hf_wt, aes(x = weight, y = hindfoot_length, color = genus)) + 
  geom_point(alpha = 0.2)

# Separate observations into different species 
# Looks like 5 clusters but 21 species in legend 
ggplot(surveys_hf_wt, aes(x = weight, y = hindfoot_length, color = species)) + 
  geom_point(alpha = 0.2)

surveys %>%  
  filter(!is.na(hindfoot_length) & !is.na(weight)) %>% 
  group_by(species) %>%
  tally() %>%
  arrange(desc(n))

# Only include species with more than 800 observations 
# only about 10k rows removed 
surveys_abun_species <- surveys %>% 
  filter(!is.na(hindfoot_length) & !is.na(weight)) %>%
  group_by(species) %>% 
  mutate(n = n()) %>% # add count value to each row 
  filter(n > 800) %>% 
  select(-n)

surveys_abun_species

# Plot about 25k observations 
ggplot(surveys_abun_species, aes(x = weight, y = hindfoot_length, color = species)) + 
  geom_point(alpha = 0.2)

# Create scatterplot of hindfoot_length over species with weight showing in different colors 
ggplot(surveys_abun_species, aes(x = weight, y = species, color = hindfoot_length)) + 
  geom_point(size = 0.1, position = 'jitter')


