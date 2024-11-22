


## read in and clean burbot assessment larva data

# load dependencies ----
library(tidyverse)
# stringr and tidyr are a part of tidyverse so you only need to load tidyverse


raw_data <- read.csv('data/Burbot_Larval Assessment.csv')


# clean and wrangle data for joining to MI PLSS data.  Just count and TRS ----
clean_data <- raw_data %>%
  group_by(REPRESENTATIVE_TRS, Year) %>%
  
  summarize(count = sum(FREQUENCY)) %>%
  separate(REPRESENTATIVE_TRS, 
           into = c("Township", "Range", "Section", "Section Location"), 
           sep = "/") %>%
  mutate(Section = as.numeric(Section)) %>%
  mutate(Section = str_pad(Section, width = 2, pad = "0")) %>%
  na.omit() %>%
  mutate(TWNRNSEC = paste0(Township, Range, Section))



# Export the entire data frame to a CSV file
write.csv(clean_data, "data/clean_data.csv", row.names = FALSE)


# clean and wrangle data for joining to MI PLSS data.  Added in year ----

clean_data_year <- raw_data %>%
  group_by(REPRESENTATIVE_TRS, Year) %>%
  summarize(count = sum(FREQUENCY)) %>%
  separate(REPRESENTATIVE_TRS, 
           into = c("Township", "Range", "Section", "Section Location"), 
           sep = "/") %>%
  mutate(Section = as.numeric(Section)) %>%
  mutate(Section = str_pad(Section, width = 2, pad = "0")) %>%
  na.omit() %>%
  mutate(TWNRNSEC = paste0(Township, Range, Section))



# Export the entire data frame to a CSV file
write.csv(clean_data_year, "data/clean_data.csv", row.names = FALSE)


# wrangle data for time series ----

burbot_year <- raw_data %>%
  group_by(Year) %>%
  summarize(year_count = sum(FREQUENCY))


# ugly chart of count per year ----

ugly_chart <-
  ggplot(data = burbot_year, aes(x = Year, y = year_count)) +
  geom_line() +
  geom_point()

ugly_chart
