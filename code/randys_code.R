## read in and clean burbot assessment larva data

# load dependencies
library(tidyverse)
# stringr and tidyr are a part of tidyverse so you only need to load tidyverse


raw_data <- read.csv('data/Burbot_Larval Assessment.csv')

clean_data <- raw_data %>%
  group_by(REPRESENTATIVE_TRS) %>%
  summarize(count = sum(FREQUENCY)) %>%
  separate(REPRESENTATIVE_TRS, 
           into = c("Township", "Range", "Section", "Section Location"), 
           sep = "/") %>%
  mutate(Section = as.numeric(Section)) %>%
  mutate(Section = str_pad(Section, width = 2, pad = "0")) %>%
  na.omit() %>%
  mutate(TWNRNSEC = paste0(Township, Range, Section))



# Export the entire data frame to a CSV file
write.csv(SuperCleanData, "data/SuperCleanBurbotData", row.names = FALSE)


